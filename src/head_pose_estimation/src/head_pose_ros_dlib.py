from tf_pose.estimator import Human, BodyPart, TfPoseEstimator
from sensor_msgs.msg import Image
from tfpose_ros.msg import Persons, Person, BodyPartElm
from multiprocessing import Process, Queue

import cv2
import numpy as np

from mark_detector import MarkDetector
from os_detector import detect_os
from pose_estimator import PoseEstimator
from stabilizer import Stabilizer
import pyrealsense2 as rs
import time
from retinaface import RetinaFace
from head_pose_estimation.msg import Coord2D, GazingInfo
from approaching.msg import ApproachInfo, Coord

import rospy
import copy

CNN_INPUT_SIZE=128


class PoseHeadNode(object):

    def __init__(self):

        # subscribe
        rospy.Subscriber("/pose_estimator/pose", Persons, self.pose_cb)
        rospy.Subscriber("/camera/color/image_raw", Image, self.color_callback)

        # publish
        self.pub_headpose_info = rospy.Publisher("/headpose_info", GazingInfo, \
                                queue_size=10)
        #data
        self.humans = None
        self.color_img = None

        self.init()
        
    
    def init(self):
        
        self.detector = RetinaFace('./model/R50', 0, 0, 'net3')
        self.mark_detector = MarkDetector()
        self.pose_stabilizers = [Stabilizer(
                state_num=2,
                measure_num=1,
                cov_process=0.1,
                cov_measure=0.1) for _ in range(6)]

        sample_img = None
        #if self.color_img is None:
        #    print("None")
        #    time.sleep(0.2)
        #    
        #height, width, _ = self.color_img.shape

        self.pose_estimator = PoseEstimator(img_size=(480, 640))
    
    def pose_cb(self, data):
        
        if self.color_img is None:
            return

        h, w = self.color_img.shape[:2]

        # ros topic to Person instance
        humans = []
        for p_idx, person in enumerate(data.persons):
            human = Human([])
            for body_part in person.body_part:
                part = BodyPart('', body_part.part_id, body_part.x, body_part.y, body_part.confidence)
                human.body_parts[body_part.part_id] = part

            humans.append(human)

        self.humans = humans

        #self.image_test_pose = TfPoseEstimator.draw_humans(self.color_img, humans, imgcopy=False)
    
    def draw_pose(self, img, humans, parts=[4, 7]):

        if img is None or humans is None:
            #print("Cannot draw pose on {} image and {} humans".format(img, humans))
            return None
        
        image_h, image_w, _ = img.shape
        if parts is None or len(parts)==0:
            return TfPoseEstimator.draw_humans(img, humans, imgcopy=False)
        else:
            
            for human in humans:
                for part in parts:

                    if part in human.body_parts.keys():
                        body_part = human.body_parts[part]
                        coord = (int(body_part.x * image_w + 0.5), \
                                int(body_part.y * image_h + 0.5))
                        img = cv2.circle(img, coord, 2, (0,255,0))
            return img

    def color_callback(self, data): # Need semaphore to protect self.color_img, because it is also used by is_waving_hand function
        #print("Having color image")
        #cv_image = self.bridge.imgmsg_to_cv2(data, data.encoding)
        #print(cv_image)
        decoded = np.frombuffer(data.data, np.uint8)

        img = np.reshape(decoded, (480,640, 3))
        #print("COLOR_CALLBACK", img.shape)
        img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        self.color_img = img
    
    def get_top_vertice_human(self, human, img_w, img_h):
        sorted_id = sorted(human["pose"].body_parts.keys())
        body_part = human["pose"].body_parts[sorted_id[0]]
        return (int(body_part.x * image_w + 0.5), \
                                int(body_part.y * image_h + 0.5))
    
    def is_gazing(self, face_direction, human, img):
        
        def get_angle_direct_with_peakhand(face_direction, peak):
            d0, d1 = face_direction
            peak_direction = (peak[0] - d0[0], peak[1] - d0[1])
            face_direct    = (d1[0] - d0[0], d1[1] - d0[1])

            d_peak_direction = np.sqrt(peak_direction[0]**2 + peak_direction[1]**2)
            d_face_direct    = np.sqrt(face_direct[0]**2 + face_direct[1]**2)
            return (peak_direction[0]*face_direct[0] + \
                    peak_direction[1]*face_direct[1])/(d_peak_direction*\
                    d_face_direct)

        thresh = 0.1#0.5 #cos(PI/3)
        
        image_h, image_w, _ = img.shape
        if 4 in human.body_parts.keys():
            body_part = human.body_parts[4]
            coord = (int(body_part.x * image_w + 0.5), \
                    int(body_part.y * image_h + 0.5))
            print("angle left = ", get_angle_direct_with_peakhand(face_direction, coord))
            return get_angle_direct_with_peakhand(face_direction, coord) > thresh
        
        if 7 in human.body_parts.keys():
            body_part = human.body_parts[7]
            coord = (int(body_part.x * image_w + 0.5), \
                    int(body_part.y * image_h + 0.5))
            print("angle right = ", get_angle_direct_with_peakhand(face_direction, coord))
            return get_angle_direct_with_peakhand(face_direction, coord) > thresh

        return False

    def get_gazing_status(self, face_directions, face_coords, humans, img):

        def get_dist_to_humans(human_coords, coord):
            result = []

            for _coord in human_coords:
                result.append(np.sqrt((coord[0]-_coord[0])**2) + \
                        (coord[1]-_coord[1])**2)
            return result

        image_h, image_w, _ = img.shape
        gazing_status = []

        human_coords = []

        for human in humans:

            sorted_id = sorted(human.body_parts.keys())
            body_part = human.body_parts[sorted_id[0]]
            coord = (int(body_part.x * image_w + 0.5), \
                    int(body_part.y * image_h + 0.5))

            human_coords.append(coord)

        for fdirection, fcoord in zip(face_directions, face_coords):
            dists = get_dist_to_humans(human_coords, fcoord)
            idx = np.argmin(dists)
            gazing_status.append(self.is_gazing(fdirection, humans[idx], img))
            del human_coords[idx]

        return gazing_status
            

    def publish_headpose_info(self, viz=True):
        
        thresh = 0.8
        time.sleep(0.1)
        if self.color_img is None or self.humans is None:
            print("Color img None")
            return
        im_shape = self.color_img.shape
        #scales = [1024, 1980]
        scales = [480*2, 640*2]
        target_size = scales[0]
        max_size = scales[1]
        im_size_min = np.min(im_shape[0:2])
        im_size_max = np.max(im_shape[0:2])
        im_scale = float(target_size) / float(im_size_min)
        thresh = 0.8

        if np.round(im_scale * im_size_max) > max_size:
            im_scale = float(max_size) / float(im_size_max)

        scales = [im_scale]

        frame = copy.deepcopy(self.color_img)

        t1 = time.time()
        faceboxes = self.mark_detector.extract_cnn_facebox(frame)
        mess = "Not detect pose"
        face_directions = []
        face_coords = []
        
        if faceboxes is not None and len(faceboxes) > 0:
            if isinstance(faceboxes[1], int):
                faceboxes = [faceboxes]
            for facebox in faceboxes:
                #facebox = facebox.astype(np.int)
                # Detect landmarks from image of 128x128.
                face_img = frame[facebox[1]: facebox[3],
                                facebox[0]: facebox[2]]
                face_coords.append((int((facebox[0]+facebox[2])/2), \
                                int((facebox[1]+facebox[3])/2)))
                face_img = cv2.resize(face_img, (CNN_INPUT_SIZE, CNN_INPUT_SIZE))
                face_img = cv2.cvtColor(face_img, cv2.COLOR_BGR2RGB)

                marks = self.mark_detector.detect_marks([face_img])

                # Convert the marks locations from local CNN to global image.
                marks *= (facebox[2] - facebox[0])
                marks[:, 0] += facebox[0]
                marks[:, 1] += facebox[1]

                # Uncomment following line to show raw marks.
                self.mark_detector.draw_marks(
                     frame, marks, color=(0, 255, 0))

                # Uncomment following line to show facebox.
                # mark_detector.draw_box(frame, [facebox])

                # Try pose estimation with 68 points.
                pose = self.pose_estimator.solve_pose_by_68_points(marks)

                # Stabilize the pose.
                steady_pose = []
                pose_np = np.array(pose).flatten()
                for value, ps_stb in zip(pose_np, self.pose_stabilizers):
                    ps_stb.update([value])
                    steady_pose.append(ps_stb.state[0])
                steady_pose = np.reshape(steady_pose, (-1, 3))

                # Uncomment following line to draw pose annotation on frame.
                face_direction = self.pose_estimator.draw_annotation_box(
                    frame, pose[0], pose[1], color=(255, 128, 128))
                face_directions.append(face_direction)
                # Uncomment following line to draw stabile pose annotation on frame.
                t2 = time.time()
                mess=round(1/(t2-t1), 2)
                #self.pose_estimator.draw_annotation_box(
                #     frame, steady_pose[0], steady_pose[1], color=(128, 255, 128))
                
                # Uncomment following line to draw head axes on frame.
                #self.pose_estimator.draw_axes(frame, stabile_pose[0], stabile_pose[1])
        gazing_status = self.get_gazing_status(face_directions, face_coords, \
                copy.deepcopy(self.humans), self.color_img)
        
        msg = GazingInfo()
        msg.is_gazing = []
        msg.coords = []

        for coord, gazestatus in zip(face_coords, gazing_status):
            _coord = Coord2D()
            _coord.x = coord[0]
            _coord.y = coord[1]
            msg.coords.append(_coord)
            msg.is_gazing.append(gazestatus)

        self.pub_headpose_info.publish(msg)

        print(gazing_status)
        cv2.putText(frame, "FPS: " + "{}".format(mess), (20, 20), \
                cv2.FONT_HERSHEY_SIMPLEX,0.75, (0, 255, 0), thickness=2)
        # Show preview.
        if viz:
            frame = self.draw_pose(frame, self.humans)
            if frame is None:
                return
            cv2.imshow("Preview", frame)
            cv2.waitKey(1)


if __name__=="__main__":
    
    appnode = PoseHeadNode()
    rospy.init_node("posehead_node")
    time.sleep(1)

    while True:
        appnode.publish_headpose_info()
        #rospy.spinOnce()
    rospy.spin()

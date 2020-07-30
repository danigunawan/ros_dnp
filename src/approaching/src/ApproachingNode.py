from ApproachingDetection import ApproachingDetection
import pyrealsense2 as rs

from sensor_msgs.msg import CompressedImage
from sensor_msgs.msg import Image
from sensor_msgs.msg import CameraInfo

from tfpose_ros.msg import Persons, Person, BodyPartElm
from tf_pose.estimator import Human, BodyPart, TfPoseEstimator
from smelling_detection.msg import Rectangle, ObjectStatus
from approaching.msg import ApproachInfo, Coord

import numpy as np
import time
import cv2
import copy
import rospy
import math

class ApproachingNode(object):

    def __init__(self):
        
        # subsribe
        self.topic_pose = "/pose_estimator/pose"
        self.topic_color_img = "/camera/color/image_raw"
        self.topic_depth_img = "/camera/aligned_depth_to_color/image_raw"
        self.topic_object_status = "/object_status"
        self.topic_intrin = "/camera/depth/camera_info"
        # publish
        self.approach_info_topic = "/approach_info"

        self.humans = []
        self.color_img = None
        self.img_test_pose = None
        self.depth_img = None
        self.intrin = None

        self.init_topic()

        self.object_status = None
        self.app_detect = ApproachingDetection(None, None, False)
        self.app_detect.set_tracking_type(2)
    
    def init_topic(self):
        
        # subscriber
        rospy.Subscriber(self.topic_pose, Persons, self.pose_cb)
        rospy.Subscriber(self.topic_color_img, Image, self.color_callback)
        rospy.Subscriber(self.topic_depth_img, Image, self.depth_callback)
        rospy.Subscriber(self.topic_intrin, CameraInfo, self.intrin_callback)
        rospy.Subscriber(self.topic_object_status, ObjectStatus, self.object_status_cb)

        # publisher
        self.pub_approach_info = rospy.Publisher(self.approach_info_topic, \
                ApproachInfo, queue_size=10)

    def intrin_callback(self, data):

        #print("intrin_callback")
        self.intrin = rs.intrinsics()
        self.intrin.width = data.width
        self.intrin.height = data.height
        self.intrin.ppx = data.K[2]
        self.intrin.ppy = data.K[5]
        self.intrin.fx = data.K[0]
        self.intrin.fy = data.K[4]
        self.intrin.model = data.distortion_model
        self.intrin.coeffs = [0, 0, 0, 0, 0]

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

        self.image_test_pose = TfPoseEstimator.draw_humans(self.color_img, humans, imgcopy=False)
    
    def color_callback(self, data): # Need semaphore to protect self.color_img, because it is also used by is_waving_hand function
        #print("Having color image")
        #cv_image = self.bridge.imgmsg_to_cv2(data, data.encoding)
        #print(cv_image)
        
        decoded = np.frombuffer(data.data, np.uint8)

        img = np.reshape(decoded, (480,640, 3))
        #print("COLOR_CALLBACK", img.shape)
        img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        self.color_img = img
    
    def depth_callback(self, data):
        
        #decoded = np.fromstring(data.data, np.uint8)
        decoded = np.frombuffer(data.data, np.int16)
        img = np.reshape(decoded, (480, 640))
        self.depth_img = img

    def object_status_cb(self, data):
        
        self.object_status = data

    def get_humans(self):
        return self.humans

    def get_color_img(self):
        return self.color_img

    def identify_human_tracking(self, last_dict_humans, humans, viz=False):

        if self.color_img is not None:
            return self.app_detect.identify_human_tracking(last_dict_humans, humans\
                    ,self.color_img)
        return None
    
    def identify_human_tracking_sort(self, last_dict_humans, humans, viz=False):

        if self.color_img is not None:
            return self.app_detect.identify_human_tracking_sort(last_dict_humans, humans\
                    ,self.color_img)
        return None

    def get_depth_xy(self, x, y):

         if self.depth_img is None:
            return None

         if x >= self.color_img.shape[1]:
             x = self.color_img.shape[1] - 1
         if y >= self.color_img.shape[0]:
             y = self.color_img.shape[0] - 1

         return self.depth_img[y, x]/1000
   
    def calculate_distance(self, ix, iy, x, y):

         udist = self.get_depth_xy(ix, iy)
         vdist = self.get_depth_xy(x, y)

         point1 = rs.rs2_deproject_pixel_to_point(self.intrin, [ix, iy], udist)
         point2 = rs.rs2_deproject_pixel_to_point(self.intrin, [x, y], vdist)

         dist = math.sqrt(math.pow(point1[0] - point2[0], 2) + \
                 math.pow(point1[1] - point2[1],2) + math.pow(point1[2] - point2[2], 2))
         return dist

    def get_depth_for_humans(self, dict_humans, using_pose=False):

        image_h, image_w, _ = self.color_img.shape

        for key in dict_humans.keys():
            human = dict_humans[key]
            rect = self.object_status.object_rect[0]
            x1 = rect.x1
            x2 = rect.x2
            y1 = rect.y1
            y2 = rect.y2
            ix, iy = int((x1+x2)/2), int((y1+y2)/2)
            
            if using_pose:
                id_nose = 0
                sorted_id = sorted(human["pose"].body_parts.keys())
                body_part = human["pose"].body_parts[sorted_id[0]]
                x, y = (int(body_part.x * image_w + 0.5), \
                        int(body_part.y * image_h + 0.5))
            else:
                (x1, y1), (x2, y2) = human["box"]
                y = int((y1+y2)/2)
                x = x1 + int((y2-y1)/3)

            dist = self.calculate_distance(ix, iy, x, y)
            dict_humans[key]["dist"] = round(dist, 1)
            dict_humans[key]["coord"] = (x, y)
    
    def visualize_human(self, dict_humans, viz_obj=True):
        
        img = None

        if self.color_img is not None:
            img = self.app_detect.visualize_human(dict_humans, self.color_img)

            if viz_obj:
                for exist, rect in zip(self.object_status.exists, \
                        self.object_status.object_rect):
                    if not exist:
                        color = (0, 255, 0)
                    else:
                        color = (255, 0, 0)
                    img = cv2.rectangle(img, (rect.x1, rect.y1), \
                            (rect.x2, rect.y2), color)

        return img

    def create_first_human_dict(self, humans):

        if self.color_img is not None:
            return self.app_detect.create_first_human_dict(humans, self.color_img)
        return None

    def create_first_tracking(self, last_dict_humans):
        
        if self.color_img is not None:
            return self.app_detect.create_first_tracking(last_dict_humans, self.color_img)
        return None

    def publish_approach_info(self, dict_humans):
        
        if dict_humans is None:
            return

        msg = ApproachInfo()
        msg.ids = []
        msg.coords = []
        msg.dists = []

        for key in dict_humans.keys():
            msg.ids.append(key)
            coord = Coord()
            coord.x, coord.y = dict_humans[key]["coord"]
            msg.coords.append(coord)
            msg.dists.append(dict_humans[key]["dist"])
        print("Publish approach info, ", dict_humans.keys())
        self.pub_approach_info.publish(msg)

def main():

    appnode = ApproachingNode()
    rospy.init_node("approaching_node")
    time.sleep(1)
    last_frame = None
    last_dict_humans = None
    new_dict_humans = None
    
    cv2.namedWindow("approaching_viz", cv2.WINDOW_NORMAL)
    cv2.resizeWindow("approaching_viz", 600, 400)

    while True:

        if appnode.get_color_img() is None:
            continue

        humans = appnode.get_humans()

        if last_frame is not None and last_dict_humans is not None:
           #new_dict_humans = app_detect.identify_human(last_dict_humans, \
           #        humans, last_frame, frame, thresh=2, method="orb", viz=False)
           new_dict_humans = appnode.identify_human_tracking( \
                    last_dict_humans, humans, viz=False)
           #new_dict_humans = 
           appnode.get_depth_for_humans(new_dict_humans)
        #cv2.imshow("original", appnode.get_color_img())
        if new_dict_humans is not None:
            processed_frame = appnode.visualize_human(new_dict_humans)
        else:
            processed_frame = appnode.visualize_human(humans)
        
        last_frame = appnode.get_color_img()

        if last_dict_humans is None:
           last_dict_humans = appnode.create_first_human_dict(humans)
           appnode.create_first_tracking(last_dict_humans)

           #appnode.publish_approach_info(last_dict_humans)
        else:
            appnode.publish_approach_info(new_dict_humans)

        cv2.imshow("approaching_viz", processed_frame)
        c = cv2.waitKey(10) & 0xFF

        if c==ord('e'):
            exit()

    rospy.spin()
    cv2.destroyAllWindows()

def main_sort():

    appnode = ApproachingNode()
    rospy.init_node("approaching_node")
    time.sleep(1)
    last_frame = None
    dict_humans = dict()

    cv2.namedWindow("approaching_viz", cv2.WINDOW_NORMAL)
    cv2.resizeWindow("approaching_viz", 600, 400)

    while True:

        if appnode.get_color_img() is None:
            continue

        humans = appnode.get_humans()
        #print("Num of humans: ", len(humans))
        #
        dict_humans = appnode.identify_human_tracking_sort( \
                dict_humans, humans, viz=False)
        #print(dict_humans.keys())

        appnode.get_depth_for_humans(dict_humans)

        processed_frame = appnode.visualize_human(dict_humans)
        
        appnode.publish_approach_info(dict_humans)

        cv2.imshow("approaching_viz", processed_frame)
        c = cv2.waitKey(10) & 0xFF

        if c==ord('e'):
            exit()

    rospy.spin()
    cv2.destroyAllWindows()

if __name__=="__main__":
    
    #main_sort()
    main()


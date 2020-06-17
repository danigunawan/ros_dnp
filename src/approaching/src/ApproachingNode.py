from ApproachingDetection import ApproachingDetection
import pyrealsense2 as rs

from sensor_msgs.msg import CompressedImage
from sensor_msgs.msg import Image
from sensor_msgs.msg import CameraInfo

from tfpose_ros.msg import Persons, Person, BodyPartElm
from tf_pose.estimator import Human, BodyPart, TfPoseEstimator

import numpy as np
import time
import cv2
import copy

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

        self.image_test_pose = TfPoseEstimator.draw_humans(image, humans, imgcopy=False)
    
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
        pass

    def get_humans(self):
        return self.humans

    def get_color_img(self):
        return self.color_img

    def identify_human_tracking(self, last_dict_humans, humans, viz=False):

        if self.color_img is not None:
            return self.app_detect.identify_human_tracking(last_dict_humans, humans\
                    ,self.color_img)
        return None

    def get_depth_for_humans(self, dict_humans):

        image_h, image_w, _ = self.color_img.shape

        for key in dict_humans.keys():
            human = dict_humans[key]
            ix, iy = int((self.app_detect.object_coord[0][0] + self.app_detect.object_coord[1][0])/2),\
                    int((self.app_detect.object_coord[0][1] + self.app_detect.object_coord[1][1])/2)
            
            id_nose = 0
            sorted_id = sorted(human["pose"].body_parts.keys())
            body_part = human["pose"].body_parts[sorted_id[0]]
            x, y = (int(body_part.x * image_w + 0.5), \
                    int(body_part.y * image_h + 0.5))

            dist = self.calculate_distance(ix, iy, x, y)
            dict_humans[key]["dist"] = round(dist, 1)
    
    def visualize_human(self, dict_humans):

        if self.color_img is not None:
            return self.app_detect.visualize_human(human_info, self.color_img)
        return None

    def create_first_human_dict(self, humans):

        if self.color_img is not None:
            return self.app_detect.create_first_human_dict(humans, self.color_img)
        return None

    def create_first_tracking(self, dict_humans):
        
        if self.color_img is not None:
            return self.app_detect.create_first_tracking(last_dict_humans, self.color_img)
        return None

    def publish_approach_info(self, dict_humans):
        pass

if __name__=="__main__":
    
    appnode = ApproachingNode()
    rospy.init_node("approaching_node")
    time.sleep(1)
    last_frame = None
    last_dict_humans = None
    new_dict_humans = None
    
    while True:

        if appnode.get_color_img() is None:
            continue

        humans = appnode.get_humans()

        if last_frame is not None and last_dict_humans is not None:
           #new_dict_humans = app_detect.identify_human(last_dict_humans, \
           #        humans, last_frame, frame, thresh=2, method="orb", viz=False)
           new_dict_humans = appnode.identify_human_tracking( \
                    last_dict_humans, humans, viz=False)
           new_dict_humans = appnode.get_depth_for_humans(new_dict_humans)
        
        if new_dict_humans is not None:
            processed_frame = appnode.visualize_human(new_dict_humans)
        else:
            processed_frame = appnode.visualize_human(humans)
        
        last_frame = appnode.get_color_img()

        if last_dict_humans is None:
           last_dict_humans = appnode.create_first_human_dict(humans)
           appnode.create_first_tracking(last_dict_humans)

           appnode.publish_approach_info(last_dict_humans)
       else:
           appnode.publish_approach_info(new_dict_humans)

        cv2.imshow("Processed frame", processed_frame)
        c = cv2.waitKey(10) & 0xFF

        if c==ord('e'):
            exit()
        rospy.spinOnce()


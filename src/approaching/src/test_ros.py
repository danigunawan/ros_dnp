from ApproachingDetection import ApproachingDetection
import pyrealsense2 as rs
import sys
from os import path
sys.path.append(path.dirname(path.dirname(path.abspath(__file__))))

from sensor_msgs.msg import CompressedImage
from sensor_msgs.msg import Image as msg_Image
from sensor_msgs.msg import CameraInfo
import rospy
from queue import Queue
import numpy as np
import cv2
import time
import math
import copy
from human_skeleton import HumanSkeleton
from pandas import DataFrame

class PoseEstimatorPart(object):

    def __init__(self):
        self.intrin = None
        self.depth_img = None
        self.color_img = None
        
        rospy.Subscriber("/camera/color/image_raw/compressed", CompressedImage, \
                self.color_callback)
        rospy.Subscriber("/camera/depth/camera_info", CameraInfo, \
                self.intrin_callback)
        rospy.Subscriber("/camera/aligned_depth_to_color/image_raw", \
                msg_Image, self.depth_callback)

        self.app_detect = ApproachingDetection("config/coord.txt", "cmu")
        self.app_detect.set_tracking_type(1)

        self.humanske = HumanSkeleton()
        self.humanske.set_model(self.app_detect.get_model())

        # Threshold Approaching distance
        self.approach_far = 3.5
        self.approach_close = 2.5
        self.approach_interact = 2

        self.approach_far_times = 3 # number of time to decide customer leave
        self.approach_close_times = 10 # number of time to decide customer interact with object

        self.log = {"PersonID": [], "Prev_State": [], "State": [], "InteractionID": []}

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
    
    def depth_callback(self, data):
        
        #decoded = np.fromstring(data.data, np.uint8)
        decoded = np.frombuffer(data.data, np.int16)
        img = np.reshape(decoded, (480, 640))
        self.depth_img = img

    def color_callback(self, data): # Need semaphore to protect self.color_img, because it is also used by is_waving_hand function
        #print("Having color image")
        #cv_image = self.bridge.imgmsg_to_cv2(data, data.encoding)
        #print(cv_image)
        
        np_arr = np.fromstring(data.data, np.uint8)
        decoded = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)

        img = np.reshape(decoded, (480,640, 3))
        #print("COLOR_CALLBACK", img.shape)
        #img = cv2.cvtColor(img, cv2.COLOR_RGB2BGR)
        self.color_img = img

    def get_color_img(self):
        return self.color_img
     
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

    def get_humans(self):

        if self.color_img is not None:
            return self.app_detect.get_humans(self.color_img)
        return None

    def identify_human_tracking(self, last_dict_humans, humans, viz=False):
        
        if self.color_img is not None:
            return self.app_detect.identify_human_tracking(last_dict_humans, humans\
                    ,self.color_img)
        return None

    def get_depth_for_humans(self, dict_humans):
        
        image_h, image_w, _ = self.color_img.shape
        deleted_key = []
        new_dict_humans = dict()

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
            if "approach_far" not in dict_humans[key].keys():
                dict_humans[key]["approach_far"] = 0
            else:
                if dist >= self.approach_far and key[0]=='I':
                    dict_humans[key]["approach_far"] += 1
                if dict_humans[key]["approach_far"] >= self.approach_far_times \
                        and key[0]=='I':
                    
                    new_key = "{}3{}".format(key[0], key[2:])
                    self.log["PersonID"].append(key)
                    self.log["Prev_State"].append("Approach")
                    self.log["State"].append("Leave")
                    self.log["InteractionID"].append(new_key)

                    new_dict_humans[new_key] = dict_humans[key]
                    deleted_key.append(key)
                    #return

            if "approach_close" not in dict_humans[key].keys():
                dict_humans[key]["approach_close"] = 0
            else:
                if dist <= self.approach_close and key[0]=='C':
                    dict_humans[key]["approach_close"] += 1
                
                if dict_humans[key]["approach_close"] >= self.approach_close_times \
                        and key[0] == 'C' and dist <= self.approach_interact:
                            #new_key = "{}{}".format('I', key[1:])
                            new_key = "{}3{}".format('I', key[2:])
                            self.log["PersonID"].append(key)
                            self.log["Prev_State"].append("Init")
                            self.log["State"].append("Approach")
                            self.log["InteractionID"].append(new_key)
                            new_dict_humans[new_key] = dict_humans[key]
                            new_dict_humans[new_key]["approach_far"] = 0
                            deleted_key.append(key)
        
        for i in dict_humans.keys():
            if i not in deleted_key:
                new_dict_humans[i] = dict_humans[i]
        return new_dict_humans


    def visualize_human(self, human_info):
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

    def check_picking_action(self, dict_humans, viz=True):
        
        humans = []
        for key in dict_humans.keys():
            pose = dict_humans[key]["pose"]
            humans.append(pose)
        taken_objs, img = self.humanske.get_smelled_object(self.color_img, humans)
        for taken_obj, key in zip(taken_objs, dict_humans.keys()):
            if len(taken_obj) > 0 and key[0]=='I':
                new_key = "I1{}".format(key[2:])
                self.log["PersonID"].append(key)
                self.log["Prev_State"].append("Approach")
                self.log["State"].append("Pick")
                self.log["InteractionID"].append(new_key)

                dict_humans[new_key] = dict_humans[key]
                del dict_humans[key]

        if viz:
            cv2.imshow("check_picking", img)
            cv2.waitKey(2)

    def to_csv(self):
        df = DataFrame(self.log)
        df.to_csv("log.csv")

if __name__=="__main__":

    pepart = PoseEstimatorPart()
    rospy.init_node("pose_estimator_part")
    time.sleep(1)
    last_frame = None
    last_dict_humans = None
    new_dict_humans = None

    while True:

        #frame = cv2.cvtColor(frame,cv2.COLOR_BGR2RGB)
        if pepart.get_color_img() is None:
            continue
        humans = pepart.get_humans()

        if last_frame is not None and last_dict_humans is not None:
           #new_dict_humans = app_detect.identify_human(last_dict_humans, \
           #        humans, last_frame, frame, thresh=2, method="orb", viz=False)
           new_dict_humans = pepart.identify_human_tracking( \
                    last_dict_humans, humans, viz=False)
           new_dict_humans = pepart.get_depth_for_humans(new_dict_humans)
        
        if new_dict_humans is not None:
            processed_frame = pepart.visualize_human(new_dict_humans)
        else:
            processed_frame = pepart.visualize_human(humans)
        
        last_frame = pepart.get_color_img()
        if last_dict_humans is None:
           last_dict_humans = pepart.create_first_human_dict(humans)
           pepart.create_first_tracking(last_dict_humans)
        else:
           last_dict_humans = new_dict_humans
           pepart.check_picking_action(new_dict_humans)

        cv2.imshow("Processed frame", processed_frame)
        c = cv2.waitKey(10) & 0xFF

        if c==ord('e'):
            pepart.to_csv()
            exit()

    ros.spin()


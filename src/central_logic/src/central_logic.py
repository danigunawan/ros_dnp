import rospy

from head_pose_estimation.msg import GazingInfo
from smelling_detection.msg import  PickingInfo
from approaching.msg import ApproachInfo
from smelling_detection.msg import ObjectStatus
from sensor_msgs.msg import Image

import time
from pandas import DataFrame
import cv2
import numpy as np
import copy

class CentralLogic(object):

    def __init__(self):

        rospy.Subscriber("/approach_info", ApproachInfo, self._approach_cb)
        rospy.Subscriber("/headpose_info", GazingInfo, self._gaze_cb)
        rospy.Subscriber("/pick_info", PickingInfo, self._pick_cb)
        rospy.Subscriber("/object_status", ObjectStatus, self._object_cb)
        rospy.Subscriber("/camera/color/image_raw", Image, self.color_callback)

        self.gazeinfo = None
        self.pickinfo = None
        self.object_status = None
        self.color_img = None
        self.dict_human = dict()

        self.log_name = time.time()
        self.map_state_val = {"idle": 'I', "approach": 'A', "picking": "P", \
                "gazing": 'G', "leaving": 'L'}
        self.log = {"PersonID": [], "Prev_State": [], "State": []}
    
    def color_callback(self, data): # Need semaphore to protect self.color_img, because it is also used by is_waving_hand function
        #print("Having color image")
        #cv_image = self.bridge.imgmsg_to_cv2(data, data.encoding)
        #print(cv_image)
        
        decoded = np.frombuffer(data.data, np.uint8)

        img = np.reshape(decoded, (480,640, 3))
        #print("COLOR_CALLBACK", img.shape)
        img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        self.color_img = img

    def _approach_cb(self, data):
        
        print(data.dists)
        for i, id_human in enumerate(data.ids):
            if id_human not in self.dict_human.keys():
                self.dict_human[id_human] = dict()
                self.dict_human[id_human]["coord"] = (\
                        data.coords[i].x, data.coords[i].y)
                self.dict_human[id_human]["dist"] = [data.dists[i]]
                self.dict_human[id_human]["state"] = 'I'
            else:
                self.dict_human[id_human]["coord"] = (\
                        data.coords[i].x, data.coords[i].y)
                self.dict_human[id_human]["dist"].append(data.dists[i])

    def _gaze_cb(self, data):
        #print(data)
        self.gazeinfo = data
        self.gazeinfo.is_gazing = list(data.is_gazing)
        print(self.gazeinfo)

    def _pick_cb(self, data):
        self.pickinfo = data
        self.pickinfo.is_pick = list(data.is_pick)

    def _object_cb(self, data):
        self.object_status = data
        self.object_status.exists = list(data.exists)
        #print(self.object_status)

    # if human distance < thresh_dist with thresh_time number then it is approach
    def check_approach(self, window_size=7, thresh_dist=1.5, thresh_time=4):
        # pre statisfied approaching : idle (I)
        pre_state = ['I']

        for key in self.dict_human.keys():
            if self.dict_human[key]["state"] in pre_state:
                c = 0
                if len(self.dict_human[key]["dist"]) < window_size:
                    continue
                print(self.dict_human[key]["dist"])
                for dist in self.dict_human[key]["dist"][-window_size:]:
                    if dist < thresh_dist:
                        c += 1
                if c >= thresh_time:
                    self.dict_human[key]["state"] = 'A'
                    self.log["PersonID"].append(key)
                    self.log["Prev_State"].append('I')
                    self.log["State"].append('A')
    
    def _get_nearest_idx_coord(self, coord, list_coords):

        dists = []
        for _coord in list_coords:
            dists.append(np.sqrt((_coord.x-coord[0])**2+ (_coord.y-coord[0])**2))
        return np.argmax(dists)
    
    def _is_object_picked(self):
        if self.object_status is None:
            True

        for exist in self.object_status.exists:
            if exist:
                return True
        return False

    def check_pick(self):
        # pre satisfied picking : approaching (A)
        pre_state = ['A']
        if self.pickinfo is None:
            return

        for key in self.dict_human.keys():
            if self.dict_human[key]["state"] in pre_state:
                id_nearest = self._get_nearest_idx_coord(\
                            self.dict_human[key]["coord"], self.pickinfo.coords)
                if self.pickinfo.is_pick[id_nearest] and not self._is_object_picked():
                    self.log["PersonID"].append(key)
                    self.log["Prev_State"].append(self.dict_human[key]["state"])
                    self.log["State"].append('P')
                    self.dict_human[key]["state"] = 'P'

    def check_gaze(self):
        # pre satisfied gazing: picking (P)
        pre_state = ['P']
        if self.gazeinfo is None :
            return

        for key in self.dict_human.keys():
            if self.dict_human[key]["state"] in pre_state:
                id_nearest = self._get_nearest_idx_coord(\
                        self.dict_human[key]["coord"], self.gazeinfo.coords)
                print("gazing id nearest", id_nearest)
                if self.gazeinfo.is_gazing[id_nearest]:
                    self.log["PersonID"].append(key)
                    self.log["Prev_State"].append(self.dict_human[key]["state"])
                    self.log["State"].append('G')
                    self.dict_human[key]["state"] = 'G'

    def check_leave(self, window_size=7, thresh_dist=2, thresh_time=4):
        # pre satisfied leaving: approaching (A), gazing(G) or picking(P)
        pre_state = ['A', 'G', 'P']

        for key in self.dict_human.keys():
            if self.dict_human[key]["state"] in pre_state:
                c = 0
                for dist in self.dict_human[key]["dist"][-window_size:]:
                    if dist > thresh_dist:
                        c += 1
                if c >= thresh_time:
                    self.log["PersonID"].append(key)
                    self.log["Prev_State"].append(self.dict_human[key]["state"])
                    self.log["State"].append('L')
                    self.dict_human[key]["state"] = 'L'

    def visualize(self):
        # show information on image

        return self.color_img

    def save_log_file(self):
        df = DataFrame(self.log)
        df.to_csv("log.csv")

if __name__=="__main__":
    
    rospy.init_node("central_logic_node")
    centrallogicnode = CentralLogic()

    while True:
        
        centrallogicnode.check_approach()
        centrallogicnode.check_pick()
        centrallogicnode.check_gaze()
        centrallogicnode.save_log_file()

        img = centrallogicnode.visualize()
        if img is None:
            continue
        cv2.imshow("viz", img)
        cv2.waitKey(10)

    ros.spin()

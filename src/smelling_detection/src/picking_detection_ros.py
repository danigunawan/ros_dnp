from human_skeleton import HumanSkeleton
from tf_pose.estimator import Human, BodyPart, TfPoseEstimator
from tfpose_ros.msg import Persons, Person, BodyPartElm
from sensor_msgs.msg import Image
from smelling_detection.msg import Coord2D, PickingInfo
import rospy
import time
import copy
import numpy as np
import cv2

class PoseActivityDetection(object):

    def __init__(self):
        
        # subscribe
        rospy.Subscriber("/pose_estimator/pose", Persons, self.pose_cb)
        rospy.Subscriber("/camera/color/image_raw", Image, self.color_callback)
        # publish
        self.pub_pick_info = rospy.Publisher("/pick_info", PickingInfo, \
                queue_size=10)

        self.humans = None
        self.color_img = None
        self.humanske = HumanSkeleton()

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

    def color_callback(self, data): # Need semaphore to protect self.color_img, \
           #because it is also used by is_waving_hand function
        #print("Having color image")
        #cv_image = self.bridge.imgmsg_to_cv2(data, data.encoding)
        #print(cv_image)
        
        decoded = np.frombuffer(data.data, np.uint8)

        img = np.reshape(decoded, (480,640, 3))
        #print("COLOR_CALLBACK", img.shape)
        img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        self.color_img = img
    
    def _get_smelled_object(self, humans):
        
        if self.color_img is None or humans is None:
            return
        
        is_picking = []

        for human in humans:

            taken_obj, img = self.humanske.get_smelled_one_object\
                    (self.color_img, human)

            if len(taken_obj) > 0:
                is_picking.append(True)
            else:
                is_picking.append(False)

        return is_picking
    
    def _get_coord_humans(self, humans):

        if humans is None or self.color_img is None:
            return 
        
        img_h, img_w, _ = self.color_img.shape

        coords = []
        for human in humans:
            sorted_id = sorted(human.body_parts.keys())
            body_part = human.body_parts[sorted_id[0]]
            x, y = (int(body_part.x * img_w + 0.5), \
                    int(body_part.y * img_h + 0.5))
            coords.append((x,y))
        return coords

    def publish_picking_info(self):
        
        if self.color_img is None or self.humans is None:
            return

        humans = copy.deepcopy(self.humans)
        is_picking = self._get_smelled_object(humans)
        coords = self._get_coord_humans(humans)
        
        msg = PickingInfo()
        msg.is_pick = []
        msg.coords = []
        print(is_picking, coords)

        for is_pick, coord in zip(is_picking, coords):
            msg.is_pick.append(is_pick)
            coord_obj = Coord2D()
            coord_obj.x = coord[0]
            coord_obj.y = coord[1]
            msg.coords.append(coord_obj)

        self.pub_pick_info.publish(msg)

def main():
    
    appnode = PoseActivityDetection()
    rospy.init_node("picking_node")
    time.sleep(1)

    while True:
        appnode.publish_picking_info()

    rospy.spin()

if __name__=="__main__":
    main()

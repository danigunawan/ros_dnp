import rospy
from human_skeleton import HumanSkeleton
from tf_pose.estimator import Human, BodyPart, TfPoseEstimator
from tfpose_ros.msg import Persons, Person, BodyPartElm
from sensor_msgs.msg import Image
from tf_pose import common
from smelling_detection.msg import Coord2D, PickingInfo
import time
import copy
import numpy as np
import cv2
import torch
from torchvision import transforms, utils
from train import MyModel
from MobileNetV2 import MobileNetV2
from DataLoader import PhoneBehaviorDataset
from torch.utils.data import Dataset, DataLoader

def transform(img, size):
    img = cv2.resize(img, (size, size))
    transform = transforms.Compose([
                #transforms.Resize(256),
                #transforms.CenterCrop(224),
                transforms.ToTensor(),
                transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])
            ])
    return transform(img)


class PhoneDataCollector(object):

    def __init__(self):
        rospy.Subscriber("/pose_estimator/pose", Persons, self.pose_cb)
        rospy.Subscriber("/camera/color/image_raw", Image, self.color_callback)

        self.humans = None
        self.color_img = None
        self.humanske = HumanSkeleton()
        self.index = 0
        
        mobile = MobileNetV2(n_class=2)

        self.phonemodel = MyModel(mobile)
        checkpoint = torch.load("/home/vision/work/computer_vision_projects/PhoneBehaviorDetection/training/model.pth.tar")
        self.phonemodel.load_state_dict(checkpoint)
        self.phonemodel.eval()
        torch.no_grad()

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

    def color_callback(self, data): # Need semaphore to protect self.color_img, \
           #because it is also used by is_waving_hand function
        print("Having color image")
        #cv_image = self.bridge.imgmsg_to_cv2(data, data.encoding)
        #print(cv_image)
        
        decoded = np.frombuffer(data.data, np.uint8)

        img = np.reshape(decoded, (480,640, 3))
        #print("COLOR_CALLBACK", img.shape)
        img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        self.color_img = img

    def _get_taken_object(self):
        
        if self.color_img is None or self.humans is None:
            print("None")
            return


        taken_objs = []
        image_h, image_w, _ = self.color_img.shape

        for human in self.humans:
            
            human_parts = {}

            for i in common.ArmsParts:
                if i not in human.body_parts.keys():
                    continue

                body_part = human.body_parts[i]
                center = (int(body_part.x * image_w + 0.5), \
                        int(body_part.y * image_h + 0.5))   
                human_parts[i] = center

            for pair_order, pair in enumerate(common.ArmsPairs):

                if pair[0] not in human.body_parts.keys() \
                        or pair[1] not in human.body_parts.keys():
                            continue

                if pair == common.RForeArms:
                    tl, br = self.humanske.get_taken_object_box(human_parts[pair[0]], \
                            human_parts[pair[1]], pair == common.LForeArms)
                    if (tl[0] > 0 and br[0] < image_w) and \
                            (tl[1] > 0 and br[1] < image_h):
                        taken_objs.append(self.color_img[tl[1]:br[1], tl[0]:br[0], :])

                if pair == common.LForeArms:
                    tl, br = self.humanske.get_taken_object_box(human_parts[pair[0]], \
                            human_parts[pair[1]], pair == common.LForeArms)
                    if (tl[0] > 0 and br[0] < image_w) and\
                            (tl[1] > 0 and br[1] < image_h):
                        taken_objs.append(self.color_img[tl[1]:br[1], tl[0]:br[0], :])

        return taken_objs


    def get_data(self):

        if self.color_img is None or self.humans is None:
            print("None")
            return

        cv2.imshow("img", self.color_img)
        cv2.waitKey(10)

        taken_objs = self._get_taken_object()

        for i, obj in enumerate(taken_objs):
            cv2.imshow("taken_obj_{}".format(i), obj)
            cv2.imwrite("{}/{}.png".format("data", self.index), obj)
            self.index += 1
            cv2.waitKey(10)

    def check_phone(self):
        
        if self.color_img is None or self.humans is None:
            return

        taken_objs = self._get_taken_object()

        font = cv2.FONT_HERSHEY_SIMPLEX
        color = (255, 0, 0)
        thickness = 2
        p = 0

        for i, obj in enumerate(taken_objs):
            img = transform(obj, 224)
            p += np.argmax(self.phonemodel(img.unsqueeze(0)).cpu().detach().numpy()[0])
            print(p)
        if p >= 1:
            cv2.putText(self.color_img, "Using Phone", (50,50), font, 1, color, thickness, cv2.LINE_AA)
        else:
            cv2.putText(self.color_img, "Not Phone", (50,50), font, 1, color, thickness, cv2.LINE_AA)

        #cv2.imshow("img", self.color_img)
        #cv2.waitKey(10)
        return self.color_img

def main():
    appnode = PhoneDataCollector()
    rospy.init_node("phone_data_collector")
    time.sleep(1)
    fourcc = cv2.VideoWriter_fourcc(*'MJPG')
    out = cv2.VideoWriter('output-%s.avi' % "side", fourcc, 40, (640, 480))
    
    while True:
        img = appnode.check_phone()
        cv2.imshow("img", img)
        cv2.waitKey(10)
        out.write(img)

    rospy.spin()

if __name__=="__main__":
    main()

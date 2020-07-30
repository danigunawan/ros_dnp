from tf_pose.estimator import TfPoseEstimator
from tf_pose.networks import get_graph_path, model_wh
from tf_pose.drawer import Drawer
from tf_pose import common
import cv2
import copy
from object_template_matching import TemplateMatching
from rs_cam_lib import RealSense
import numpy as np
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--id_model", help="0-small model, 1-big model", type=int, default=1)
parser.add_argument("--updown_side_view", help="0-normal view(defaul view), 1-up down view", type=int, default=0)
parser.add_argument("--tracker", help="tracker's name or id")
args = parser.parse_args()

class Tracker:

    def __init__(self, name_algo):
        self.name_algo = name_algo
        self.tracker = None

        if name_algo == "boosting" or int(name_algo) == 0:
            self.tracker = cv2.TrackerBoosting_create()
        if name_algo == "mil" or int(name_algo) == 1:
            self.tracker = cv2.TrackerMIL_create()	
        if name_algo == "kcf" or int(name_algo) == 2:
            print("Tracker KCF")
            self.tracker = cv2.TrackerKCF_create()
        if name_algo == "tld" or int(name_algo) == 3:
            self.tracker = cv2.TrackerTLD_create()
        if name_algo == "medianflow" or int(name_algo) == 4:
            self.tracker = cv2.TrackerMedianFlow_create()


    def init(self, bbox, img):
        bbox_ = (bbox[0][0], bbox[0][1], bbox[1][0] - bbox[0][0], bbox[1][1] - bbox[0][1])
        self.tracker.init(img, bbox_)

    def get_update(self, img):
        return self.tracker.update(img)

class HumanSkeleton:

    def __init__(self):
        
        self.model_name = "cmu"
        self.target_size_pose_detector="368x368"
        self.is_started = False
        self.resize_to_default = None
        self.resize_out_ratio = 4.0
        self.objectbox_forearm_ratio_left = 2
        self.objectbox_forearm_ratio_right = 2.1
        self.touchingpoint_objectbox_ratio = 0.6

        self.prepare_knocked = False
        self.exact_knocked = False
    
    def set_model(self, model):
        
        self.model = model

    def set_modelname(self, id_model):
        # 0 ~ smaller model
        # 1 ~ big model
        if id_model == 0:
            self.model_name="mobilenet_thin"
        elif id_model == 1:
            self.model_name="cmu"

    def start(self):
        
        if not self.is_started:
            self.is_started = True
        else:
            return

        w, h = model_wh(self.target_size_pose_detector)
        self.resize_to_default = (w > 0 and h > 0)
        self.model = TfPoseEstimator(get_graph_path(self.model_name), target_size=(w, h))
    
    def get_humans(self, img):
        
        return self.model.inference(img, resize_to_default = self.resize_to_default, upsample_size=self.resize_out_ratio)
    
    def get_taken_object_box(self, elbow, wrist, isleft=True):
        
        forearm_length = ((elbow[0]-wrist[0])**2 + (elbow[1] - wrist[1])**2)**(0.5)
        

        if isleft:
            box_len = 100#int(self.objectbox_forearm_ratio_left * forearm_length)
            tl = (wrist[0] -  int(box_len/2), int(wrist[1] - int(box_len/2)))
            br = (tl[0] + box_len, tl[1] + box_len)
        else:
            box_len = 100#int(self.objectbox_forearm_ratio_right * forearm_length)
            tl = (wrist[0]- int(box_len/2), int(wrist[1] - int(box_len/2)))
            br = (tl[0] + box_len, tl[1] + box_len)

        return tl, br

    # return box on hand (we hope it contain object, taken by human)
    def get_smelled_object(self, img, humans):

        taken_object = []
        image_h, image_w, _ = img.shape
        copy_img = copy.deepcopy(img)

        for human in humans:
            
            human_parts = {}
            one_taken_object = []

            for i in common.ArmsParts:
                if i not in human.body_parts.keys():
                    continue

                body_part = human.body_parts[i]
                center = (int(body_part.x * image_w + 0.5), int(body_part.y * image_h + 0.5))   
                human_parts[i] = center
                cv2.circle(img, center, 3, common.CocoColors[i], thickness=3, lineType=8, shift=0)
            

            for pair_order, pair in enumerate(common.ArmsPairs):

                if pair[0] not in human.body_parts.keys() or pair[1] not in human.body_parts.keys():
                    continue

                if pair in common.ForeArms:
                    degree = int(Drawer.calculateDegree(pair[0], pair[1], human_parts))
                
                h, w, _ = img.shape

                if pair == common.RForeArms:

                    status = "Not Smell"
                    if 110 <= degree and degree <= 130:
                        status = "Smell"
                        tl, br = self.get_taken_object_box(human_parts[pair[0]], human_parts[pair[1]], False)

                        if (tl[0] > 0 and br[0] < w) and (tl[1] > 0 and br[1] < h):
                            one_taken_object.append(copy_img[tl[1]:br[1], tl[0]:br[0], :])
                            cv2.imshow("object", copy_img[tl[1]:br[1], tl[0]:br[0], :])
                            #cv2.waitKey(0)
                            #cv2.rectangle(img, tl, br, (255, 0, 0))

                    cv2.putText(img, "Degree right[{}] {}".format(status, degree), (0, 70), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 2)

                if pair == common.LForeArms:
                    
                    status = "Not Smell"
                    if 50 <= degree and degree <= 70:
                        status = "Smell"
                        tl, br = self.get_taken_object_box(human_parts[pair[0]], human_parts[pair[1]], True)
                        if (tl[0] > 0 and br[0] < w) and (tl[1] > 0 and br[1] < h):
                            one_taken_object.append(copy_img[tl[1]:br[1], tl[0]:br[0], :])
                        #cv2.imshow("object", copy_img[tl[1]:br[1], tl[0]:br[0], :])
                        #cv2.waitKey(0)

                    cv2.putText(img, "Degree left[{}] {}".format(status, degree), (0, 90), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 2)
            taken_object.append(one_taken_object)

        return taken_object, img

    # return box on hand (we hope it contain object, taken by one human)
    def get_smelled_one_object(self, img, human):

        taken_object = []
        image_h, image_w, _ = img.shape
        copy_img = copy.deepcopy(img)

        human_parts = {}

        for i in common.ArmsParts:
            if i not in human.body_parts.keys():
                continue

            body_part = human.body_parts[i]
            center = (int(body_part.x * image_w + 0.5), int(body_part.y * image_h + 0.5))   
            human_parts[i] = center
            cv2.circle(img, center, 3, common.CocoColors[i], thickness=3, lineType=8, shift=0)
        

        for pair_order, pair in enumerate(common.ArmsPairs):

            if pair[0] not in human.body_parts.keys() or pair[1] not in human.body_parts.keys():
                continue

            if pair in common.ForeArms:
                degree = int(Drawer.calculateDegree(pair[0], pair[1], human_parts))
            
            h, w, _ = img.shape

            if pair == common.RForeArms:

                status = "Not Smell"
                if 110 <= degree and degree <= 130:
                    status = "Smell"
                    tl, br = self.get_taken_object_box(human_parts[pair[0]], human_parts[pair[1]], False)

                    if (tl[0] > 0 and br[0] < w) and (tl[1] > 0 and br[1] < h):
                        taken_object.append(copy_img[tl[1]:br[1], tl[0]:br[0], :])
                        cv2.imshow("object", copy_img[tl[1]:br[1], tl[0]:br[0], :])
                        #cv2.waitKey(0)
                        #cv2.rectangle(img, tl, br, (255, 0, 0))

                cv2.putText(img, "Degree right[{}] {}".format(status, degree), (0, 70), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 2)

            if pair == common.LForeArms:
                
                status = "Not Smell"
                if 50 <= degree and degree <= 70:
                    status = "Smell"
                    tl, br = self.get_taken_object_box(human_parts[pair[0]], human_parts[pair[1]], True)
                    if (tl[0] > 0 and br[0] < w) and (tl[1] > 0 and br[1] < h):
                        taken_object.append(copy_img[tl[1]:br[1], tl[0]:br[0], :])
                    #cv2.imshow("object", copy_img[tl[1]:br[1], tl[0]:br[0], :])
                    #cv2.waitKey(0)

                cv2.putText(img, "Degree left[{}] {}".format(status, degree), (0, 90), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 2)

        return taken_object, img

    def is_knocked_ontable_object(self, img, humans, depth_frame, rs_cam, coord_place, depth_place, ratio_thresh_dist=0.3, thresh_depth=0.2):

        taken_object = []
        image_h, image_w, _ = img.shape
        copy_img = copy.deepcopy(img)
        center_place = None

        if isinstance(list, coord_place[0]):
            center_place = ((coord_place[0][0]+coord_place[1][0])/2, (coord_place[0][1]+coord_place[1][0])/2)
        else:
            center_place = coord_place
        #print(coord_place[0][0] - coord_place[1][0], coord_place[0][1] - coord_place[1][0])
        knocked_detected = False

        for human in humans:

            human_parts = {}

            for i in common.ArmsParts:
                if i not in human.body_parts.keys():
                    continue

                body_part = human.body_parts[i]
                center = (int(body_part.x * image_w + 0.5), int(body_part.y * image_h + 0.5))
                human_parts[i] = center
                cv2.circle(img, center, 3, common.CocoColors[i], thickness=3, lineType=8, shift=0)


            for pair_order, pair in enumerate(common.ArmsPairs):

                if pair[0] not in human.body_parts.keys() or pair[1] not in human.body_parts.keys():
                    continue

                thresh_dist = ((human_parts[pair[0]][0] - human_parts[pair[1]][0])**2 + (human_parts[pair[0]][1] - human_parts[pair[1]][1])**2)**(0.5)
                if pair == common.RForeArms or pair == common.LForeArms:

                    dist_2d = ((human_parts[pair[1]][1]-center_place[0])**2 + (human_parts[pair[1]][1]-center_place[1])**2)**(0.5)
                    dist_depth = abs(rs_cam.get_depth_around_point(depth_frame, human_parts[pair[1]]) - depth_place)

                    if dist_2d <= int(thresh_dist*ratio_thresh_dist) and dist_depth <= thresh_depth:
                        cv2.putText(img, "Knock detected", (0, 45), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 2)
                        if not self.prepare_knocked:
                            self.prepare_knocked = True
                    else:
                        if self.prepare_knocked:
                            self.prepare_knocked = False #reset knock
                            self.exact_knocked=True
                        else:
                            self.exact_knocked = False

        return self.exact_knocked

    def collect_data(self, taken_object, numid, pathdir):

        for img in taken_object:
            cv2.imwrite("{}/{}.png".format(pathdir, numid), img)
            numid += 1
        
        return numid


if __name__=="__main__":
    
    global args
    rs_cam = RealSense()
    
    humanske = HumanSkeleton()
    humanske.set_modelname(args.id_model)
    humanske.start()

    non_object_path_dir = "/home/vision/work/computer_vision_projects/smelling_detection/data_evaluation/revive_bottle/nonhaving"

    objectmatching = TemplateMatching()
    template_dir = "/home/vision/work/computer_vision_projects/smelling_detection/bottle_samples/3"

    init_track_object = objectmatching.get_initial_image()
    print(init_track_object)
    trackers = dict()
    name_objects = objectmatching.get_name_objects()
    existence_dict = dict()
    first_showup = dict()
    
    for name_obj in name_objects:
        existence_dict[name_obj] = True
        trackers[name_obj] = Tracker(args.tracker)
        first_showup[name_obj] = False

    while True:
        print("Processing ... ")
        
        aligned_frames = rs_cam.get_aligned_frame()
        aligned_depth_frame = aligned_frames.get_depth_frame()
        color_frame = aligned_frames.get_color_frame()

        if not aligned_depth_frame or not color_frame :
            continue
        
        depth_image = np.asanyarray(aligned_depth_frame.get_data())
        color_image = np.asanyarray(color_frame.get_data())

        if args.updown_side_view:
            color_image = cv2.rotate(color_image, cv2.ROTATE_180)#np.flipud(color_image)

        humans = humanske.get_humans(color_image)
        taken_object, img = humanske.get_smelled_object(color_image, humans)
        #print(taken_object)
        exists_objects_name, dict_box_objects = objectmatching.check_multi_objects_in_image(color_image)

        #Tracking
        for obj_name in name_objects:
            if obj_name in exists_objects_name:
                if not first_showup[obj_name]:
                    first_showup[obj_name] = True

                    a = trackers[obj_name].init(dict_box_objects[obj_name], color_image)
                    print("Init Tracking : ", a)

            if first_showup[obj_name]:
                ok, bbox = trackers[obj_name].get_update(color_image)
                if ok:
                    p1 = (int(bbox[0]), int(bbox[1]))
                    p2 = (int(bbox[0] + bbox[2]), int(bbox[1] + bbox[3]))
                    cv2.rectangle(img, p1, p2, (0,0,255), 1)

        #knocked = humanske.is_knocked(img, humans, aligned_depth_frame, rs_cam, coord_place_box, depth_place)
        knockedprocess_img, human_rect, avgx = Drawer.is_knocked(img, None, None, humans)
        
        if(avgx is not None):
            cv2.putText(img, "Knock detected", (0, 45), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 2)
            print("Knocked detected")
        if len(exists_objects_name) > 0:

            s = ""
            for obj in exists_objects_name:
                s += "{}  ".format(obj)

            cv2.putText(img, "{} still in box".format(s), (2, 45), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 200), 2)
        
        # number 3 here is number of object, you should modify this number for you situation
        #if len(exists_objects_name) < 3 and (taken_object is not None and len(taken_object) > 0):
         #   cv2.putText(img, "Smell Revive Bottle", (50, 10), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 0, 0), 2)
        
        img = objectmatching.visual_exists_object(img, exists_objects_name)
        cv2.imshow("processed", img)
        k = cv2.waitKey(10) & 0xFF
        
        if k==ord('q'):
            break

    rs_cam.pipeline.stop()

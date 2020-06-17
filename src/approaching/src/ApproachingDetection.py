import numpy as np
from rs_cam_lib import RealSense
from tf_pose.estimator import TfPoseEstimator
from tf_pose.networks import get_graph_path, model_wh
from tf_pose.drawer import Drawer
import copy
import cv2
import pickle
from tracker import Tracker

class ApproachingDetection(object):

    def __init__(self, object_coord_file, model, load_model=True):
        
        self.object_coord = pickle.load(open(object_coord_file, 'rb'))
        if load_model:
            self.e = TfPoseEstimator(get_graph_path(model), target_size=(368,368))
        self.resize_out_ratio=4
        self.id_human = 0

        #self._realsense = RealSense()
        self.tracktype = None

    def _get_dist_between_object_human():
        pass
    
    # @human parameter is human pose
    # return box around this pose
    def _get_box_from_human_pose(self, human, image_w, image_h):
        
        box = Drawer.findBorderBox(human, image_w, image_h)
        return box["topLeft"], box["bottomRight"]

    def _get_orb_matching_point(self, img1, img2, viz):

        orb = cv2.ORB_create()
        kp1, des1 = orb.detectAndCompute(img1,None)
        kp2, des2 = orb.detectAndCompute(img2,None)
        bf = cv2.BFMatcher(cv2.NORM_HAMMING, crossCheck=True)

        if des1 is None or des2 is None:
            return 0

        matches = bf.match(des1,des2)
        matches = sorted(matches, key = lambda x:x.distance)
        #print(img1.shape, img2.shape)

        if viz:
            img3 = cv2.drawMatches(img1,kp1,img2,kp2,matches[:10],None,flags=cv2.DrawMatchesFlags_NOT_DRAW_SINGLE_POINTS)
            cv2.imshow("viz_matching", img3)
            cv2.imwrite("matching.png", img3)
            cv2.waitKey(1)

        return len(matches)


    def _matched_point(self, img1, img2, method="orb", viz=True):
        
        if method=="orb":
            return self._get_orb_matching_point(img1, img2, viz)

    def _compute_iou(self, boxA, boxB):

        xA = max(boxA[0][0], boxB[0][0])
        yA = max(boxA[0][1], boxB[0][1])
        xB = min(boxA[1][0], boxB[1][0])
        yB = min(boxA[1][1], boxB[1][1])

        interArea = max(0, xB-xA+1) * max(0, yB - yA + 1)

        return interArea
    
    def get_model(self):
        return self.e

    def get_depth_object(self):
        pass

    # return depth of each humam, and distance between human and object
    # @humans param include human object of tf-pose
    # algorithm will extract depth of head of human
    def get_human_depths(self, humans):
        
        return #human_depths, human_dists

    def get_human_depth(self, human):

        return #human_depth, human_dist
    
    def get_humans(self, frame):

        return self.e.inference(frame, resize_to_default=True, upsample_size=self.resize_out_ratio)
    
    def create_first_human_dict(self, humans, frame):
        
        result = dict()
        img_h, img_w, _ = frame.shape

        for i in range(len(humans)):
            key = "C000{}".format(i)
            result[key] = dict()
            result[key]["pose"] = humans[i]
            box = self._get_box_from_human_pose(humans[i], img_w, img_h)
            result[key]["box"] = box
            result[key]["img"] = frame[box[0][1]:box[1][1], box[0][0]:box[1][0]]
            print("Hello", result[key]["img"].shape)
        
        self.id_human = len(humans)

        return result

    def create_human_box(self, dict_humans, img):

        img_h, img_w, _ = img.shape

        for key in dict_humans.keys():
            human = dict_humans[key]
            box = self._get_box_from_human_pose(human, img_w, img_h)
            dict_humans[key] = dict()
            dict_humans[key]["pose"] = human
            dict_humans[key]["box"] = box
            dict_humans[key]["img"] = img[box[0][1]:box[1][1], box[0][0]:box[1][0]]
    
    def get_matched_point(self, human_img, human_img1, method="orb", viz=True):
        return self._matched_point(human_img, human_img1, method, viz)
    
    # return id if find closeness human
    # return None if it's new human
    def get_closeness_human(self, human_img1, list_human_img, thresh, method="orb", viz=True):
        
        max_point = -1
        index_matched = None

        for i, human_img in enumerate(list_human_img):
            num_point = self.get_matched_point(human_img1, human_img, method, viz)
            if max_point < num_point:
                max_point = num_point
                index_matched = i

        if max_point < thresh: # new one get into frame
            return None

        return index_matched


    # @last_dict_humans param is last dict humans pose: {id: pose}
    # @new_humans include human pose in new frame
    # this function will reidentify with matching algorithm
    def identify_human(self, last_dict_humans, new_humans, last_frame, new_frame, thresh, method="orb", viz=True):
        
        img_h, img_w, _ = new_frame.shape
        new_dict_humans = dict()
        new_humans_box = []
        new_humans_img = []
        h, w, _ = last_frame.shape

        for human in new_humans:
            box = self._get_box_from_human_pose(human, w, h)
            new_humans_box.append(box)
            new_humans_img.append(new_frame[box[0][1]:box[1][1], box[0][0]:box[1][0]])

        for key in last_dict_humans.keys():

            index_matched = self.get_closeness_human(last_dict_humans[key]["img"], new_humans_img, thresh, method, viz)
            if index_matched is not None:
                new_dict_humans[key] = dict()
                new_dict_humans[key]["pose"] = copy.deepcopy(new_humans[index_matched])
                new_dict_humans[key]["box"] = copy.deepcopy(new_humans_box[index_matched])
                new_dict_humans[key]["img"] = copy.deepcopy(new_humans_img[index_matched])
                del new_humans_img[index_matched]
                del new_humans[index_matched]
                del new_humans_box[index_matched]

        for i in range(len(new_humans)):
            
            key = "C000{}".format(self.id_human)
            new_dict_humans[key] = dict()
            new_dict_humans[key]["pose"] = new_humans[i]
            new_dict_humans[key]["box"] = new_humans_box[i]
            new_dict_humans[key]["img"] = new_humans_img[i]
            #cv2.imshow("hello", new_dict_humans[self.id_human]["img"])
            
            self.id_human += 1

        return new_dict_humans
    
    def set_tracking_type(self, tracktype=2):
        self.tracktype = tracktype

    def create_first_tracking(self, dict_humans, frame):
        
        for key in dict_humans.keys():
            human = dict_humans[key]
            tracker = Tracker(self.tracktype)
            tracker.init(human["box"], frame)
            human["tracker"] = tracker

    def identify_human_tracking(self, last_dict_humans, new_humans, \
                frame, viz=True):
        
        h, w, _ = frame.shape
        new_humans_box = []

        for human in new_humans:
            box = self._get_box_from_human_pose(human, w, h)
            new_humans_box.append(box)
        
        deleted_keys = []
        # update human dict
        for key in last_dict_humans.keys():
            human = last_dict_humans[key]
            ok, box = human["tracker"].get_update(frame)
            
            if viz:
                f = cv2.rectangle(frame, box[0], box[1], (255,0,0), 1)
                cv2.imshow("vizualize tracking", f)
                cv2.waitKey(1)

            if ok:
                ious = []
                for box_ in new_humans_box:
                    iou = self._compute_iou(box_, box)
                    ious.append(iou)
                
                if len(ious)==0:
                    deleted_keys.append(key)
                    continue

                index_matched = np.argmax(ious)

                if ious[index_matched] == 0:
                    deleted_keys.append(key)
                    continue 

                last_dict_humans[key]["pose"] = copy.deepcopy(new_humans[index_matched])
                last_dict_humans[key]["box"] = copy.deepcopy(new_humans_box[index_matched])
                del new_humans[index_matched]
                del new_humans_box[index_matched]
            else:
                deleted_keys.append(key)

        for key in deleted_keys:
            del last_dict_humans[key]

        for i, human in enumerate(new_humans):
            key = "C000{}".format(self.id_human)
            last_dict_humans[key] = dict()
            last_dict_humans[key]["pose"] = human
            last_dict_humans[key]["box"] = new_humans_box[i]
            tracker = Tracker(self.tracktype)   
            tracker.init(new_humans_box[i], frame)
            last_dict_humans[key]["tracker"] = tracker
            self.id_human += 1

        return last_dict_humans

    def get_depth_for_humans(self, dict_humans, br_obj, color_frame, depth_frame):
        
        color_image = np.asanyarray(color_frame.get_data())
        image_h, image_w, _ = color_image.shape

        for key in dict_humans.keys():
            human = dict_humans[key]
            ix, iy = int((self.object_coord[0][0] + self.object_coord[1][0])/2),\
                    int((self.object_coord[0][1] + self.object_coord[1][1])/2)
            
            id_nose = 0
            sorted_id = sorted(human["pose"].body_parts.keys())
            body_part = human["pose"].body_parts[sorted_id[0]]
            x, y = (int(body_part.x * image_w + 0.5), \
                    int(body_part.y * image_h + 0.5))

            dist = br_obj.calculate_distance(ix, iy, x, y,\
                    color_frame, depth_frame)
            dict_humans[key]["dist"] = round(dist, 1)

    def visualize_human(self, dict_identified_humans, frame):
        
        viz_frame = copy.deepcopy(frame)
        cv2.rectangle(viz_frame, self.object_coord[0], self.object_coord[1], (0, 255, 0), 1)

        if isinstance(dict_identified_humans, list):
            h, w, _ = frame.shape
            for human in dict_identified_humans:
                box = self._get_box_from_human_pose(human, w, h)
                cv2.rectangle(viz_frame, box[0], box[1], (255, 0 ,0), 1)

        if isinstance(dict_identified_humans, dict):

            h, w, _ = frame.shape
            for key in dict_identified_humans.keys():
                human_item = dict_identified_humans[key]
                box = human_item["box"]
                cv2.rectangle(viz_frame, box[0], box[1], (255, 0 ,0), 1)
                dist = 0
                if "dist" in human_item.keys():
                    dist = human_item["dist"]
                viz_frame = cv2.putText(viz_frame, "{}-{}".format(key, dist), box[0], cv2.FONT_HERSHEY_SIMPLEX, 1, (255,0,0) , 2, cv2.LINE_AA)

        return viz_frame
    

import cv2
import numpy as np
import pickle
import glob
import copy
import json

class TemplateMatching:
    
    def __init__(self):
        self.multi_objects_file = "multiple_coord_objects.json"
        self.multi_objects_data = json.load(open(self.multi_objects_file))
        self.name_objects = self.multi_objects_data.keys()
        
        self.load_multi_coord_objects()

        self.thresh_matching = 0.65
        self.log_i = 0
    
    def get_name_objects(self):

        return self.name_objects

    def load_multi_coord_objects(self):

        for key in self.name_objects:
            self.multi_objects_data[key]["coord_data"] = pickle.load(open(self.multi_objects_data[key]["coord_file"], 'rb'))

    def get_initial_image(self):
        
        init_track_object = dict()
        for obj_name in self.name_objects:
            coord_place = self.multi_objects_data[obj_name]["coord_data"]
            init_track_object[obj_name] = coord_place

        return init_track_object

    def check_multi_objects_in_image(self, img, method_match=cv2.TM_CCOEFF_NORMED):
        
        exists_objects_name = []
        dict_box = dict()

        for key in self.name_objects:
            exists, box = self.check_object_dir_in_image(self.multi_objects_data[key]["data_folder"], img, self.multi_objects_data[key]["coord_data"], method_match)

            if exists:
                exists_objects_name.append(key)
                dict_box[key] = box 
            else:
                coord_place = self.multi_objects_data[key]["coord_data"]
                dict_box[key] = coord_place

        return exists_objects_name, dict_box

    def visual_exists_object(self, img, exists_objects_name):
        
        result_img = copy.deepcopy(img)

        for object_name in self.name_objects:
            
            coord_place = self.multi_objects_data[object_name]["coord_data"]

            if object_name in exists_objects_name:
                cv2.rectangle(result_img, coord_place[0], coord_place[1], (255,0,0), 2)
            else:
                cv2.rectangle(result_img, coord_place[0], coord_place[1], (0,255,0), 2)
        
        return result_img


    def check_object_in_image(self, image_object, image, method_match=cv2.TM_CCOEFF_NORMED):
        
        print(image_object.shape, image.shape)
        image=copy.deepcopy(image)
        is_exists = False
        gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        gray_image_object = cv2.cvtColor(image_object, cv2.COLOR_BGR2GRAY)

        #if gray_image.shape[0] <= gray_image_object.shape[0] or gray_image.shape[1] <= gray_image_object.shape[1]:
        #    print("Hello")
        #    return False, (None, None)

        res = cv2.matchTemplate(gray_image, gray_image_object, method_match)
        min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(res)
        h, w, _ = image_object.shape
        thresh_res = np.where(res >= self.thresh_matching)

        h, w = gray_image_object.shape

        for pt in zip(*thresh_res[::-1]):
            cv2.rectangle(image, pt, (pt[0]+w, pt[0]+h), (0,0,255), 2)

        if len(thresh_res[0]) > 0:
            print("======================")
            is_exists = True

        if method_match in [cv2.TM_SQDIFF, cv2.TM_SQDIFF_NORMED]:
            top_left = min_loc
        else:
            top_left = max_loc

        bottom_right = (top_left[0] + w, top_left[1] + h)

        if is_exists:
            cv2.rectangle(image, top_left, bottom_right, (255, 0, 0), 2)
            #cv2.imshow("testtt", image) 
            #cv2.waitKey(10)
        
        return is_exists, (top_left, bottom_right)

    def check_object_dir_in_image(self, image_dir, image, coord_place, method_match=cv2.TM_CCOEFF_NORMED, viz=True):

        list_img_path = glob.glob("{}/*.png".format(image_dir))
        is_exists = False
        box = None
        recoorded_box = [None, None]
        image_result = copy.deepcopy(image)

        for img_path in list_img_path:
            image_object = cv2.imread(img_path)
            print(img_path, image_object)
            ho, wo, _ = image_object.shape
            #image_object = cv2.resize(image_object, (90, int(90*ho/wo)))

            h, w = coord_place[1][1] - coord_place[0][1], coord_place[1][0] - coord_place[0][0]
            is_exists, box = self.check_object_in_image(cv2.resize(image_object, (w,int(h*ho/wo) )), image[coord_place[0][1]:coord_place[1][1], coord_place[0][0]:coord_place[1][0]], method_match)

            if viz:
                #cv2.imwrite("log/img/{}.png".format(self.log_i), image[coord_place[0][1]:coord_place[1][1], coord_place[0][0]:coord_place[1][0]])
                #self.log_i += 1
                temp = np.hstack([cv2.resize(image_object, (w, h)), image[coord_place[0][1]:coord_place[1][1], coord_place[0][0]:coord_place[1][0]]])
                #cv2.imshow("checking {}".format(img_path), temp)

            if is_exists:
                recoorded_box[0] = (box[0][0]+coord_place[0][0], box[0][1]+coord_place[0][1])
                recoorded_box[1] = (box[1][0]+coord_place[0][0], box[1][1]+coord_place[0][1])
                #cv2.rectangle(image, recoorded_box[0], recoorded_box[1], (255, 0, 0), 2)
                break
            #if is_exists:

            #    cv2.rectangle(image, coord_place[0], coord_place[1], (255,0,0), 2)
            #    break  
        
        #if not is_exists:
        #    cv2.rectangle(image, coord_place[0], coord_place[1], (0,255,0), 2)
        return is_exists, recoorded_box


if __name__=="__main__":
    
    cam = cv2.VideoCapture(2)
    objectmatching = TemplateMatching()
    img_dir = "/home/vision/work/computer_vision_projects/smelling_detection/bottle_samples/3"

    while(True):
        _, frame = cam.read()
        exists_objects_name = objectmatching.check_multi_objects_in_image(frame)
        frame = objectmatching.visual_exists_object(frame, exists_objects_name)

        if len(exists_objects_name) > 0:
            print("Having object", exists_objects_name)
        else:
            print("Not having object")

        cv2.imshow("origin", frame)
        #cv2.imshow("check", img)
        cv2.waitKey(10)


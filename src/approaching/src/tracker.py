import cv2

class Tracker:

    def __init__(self, name_algo):
        self.name_algo = name_algo
        self.tracker = None
        self.inited = False

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
        self.inited = True

    def get_update(self, img):
        ok, box = self.tracker.update(img)
        return ok, [(int(box[0]), int(box[1])), \
                    (int(box[0] + box[2]), int(box[1] + box[3]))]

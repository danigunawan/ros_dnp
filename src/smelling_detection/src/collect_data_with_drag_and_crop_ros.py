import argparse 
import cv2
import pickle
import os
import argparse
from sensor_msgs.msg import Image
import rospy
import numpy as np
import copy
from queue import Queue

parser = argparse.ArgumentParser()
parser.add_argument("--cropped_img_dir", help="Saving cropped images in directory cropped image dir", type=str)
args = parser.parse_args()

TOP_COORD_DIR = "coord_box"
if not os.path.exists(TOP_COORD_DIR):
    print("Top coordination box directory is not exists, creating directory now...")
    os.mkdir(TOP_COORD_DIR)

refPt = []
cropping = False
image = None
clone = None

frame = None
queue_frame = Queue(1000)

def color_image_cb(data):
        global frame        
        decoded = np.frombuffer(data.data, np.uint8)

        img = np.reshape(decoded, (480,640, 3))
        img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        frame = img
        queue_frame.put(img, False)

def click_and_crop(event, x, y, flags, param):
        # grab references to the global variables
        global refPt, cropping
 
        # if the left mouse button was clicked, record the starting
        # (x, y) coordinates and indicate that cropping is being
        # performed
        if event == cv2.EVENT_LBUTTONDOWN:
            refPt = [(x, y)]
            cropping = True
 
        # check to see if the left mouse button was released
        elif event == cv2.EVENT_LBUTTONUP:
            # record the ending (x, y) coordinates and indicate that
            # the cropping operation is finished
            refPt.append((x, y))
            cropping = False
 
            # draw a rectangle around the region of interest
            cv2.rectangle(image, refPt[0], refPt[1], (0, 255, 0), 2)
            cv2.imshow("image", image)


def crop_on_img():
    global image
    clone = image.copy()
    cv2.namedWindow("image")
    cv2.setMouseCallback("image", click_and_crop)

    while True:
        cv2.imshow("image", image)
        key = cv2.waitKey(10) & 0xFF

        if key == ord("c"):
            break

if __name__=="__main__":
    
    global image, args

    cropped_dir = args.cropped_img_dir
    full_path = "cropped_dir/{}".format(cropped_dir)
    if not os.path.exists(full_path):
        os.makedirs(full_path)
    
    rospy.init_node("choosing_place_object", anonymous=True)
    rospy.Subscriber("/camera/color/image_raw", Image, color_image_cb)

    i = 0

    # crop place for putting object
    while True:
        if frame is None:
            continue

        c_frame = copy.deepcopy(frame)

        cv2.imshow("img", frame)
        
        key = cv2.waitKey(0) & 0xFF
        if key == ord("c"):
            frame = queue_frame.get()
            image = frame
            clone = c_frame
            crop_on_img()
    
        # if choose_place==True : in choosing_place_put_object process
        if len(refPt) == 2:
            roi = clone[refPt[0][1]:refPt[1][1], refPt[0][0]:refPt[1][0]]
            cv2.imwrite("{}/{}.png".format(full_path, i), roi)
            i += 1
            if roi is not None and roi.shape[0] > 0:
                cv2.imshow("ROI", roi)
            cv2.waitKey(0)

    cv2.destroyAllWindows()
    rospy.spin()


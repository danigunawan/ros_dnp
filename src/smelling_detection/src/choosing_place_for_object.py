import argparse 
import cv2
import pickle
import os
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--choosing_place", help="If this argument is 1, it means that running this program for choosing place to put object", type=int, choices=[0, 1], default=1)
parser.add_argument("--file_coord_name", help="File for saving coordinate in top coordination place directory", type=str)
args = parser.parse_args()

TOP_COORD_DIR = "coord_box"
if not os.path.exists(TOP_COORD_DIR):
    print("Top coordination box directory is not exists, creating directory now...")
    os.mkdir(TOP_COORD_DIR)

refPt = []
cropping = False
image = None
clone = None
    
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
    cam = cv2.VideoCapture(2)
    choose_place = args.choosing_place
    file_coord = args.file_coord_name


    if not choose_place:
        with open("{}/{}".format(TOP_COORD_DIR, file_coord), "rb") as fp:
            refPt = pickle.load(fp)

    # crop place for putting object
    while True:
        _, frame = cam.read()
        if not choose_place:
            frame = cv2.rectangle(frame, refPt[0], refPt[1], (0, 255, 0), 2)
        cv2.imshow("img", frame)
        
        key = cv2.waitKey(10) & 0xFF
        if key == ord("c"):
            image = frame
            clone = frame
            crop_on_img()
            break
    
    # if choose_place==True : in choosing_place_put_object process
    if len(refPt) == 2 and choose_place:
        roi = clone[refPt[0][1]:refPt[1][1], refPt[0][0]:refPt[1][0]]
        with open("{}/{}".format(TOP_COORD_DIR, file_coord), "wb") as fp:
            pickle.dump(refPt, fp)
        cv2.imshow("ROI", roi)
        cv2.waitKey(0)

    cv2.destroyAllWindows()


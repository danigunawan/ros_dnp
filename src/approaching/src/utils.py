import cv2
import pickle
import copy

img = None 
refPt = []
cropping = False

def click_and_crop(event, x, y, flags, param):

    global refPt, cropping

    if event==cv2.EVENT_LBUTTONDOWN:
        refPt = [(x, y)]
        print(refPt)
        cropping = True
    elif event==cv2.EVENT_LBUTTONUP:
        refPt.append((x, y))
        print(refPt)
        cropping = False

        cv2.rectangle(img, refPt[0], refPt[1], (0, 255, 0), 2)

def get_coord_object(img1, dst_dir, file_name):

    # global img
    cv2.namedWindow("object_info")
    cv2.setMouseCallback("object_info", click_and_crop)
    # global img
    img = img1

    while True:

        cv2.imshow("object_info", img)
        key = cv2.waitKey(1) & 0xFF

        if key == ord("c"):
            break

    global refPt
    print(len(refPt), refPt)

    if len(refPt) == 2:
        pickle.dump(refPt, open("{}/{}".format(dst_dir, file_name), 'wb'))
        refPt = []

    cv2.destroyWindow("object_info")

def get_coord_object(img1):

    # global img
    cv2.namedWindow("object_info")
    cv2.setMouseCallback("object_info", click_and_crop)
    # global img
    img = img1
    result = None

    while True:

        cv2.imshow("object_info", img)
        key = cv2.waitKey(1) & 0xFF

        if key == ord("c"):
            break

    global refPt
    print(len(refPt), refPt)

    if len(refPt) == 2:
        result = copy.deepcopy(refPt)
        tmp = copy.deepcopy(img)
        tmp = cv2.rectangle(tmp, refPt[0], refPt[1], (255,0,0), 1)
        cv2.imshow("object_info", tmp)
        cv2.waitKey(0)
        refPt = []

    cv2.destroyWindow("object_info")
    return result

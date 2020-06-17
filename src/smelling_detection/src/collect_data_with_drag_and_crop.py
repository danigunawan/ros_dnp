import cv2
import glob
import os
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--raw_img_dir", help="Saving raw images in directory raw image dir", type=str)
parser.add_argument("--cropped_img_dir", help="Saving cropped images in directory cropped image dir", type=str)

args = parser.parse_args()

TOP_RAW_IMG_DIR="original_dir"
TOP_CROPPED_IMG_DIR="cropped_dir"

def get_label():
    
    max_id = max([int(i.split('/')[-1]) for i in glob.glob("face_data/*")])
    return max_id

refPt = []
cropping = False
img = None

def click_and_crop(event, x, y, flags, param):

    global refPt, cropping

    if event==cv2.EVENT_LBUTTONDOWN:
        refPt = [(x, y)]
        cropping = True
    elif event==cv2.EVENT_LBUTTONUP:
        refPt.append((x, y))
        cropping = False

        cv2.rectangle(img, refPt[0], refPt[1], (0, 255, 0), 2)

def get_data(img_, dst_dir, label, name_img):
    
    global img
    img = img_
    clone = img.copy()
    cv2.namedWindow("{}".format(name_img))
    cv2.setMouseCallback("{}".format(name_img), click_and_crop)

    while True:

        cv2.imshow("{}".format(name_img), img)
        key = cv2.waitKey(1) & 0xFF

        if key == ord("c"):
            break

    global refPt
    print(len(refPt), refPt)

    if len(refPt) == 2:
        roi = clone[refPt[0][1]:refPt[1][1], refPt[0][0]:refPt[1][0]]
        #roi = cv2.resize(roi, (180,180))
        print("{}/{}/{}.png".format(dst_dir, label, name_img))
        cv2.imwrite("{}/{}/{}.png".format(dst_dir, label, name_img), roi)
        refPt = []
    cv2.destroyWindow("{}".format(name_img))

def collect_data(src_dir, dst_dir, label):
    if not os.path.exists("{}/{}".format(dst_dir, label)):
        os.makedirs("{}/{}".format(dst_dir, label))
    list_img_files = glob.glob("{}/*".format(src_dir))
    
    for i, img_file in enumerate(list_img_files):
        img = cv2.imread(img_file)
        img = cv2.resize(img, (800, int(800*img.shape[0]/img.shape[1])))
        get_data(img, dst_dir, label, i)

def collect_raw_image_from_camera(dst_dir, sub_data):
    
    full_path = "{}/{}".format(dst_dir, sub_data)
    if not os.path.exists(full_path):
        os.makedirs(full_path)
    
    cam = cv2.VideoCapture(2)
    index = 0

    while cam.isOpened():
        _, frame = cam.read()
        cv2.imshow("raw_data", frame)
        key = cv2.waitKey(10) & 0xFF

        if key == ord("c"):
            cv2.imwrite("{}/{}.png".format(full_path, index), frame)
            print("Wrote img: {}".format("{}/{}.png".format(full_path, index), frame))
            index += 1

        if key == ord("q"):
            break;

if __name__ == "__main__":
    
    global args
    collect_raw_image_from_camera(TOP_RAW_IMG_DIR, args.raw_img_dir)
    print("===== CROP DATA ======[y/n]")
    ri = input()
    if ri!="y" and ri!="Y":
        pass
    collect_data("{}/{}".format(TOP_RAW_IMG_DIR, args.raw_img_dir), TOP_CROPPED_IMG_DIR, args.cropped_img_dir)

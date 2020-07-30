from rs_cam_lib import RealSense
from ApproachingDetection import ApproachingDetection
from BagReader import BagFileReader
from argparse import ArgumentParser
from utils import get_coord_object
import cv2
from sort import Sort
import numpy as np

# Take arguments from user input.
parser = ArgumentParser()
parser.add_argument("--path_bag", type=str, default=None,
            help="Video file to be processed.")
parser.add_argument("--get_object", type=int, default=1, help="0/1 whether get coordination about object")
parser.add_argument("--wcolor", type=int, default=None,
                    help="width of color image.")
parser.add_argument("--hcolor", type=int, default=None,
                    help="Height of color image.")
parser.add_argument("--wdepth", type=int, default=None,
                    help="Width of depth image.")
parser.add_argument("--hdepth", type=int, default=None,
                    help="Height of depth image.")
parser.add_argument("--ratecolor", type=int, default=None,
                    help="FPS of color image.")
parser.add_argument("--ratedepth", type=int, default=None,
                    help="FPS of depth image.")
parser.add_argument("--model", type=str, default=None,
                    help="FPS of depth image.")
parser.add_argument("--saved_video", type=str, default=None,
                            help="Name of video for saving.")

def main(path_bag, args):
    print(args.path_bag)
    bagreader = BagFileReader(args.path_bag, args.wcolor, args.hcolor, args.wdepth,\
            args.hdepth, args.ratecolor, args.ratedepth)

    sample_frame = bagreader.get_color_frame()
    height, width, _ = sample_frame.shape
    fourcc = cv2.VideoWriter_fourcc(*'MJPG')
    out = cv2.VideoWriter('output-%s.avi' % args.saved_video, fourcc, 10, (width, height))
    if args.get_object:
        get_coord_object(sample_frame, "config", "coord.txt")

    app_detect = ApproachingDetection("config/coord.txt", args.model)
    app_detect.set_tracking_type(2)
    last_frame = None
    last_dict_humans = None
    new_dict_humans = None

    tracker = Sort(3, 10)

    while True:

        #frame = bagreader.get_color_frame()
        color_frame, depth_frame = bagreader.get_depth_color_frame()
        frame = bagreader.convert_color_frame_to_array(color_frame)
        processed_frame = frame
        frame = cv2.cvtColor(frame,cv2.COLOR_BGR2RGB)
        if frame is False:
            break
        
        h, w, _ = frame.shape
        humans = app_detect.get_humans(frame)
        human_boxes = []

        for human in humans:
            box = app_detect._get_box_from_human_pose(human, w, h)
            x1, y1, x2, y2 = box[0][0], box[0][1], box[1][0], box[1][1]
            if x1 < 0: x1 = 0
            if y1 < 0: y1 = 0
            if x2 >= w: x2 = w-1
            if y2 >= h: y2 = h-1
            tmp_box = [x1, y1, x2, y2, 1]
            human_boxes.append(tmp_box)
        np_human_boxes = np.array(human_boxes)
        
        trackers = []

        if len(human_boxes) > 0:
            trackers = tracker.update(np_human_boxes)

        for d in trackers:
            print(d)
            cv2.rectangle(frame, (int(d[0]), int(d[1])), (int(d[2]), int(d[3])), (0, 255, 0), 2)

            font = cv2.FONT_HERSHEY_SIMPLEX 
            # org 
            org = (int(d[0]), int(d[1]) )
              
            # fontScale 
            fontScale = 1
               
            # Blue color in BGR 
            color = (255, 0, 0) 
              
            # Line thickness of 2 px 
            thickness = 2
               
            # Using cv2.putText() method 
            frame = cv2.putText(frame, '{}'.format(d[4]), org, font,  
                               fontScale, color, thickness, cv2.LINE_AA) 

        cv2.imshow("Track", frame)
        cv2.waitKey(10)

if __name__=="__main__":
    args = parser.parse_args()
    main(args.path_bag, args)


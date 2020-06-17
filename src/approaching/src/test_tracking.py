from rs_cam_lib import RealSense
from ApproachingDetection import ApproachingDetection
from BagReader import BagFileReader
from argparse import ArgumentParser
from utils import get_coord_object
import cv2
from tracker import Tracker

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
parser.add_argument("--tracktype", type=int, default=None,
                                    help="Id of tracking algorithm.")

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
    app_detect.set_tracking_type(args.tracktype)
    last_frame = None
    last_dict_humans = None
    new_dict_humans = None
    tracker = Tracker(args.tracktype)

    while True:

        #frame = bagreader.get_color_frame()
        color_frame, depth_frame = bagreader.get_depth_color_frame()
        frame = bagreader.convert_color_frame_to_array(color_frame)
        processed_frame = frame
        frame = cv2.cvtColor(frame,cv2.COLOR_BGR2RGB)
        if frame is False:
            break

        c = cv2.waitKey(1) & 0xFF
        if c == ord('t'):
            box = get_coord_object(frame)
            tracker.init(box, frame)

        if tracker.inited:
            ok, box = tracker.get_update(frame)
            print(ok)
            if ok:
                frame = cv2.rectangle(frame, box[0], box[1], (0, 255, 0))

        cv2.imshow("Track", frame)

if __name__=="__main__":
    args = parser.parse_args()
    main(args.path_bag, args)

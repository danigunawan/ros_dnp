from rs_cam_lib import RealSense
from ApproachingDetection import ApproachingDetection
from BagReader import BagFileReader
from argparse import ArgumentParser
from utils import get_coord_object
import cv2

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
                                    help="Id of tracking algorithm")

def main(path_bag, args):
    bagreader = BagFileReader(args.path_bag, args.wcolor, args.hcolor, args.wdepth,\
            args.hdepth, args.ratecolor, args.ratedepth)
    
    sample_frame = bagreader.get_color_frame()
    height, width, _ = sample_frame.shape
    fourcc = cv2.VideoWriter_fourcc(*'MJPG')
    out = cv2.VideoWriter('output-%s.avi' % args.saved_video, fourcc, 10, (width, height))
    if args.get_object:
        get_coord_object(sample_frame, "config", "coord.txt")

    app_detect = ApproachingDetection("config/coord.txt", args.model)
    last_frame = None
    last_dict_humans = None
    new_dict_humans = None
    app_detect.set_tracking_type(args.tracktype)

    while True:

        #frame = bagreader.get_color_frame()
        color_frame, depth_frame = bagreader.get_depth_color_frame()
        frame = bagreader.convert_color_frame_to_array(color_frame)
        processed_frame = frame
        frame = cv2.cvtColor(frame,cv2.COLOR_BGR2RGB)
        if frame is False:
            break
        humans = app_detect.get_humans(frame)

        if last_frame is not None and last_dict_humans is not None:
           new_dict_humans = app_detect.identify_human(last_dict_humans, \
                   humans, last_frame, frame, thresh=2, method="orb", viz=True)
           app_detect.get_depth_for_humans(new_dict_humans, bagreader, \
                   color_frame, depth_frame)
        
        if new_dict_humans is not None:
            processed_frame=app_detect.visualize_human(new_dict_humans, frame)
        else:
            processed_frame = app_detect.visualize_human(humans, processed_frame)
        
        last_frame = frame
        if last_dict_humans is None:
           last_dict_humans = app_detect.create_first_human_dict(humans, frame)
        else:
           last_dict_humans = new_dict_humans

        cv2.imshow("Processed frame", processed_frame)
        cv2.waitKey(10)
        out.write(processed_frame)

    out.release()

if __name__=="__main__":
    args = parser.parse_args()
    main(args.path_bag, args)

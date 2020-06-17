## Requirements
1. Python==3.5.x
2. hand_waving project
3. pyrealsense2

## Setup

In setup.sh:
export path_to_hand_waving_project:$PYTHONPATH

## Testing 

First, source setup.sh
Run: python test_video.py --path_bag=/home/vision/work/computer_vision_projects/ActionRecognitionGazeSample/side/20200407_151647_cut17.bag --get_object=0 --wcolor=640 --hcolor=480 --wdepth=848 --hdepth=480 --ratedepth=30 --ratecolor=30 --model=cmu --saved_video=3 --tracktype=1

If you done provide --path_bag option, program will get data from camera device plug in computer.


## Human identify: 
1. Tracking, in this way, dict_human will consist other attribute is tracker
    1. pose estimation
    2. object tracking 
    3. matching box of object tracking with box of human (in pose estimation)
        with max(IoU)
    4. if one human has no tracking box intersect -> new human (init tracker), create new tracking, if box tracking has no human intersects -> delete it.
    5. return step 1
2. Detection

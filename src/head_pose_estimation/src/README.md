# Head pose estimation

In this project, we use combine face_detection (RetinaFace of InsightFace) and facial landmark detection of https://github.com/yinguobing/head-pose-estimation/
So you need to install InsightFace (https://github.com/deepinsight/insightface) and head-pose-estimation ( https://github.com/yinguobing/head-pose-estimation/)

# Setup

Edit file setup.bash

export PYTHONPATH=$PYTHONPATH:$PATH_TO_INSIGHTFACE/RetinaFace

where $INSIGHTFACE is path to insightface project

# Run

First, you must run: source setup.bash
Second, you have 2 options to choose:
    * Run with webcam: python insight_face_webcam.py --cam=2 , where 2 is id of cam
    * Run with video : python insight_face.py --video=path_to_video --name_output=name_of_saving_video --fps=fps_of_output_video(should equal fps of algorithm testing on video)





















































































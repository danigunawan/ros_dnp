"""Demo code shows how to estimate human head pose.
Currently, human face is detected by a detector from an OpenCV DNN module.
Then the face box is modified a little to suits the need of landmark
detection. The facial landmark detection is done by a custom Convolutional
Neural Network trained with TensorFlow. After that, head pose is estimated
by solving a PnP problem.
"""
from argparse import ArgumentParser
from multiprocessing import Process, Queue

import cv2
import numpy as np

from mark_detector import MarkDetector
from os_detector import detect_os
from pose_estimator import PoseEstimator
from stabilizer import Stabilizer
import pyrealsense2 as rs
import time 
from retinaface import RetinaFace



detector = RetinaFace('./model/R50', 0, 0, 'net3')

print("OpenCV version: {}".format(cv2.__version__))

# multiprocessing may not work on Windows and macOS, check OS for safety.
detect_os()

CNN_INPUT_SIZE = 128

# Take arguments from user input.
parser = ArgumentParser()
parser.add_argument("--cam", type=int, default=None,
                    help="The webcam index.")
parser.add_argument("--name_output", type=str, help="Name of output video.")
parser.add_argument("--fps", type=int, default=5, help="fps of video output")
args = parser.parse_args()


def get_face(detector, img_queue, box_queue):
    """Get face from image queue. This function is used for multiprocessing"""
    while True:
        image = img_queue.get()
        box = detector.extract_cnn_facebox(image)
        box_queue.put(box)


def main():
    # Introduce mark_detector to detect landmarks.
    mark_detector = MarkDetector()

    cam = cv2.VideoCapture(args.cam)
    _, sample_frame = cam.read()
    sample_frame = cv2.cvtColor(sample_frame,cv2.COLOR_BGR2RGB)
    height, width, _ = sample_frame.shape
    fourcc = cv2.VideoWriter_fourcc(*'MJPG')
    out = cv2.VideoWriter('output-%s.avi' % args.name_output, fourcc, args.fps, (width, height))
    
    im_shape = sample_frame.shape
    #scales = [1024, 1980]
    scales = [480*2, 640*2]
    target_size = scales[0]
    max_size = scales[1]
    im_size_min = np.min(im_shape[0:2])
    im_size_max = np.max(im_shape[0:2])
    im_scale = float(target_size) / float(im_size_min)
    thresh = 0.8

    if np.round(im_scale * im_size_max) > max_size:
        im_scale = float(max_size) / float(im_size_max)

    scales = [im_scale]
    # Introduce pose estimator to solve pose. Get one frame to setup the
    # estimator according to the image size.
    height, width = sample_frame.shape[:2]
    pose_estimator = PoseEstimator(img_size=(height, width))

    # Introduce scalar stabilizers for pose.
    pose_stabilizers = [Stabilizer(
        state_num=2,
        measure_num=1,
        cov_process=0.1,
        cov_measure=0.1) for _ in range(6)]

    tm = cv2.TickMeter()


    while True:

        t1 = time.time()
        # Read frame, crop it, flip it, suits your needs.
        _, frame = cam.read()
        #frame = cv2.cvtColor(frame,cv2.COLOR_BGR2RGB)
        if frame is False:
            break

        # Crop it if frame is larger than expected.
        # frame = frame[0:480, 300:940]

        # If frame comes from webcam, flip it so it looks like a mirror.
        # if video_src == 0:
        #     frame = cv2.flip(frame, 2)

        # Pose estimation by 3 steps:
        # 1. detect face;
        # 2. detect landmarks;
        # 3. estimate pose

        # Feed frame to image queue.
        #img_queue.put(frame)

        # Get face from box queue.
        #faceboxes = box_queue.get()
        faceboxes, landmark = detector.detect(frame, thresh, scales=scales, do_flip=False)
        print(faceboxes)
        
        mess = "Not detect pose"
        
        if faceboxes is not None and len(faceboxes) > 0:
            #if isinstance(faceboxes[1], int):
            #    faceboxes = [faceboxes]
            for facebox in faceboxes:
                facebox = facebox.astype(np.int)
                # Detect landmarks from image of 128x128.
                face_img = frame[facebox[1]: facebox[3],
                                facebox[0]: facebox[2]]
                face_img = cv2.resize(face_img, (CNN_INPUT_SIZE, CNN_INPUT_SIZE))
                face_img = cv2.cvtColor(face_img, cv2.COLOR_BGR2RGB)

                tm.start()
                marks = mark_detector.detect_marks([face_img])
                tm.stop()

                # Convert the marks locations from local CNN to global image.
                marks *= (facebox[2] - facebox[0])
                marks[:, 0] += facebox[0]
                marks[:, 1] += facebox[1]

                # Uncomment following line to show raw marks.
                # mark_detector.draw_marks(
                #     frame, marks, color=(0, 255, 0))

                # Uncomment following line to show facebox.
                # mark_detector.draw_box(frame, [facebox])

                # Try pose estimation with 68 points.
                pose = pose_estimator.solve_pose_by_68_points(marks)

                # Stabilize the pose.
                steady_pose = []
                pose_np = np.array(pose).flatten()
                for value, ps_stb in zip(pose_np, pose_stabilizers):
                    ps_stb.update([value])
                    steady_pose.append(ps_stb.state[0])
                steady_pose = np.reshape(steady_pose, (-1, 3))

                # Uncomment following line to draw pose annotation on frame.
                pose_estimator.draw_annotation_box(
                    frame, pose[0], pose[1], color=(255, 128, 128))

                # Uncomment following line to draw stabile pose annotation on frame.
                t2 = time.time()
                mess=round(1/(t2-t1), 2)
                # pose_estimator.draw_annotation_box(
                #     frame, steady_pose[0], steady_pose[1], color=(128, 255, 128))
                
                # Uncomment following line to draw head axes on frame.
                # pose_estimator.draw_axes(frame, stabile_pose[0], stabile_pose[1])

        cv2.putText(frame, "FPS: " + "{}".format(mess), (20, 20), cv2.FONT_HERSHEY_SIMPLEX,
                                0.75, (0, 255, 0), thickness=2)
        # Show preview.
        cv2.imshow("Preview", frame)
        out.write(frame)
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    out.release()
    # Clean up the multiprocessing process.
    box_process.terminate()
    box_process.join()


if __name__ == '__main__':
    main()

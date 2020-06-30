## 1. Dependencies
* rospy
* Dependencies of child package

## 2. Install 

<code>
cd ~/your_path/catkin_ws

catkin_make
</code>

## 3. Run

### 3.1. Node Camera
<code>cd ~/your_path/catkin_ws

source devel/setup.bash

roslaunch realsense2_camera rs_from_file.launch </code>

**Note**: This node will publish topic related to image stream : color stream (/camera/color/image_raw), aligned depth stream (/camera/aligned_depth_to_color/image_raw), ...

### 3.2. Node Pose estimator

<code>
cd ~/your_path/catkin_ws

source devel/setup.bash

source setup.sh

roslaunch tfpose_ros demo_video.launch
</code>

**Note**: 
* In file </em>demo_video.launch</em>, you need to change parameter <em>value="/camera/color/image_raw" </em> to change source of image stream.
* This node will publish topic related to information of human's pose (/pose_estimator/pose)

### 3.3 Object Template Matching Node

<code>
cd ~/your_path/catkin_ws

source devel/setup.bash

cd ~/your_path/catkin_ws/src/smelling_detection/src

source setup.bash

python object_checking_ros.py
</code>

**Note**:
* This node will publish message related to object on /object_status topic

### 3.4 Approaching Node

<code>
cd ~/your_path/catkin_ws

source devel/setup.bash

cd ~/your_path/catkin_ws/src/approaching/src

source setup.bash

python ApproachingNode.py
</code>

**Note**:
* This node will publish message related to Approaching information on /approach_info topic


### 3.5 Picking Node

<code>
cd ~/your_path/catkin_ws

source devel/setup.bash

cd ~/your_path/catkin_ws/src/smelling_detection/src

source setup.bash

python picking_detection_ros.py
</code>

**Note**:
* This node will publish message related to Picking information on /pick_info topic


### 3.6 Gazing Node

<code>
cd ~/your_path/catkin_ws

source devel/setup.bash

cd ~/your_path/catkin_ws/src/head_pose_estimation/src

source setup.bash

python head_pose_ros_dlib.py 
</code>

**Note**:
* This node will publish message related to Gazing information on /headpose_info topic


### 3.7 Central Node

<code>
cd ~/your_path/catkin_ws

source devel/setup.bash

cd ~/your_path/catkin_ws/src/central_logic/src

python central_logic.py
</code>

**Note**:
* This node will export file log.csv
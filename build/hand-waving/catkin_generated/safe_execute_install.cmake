execute_process(COMMAND "/home/vision/work/computer_vision_projects/catkin_ws/build/hand-waving/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/vision/work/computer_vision_projects/catkin_ws/build/hand-waving/catkin_generated/python_distutils_install.sh) returned error code ")
endif()

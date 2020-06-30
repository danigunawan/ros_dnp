# Install script for directory: /home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/vision/work/computer_vision_projects/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/smelling_detection/msg" TYPE FILE FILES
    "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/ObjectStatus.msg"
    "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Rectangle.msg"
    "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/PickingInfo.msg"
    "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Coord2D.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/smelling_detection/cmake" TYPE FILE FILES "/home/vision/work/computer_vision_projects/catkin_ws/build/smelling_detection/catkin_generated/installspace/smelling_detection-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/vision/work/computer_vision_projects/catkin_ws/devel/include/smelling_detection")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/vision/work/computer_vision_projects/catkin_ws/devel/share/roseus/ros/smelling_detection")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/vision/work/computer_vision_projects/catkin_ws/devel/share/common-lisp/ros/smelling_detection")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/vision/work/computer_vision_projects/catkin_ws/devel/share/gennodejs/ros/smelling_detection")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/vision/work/computer_vision_projects/catkin_ws/devel/lib/python2.7/dist-packages/smelling_detection")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/vision/work/computer_vision_projects/catkin_ws/devel/lib/python2.7/dist-packages/smelling_detection")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/vision/work/computer_vision_projects/catkin_ws/build/smelling_detection/catkin_generated/installspace/smelling_detection.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/smelling_detection/cmake" TYPE FILE FILES "/home/vision/work/computer_vision_projects/catkin_ws/build/smelling_detection/catkin_generated/installspace/smelling_detection-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/smelling_detection/cmake" TYPE FILE FILES
    "/home/vision/work/computer_vision_projects/catkin_ws/build/smelling_detection/catkin_generated/installspace/smelling_detectionConfig.cmake"
    "/home/vision/work/computer_vision_projects/catkin_ws/build/smelling_detection/catkin_generated/installspace/smelling_detectionConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/smelling_detection" TYPE FILE FILES "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/package.xml")
endif()


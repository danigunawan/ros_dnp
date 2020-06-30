# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "head_pose_estimation: 2 messages, 0 services")

set(MSG_I_FLAGS "-Ihead_pose_estimation:/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(head_pose_estimation_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/Coord2D.msg" NAME_WE)
add_custom_target(_head_pose_estimation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "head_pose_estimation" "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/Coord2D.msg" ""
)

get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/GazingInfo.msg" NAME_WE)
add_custom_target(_head_pose_estimation_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "head_pose_estimation" "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/GazingInfo.msg" "head_pose_estimation/Coord2D"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(head_pose_estimation
  "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/Coord2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/head_pose_estimation
)
_generate_msg_cpp(head_pose_estimation
  "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/GazingInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/Coord2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/head_pose_estimation
)

### Generating Services

### Generating Module File
_generate_module_cpp(head_pose_estimation
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/head_pose_estimation
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(head_pose_estimation_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(head_pose_estimation_generate_messages head_pose_estimation_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/Coord2D.msg" NAME_WE)
add_dependencies(head_pose_estimation_generate_messages_cpp _head_pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/GazingInfo.msg" NAME_WE)
add_dependencies(head_pose_estimation_generate_messages_cpp _head_pose_estimation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(head_pose_estimation_gencpp)
add_dependencies(head_pose_estimation_gencpp head_pose_estimation_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS head_pose_estimation_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(head_pose_estimation
  "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/Coord2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/head_pose_estimation
)
_generate_msg_eus(head_pose_estimation
  "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/GazingInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/Coord2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/head_pose_estimation
)

### Generating Services

### Generating Module File
_generate_module_eus(head_pose_estimation
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/head_pose_estimation
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(head_pose_estimation_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(head_pose_estimation_generate_messages head_pose_estimation_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/Coord2D.msg" NAME_WE)
add_dependencies(head_pose_estimation_generate_messages_eus _head_pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/GazingInfo.msg" NAME_WE)
add_dependencies(head_pose_estimation_generate_messages_eus _head_pose_estimation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(head_pose_estimation_geneus)
add_dependencies(head_pose_estimation_geneus head_pose_estimation_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS head_pose_estimation_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(head_pose_estimation
  "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/Coord2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/head_pose_estimation
)
_generate_msg_lisp(head_pose_estimation
  "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/GazingInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/Coord2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/head_pose_estimation
)

### Generating Services

### Generating Module File
_generate_module_lisp(head_pose_estimation
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/head_pose_estimation
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(head_pose_estimation_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(head_pose_estimation_generate_messages head_pose_estimation_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/Coord2D.msg" NAME_WE)
add_dependencies(head_pose_estimation_generate_messages_lisp _head_pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/GazingInfo.msg" NAME_WE)
add_dependencies(head_pose_estimation_generate_messages_lisp _head_pose_estimation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(head_pose_estimation_genlisp)
add_dependencies(head_pose_estimation_genlisp head_pose_estimation_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS head_pose_estimation_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(head_pose_estimation
  "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/Coord2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/head_pose_estimation
)
_generate_msg_nodejs(head_pose_estimation
  "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/GazingInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/Coord2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/head_pose_estimation
)

### Generating Services

### Generating Module File
_generate_module_nodejs(head_pose_estimation
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/head_pose_estimation
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(head_pose_estimation_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(head_pose_estimation_generate_messages head_pose_estimation_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/Coord2D.msg" NAME_WE)
add_dependencies(head_pose_estimation_generate_messages_nodejs _head_pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/GazingInfo.msg" NAME_WE)
add_dependencies(head_pose_estimation_generate_messages_nodejs _head_pose_estimation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(head_pose_estimation_gennodejs)
add_dependencies(head_pose_estimation_gennodejs head_pose_estimation_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS head_pose_estimation_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(head_pose_estimation
  "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/Coord2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/head_pose_estimation
)
_generate_msg_py(head_pose_estimation
  "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/GazingInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/Coord2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/head_pose_estimation
)

### Generating Services

### Generating Module File
_generate_module_py(head_pose_estimation
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/head_pose_estimation
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(head_pose_estimation_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(head_pose_estimation_generate_messages head_pose_estimation_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/Coord2D.msg" NAME_WE)
add_dependencies(head_pose_estimation_generate_messages_py _head_pose_estimation_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/head_pose_estimation/msg/GazingInfo.msg" NAME_WE)
add_dependencies(head_pose_estimation_generate_messages_py _head_pose_estimation_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(head_pose_estimation_genpy)
add_dependencies(head_pose_estimation_genpy head_pose_estimation_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS head_pose_estimation_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/head_pose_estimation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/head_pose_estimation
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(head_pose_estimation_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/head_pose_estimation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/head_pose_estimation
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(head_pose_estimation_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/head_pose_estimation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/head_pose_estimation
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(head_pose_estimation_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/head_pose_estimation)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/head_pose_estimation
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(head_pose_estimation_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/head_pose_estimation)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/head_pose_estimation\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/head_pose_estimation
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(head_pose_estimation_generate_messages_py std_msgs_generate_messages_py)
endif()

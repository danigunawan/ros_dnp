# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "approaching: 2 messages, 0 services")

set(MSG_I_FLAGS "-Iapproaching:/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(approaching_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/ApproachInfo.msg" NAME_WE)
add_custom_target(_approaching_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "approaching" "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/ApproachInfo.msg" "approaching/Coord"
)

get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/Coord.msg" NAME_WE)
add_custom_target(_approaching_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "approaching" "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/Coord.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(approaching
  "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/Coord.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/approaching
)
_generate_msg_cpp(approaching
  "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/ApproachInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/Coord.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/approaching
)

### Generating Services

### Generating Module File
_generate_module_cpp(approaching
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/approaching
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(approaching_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(approaching_generate_messages approaching_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/ApproachInfo.msg" NAME_WE)
add_dependencies(approaching_generate_messages_cpp _approaching_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/Coord.msg" NAME_WE)
add_dependencies(approaching_generate_messages_cpp _approaching_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(approaching_gencpp)
add_dependencies(approaching_gencpp approaching_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS approaching_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(approaching
  "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/Coord.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/approaching
)
_generate_msg_eus(approaching
  "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/ApproachInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/Coord.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/approaching
)

### Generating Services

### Generating Module File
_generate_module_eus(approaching
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/approaching
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(approaching_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(approaching_generate_messages approaching_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/ApproachInfo.msg" NAME_WE)
add_dependencies(approaching_generate_messages_eus _approaching_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/Coord.msg" NAME_WE)
add_dependencies(approaching_generate_messages_eus _approaching_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(approaching_geneus)
add_dependencies(approaching_geneus approaching_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS approaching_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(approaching
  "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/Coord.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/approaching
)
_generate_msg_lisp(approaching
  "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/ApproachInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/Coord.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/approaching
)

### Generating Services

### Generating Module File
_generate_module_lisp(approaching
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/approaching
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(approaching_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(approaching_generate_messages approaching_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/ApproachInfo.msg" NAME_WE)
add_dependencies(approaching_generate_messages_lisp _approaching_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/Coord.msg" NAME_WE)
add_dependencies(approaching_generate_messages_lisp _approaching_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(approaching_genlisp)
add_dependencies(approaching_genlisp approaching_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS approaching_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(approaching
  "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/Coord.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/approaching
)
_generate_msg_nodejs(approaching
  "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/ApproachInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/Coord.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/approaching
)

### Generating Services

### Generating Module File
_generate_module_nodejs(approaching
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/approaching
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(approaching_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(approaching_generate_messages approaching_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/ApproachInfo.msg" NAME_WE)
add_dependencies(approaching_generate_messages_nodejs _approaching_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/Coord.msg" NAME_WE)
add_dependencies(approaching_generate_messages_nodejs _approaching_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(approaching_gennodejs)
add_dependencies(approaching_gennodejs approaching_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS approaching_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(approaching
  "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/Coord.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/approaching
)
_generate_msg_py(approaching
  "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/ApproachInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/Coord.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/approaching
)

### Generating Services

### Generating Module File
_generate_module_py(approaching
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/approaching
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(approaching_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(approaching_generate_messages approaching_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/ApproachInfo.msg" NAME_WE)
add_dependencies(approaching_generate_messages_py _approaching_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/approaching/msg/Coord.msg" NAME_WE)
add_dependencies(approaching_generate_messages_py _approaching_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(approaching_genpy)
add_dependencies(approaching_genpy approaching_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS approaching_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/approaching)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/approaching
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(approaching_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/approaching)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/approaching
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(approaching_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/approaching)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/approaching
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(approaching_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/approaching)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/approaching
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(approaching_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/approaching)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/approaching\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/approaching
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(approaching_generate_messages_py std_msgs_generate_messages_py)
endif()

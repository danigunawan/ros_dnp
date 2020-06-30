# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "smelling_detection: 4 messages, 0 services")

set(MSG_I_FLAGS "-Ismelling_detection:/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(smelling_detection_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Rectangle.msg" NAME_WE)
add_custom_target(_smelling_detection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "smelling_detection" "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Rectangle.msg" ""
)

get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/PickingInfo.msg" NAME_WE)
add_custom_target(_smelling_detection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "smelling_detection" "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/PickingInfo.msg" "smelling_detection/Coord2D"
)

get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Coord2D.msg" NAME_WE)
add_custom_target(_smelling_detection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "smelling_detection" "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Coord2D.msg" ""
)

get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/ObjectStatus.msg" NAME_WE)
add_custom_target(_smelling_detection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "smelling_detection" "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/ObjectStatus.msg" "smelling_detection/Rectangle"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(smelling_detection
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Rectangle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/smelling_detection
)
_generate_msg_cpp(smelling_detection
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/PickingInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Coord2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/smelling_detection
)
_generate_msg_cpp(smelling_detection
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Coord2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/smelling_detection
)
_generate_msg_cpp(smelling_detection
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/ObjectStatus.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Rectangle.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/smelling_detection
)

### Generating Services

### Generating Module File
_generate_module_cpp(smelling_detection
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/smelling_detection
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(smelling_detection_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(smelling_detection_generate_messages smelling_detection_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Rectangle.msg" NAME_WE)
add_dependencies(smelling_detection_generate_messages_cpp _smelling_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/PickingInfo.msg" NAME_WE)
add_dependencies(smelling_detection_generate_messages_cpp _smelling_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Coord2D.msg" NAME_WE)
add_dependencies(smelling_detection_generate_messages_cpp _smelling_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/ObjectStatus.msg" NAME_WE)
add_dependencies(smelling_detection_generate_messages_cpp _smelling_detection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(smelling_detection_gencpp)
add_dependencies(smelling_detection_gencpp smelling_detection_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS smelling_detection_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(smelling_detection
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Rectangle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/smelling_detection
)
_generate_msg_eus(smelling_detection
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/PickingInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Coord2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/smelling_detection
)
_generate_msg_eus(smelling_detection
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Coord2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/smelling_detection
)
_generate_msg_eus(smelling_detection
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/ObjectStatus.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Rectangle.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/smelling_detection
)

### Generating Services

### Generating Module File
_generate_module_eus(smelling_detection
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/smelling_detection
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(smelling_detection_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(smelling_detection_generate_messages smelling_detection_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Rectangle.msg" NAME_WE)
add_dependencies(smelling_detection_generate_messages_eus _smelling_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/PickingInfo.msg" NAME_WE)
add_dependencies(smelling_detection_generate_messages_eus _smelling_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Coord2D.msg" NAME_WE)
add_dependencies(smelling_detection_generate_messages_eus _smelling_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/ObjectStatus.msg" NAME_WE)
add_dependencies(smelling_detection_generate_messages_eus _smelling_detection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(smelling_detection_geneus)
add_dependencies(smelling_detection_geneus smelling_detection_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS smelling_detection_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(smelling_detection
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Rectangle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/smelling_detection
)
_generate_msg_lisp(smelling_detection
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/PickingInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Coord2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/smelling_detection
)
_generate_msg_lisp(smelling_detection
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Coord2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/smelling_detection
)
_generate_msg_lisp(smelling_detection
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/ObjectStatus.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Rectangle.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/smelling_detection
)

### Generating Services

### Generating Module File
_generate_module_lisp(smelling_detection
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/smelling_detection
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(smelling_detection_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(smelling_detection_generate_messages smelling_detection_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Rectangle.msg" NAME_WE)
add_dependencies(smelling_detection_generate_messages_lisp _smelling_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/PickingInfo.msg" NAME_WE)
add_dependencies(smelling_detection_generate_messages_lisp _smelling_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Coord2D.msg" NAME_WE)
add_dependencies(smelling_detection_generate_messages_lisp _smelling_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/ObjectStatus.msg" NAME_WE)
add_dependencies(smelling_detection_generate_messages_lisp _smelling_detection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(smelling_detection_genlisp)
add_dependencies(smelling_detection_genlisp smelling_detection_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS smelling_detection_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(smelling_detection
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Rectangle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/smelling_detection
)
_generate_msg_nodejs(smelling_detection
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/PickingInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Coord2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/smelling_detection
)
_generate_msg_nodejs(smelling_detection
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Coord2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/smelling_detection
)
_generate_msg_nodejs(smelling_detection
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/ObjectStatus.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Rectangle.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/smelling_detection
)

### Generating Services

### Generating Module File
_generate_module_nodejs(smelling_detection
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/smelling_detection
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(smelling_detection_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(smelling_detection_generate_messages smelling_detection_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Rectangle.msg" NAME_WE)
add_dependencies(smelling_detection_generate_messages_nodejs _smelling_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/PickingInfo.msg" NAME_WE)
add_dependencies(smelling_detection_generate_messages_nodejs _smelling_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Coord2D.msg" NAME_WE)
add_dependencies(smelling_detection_generate_messages_nodejs _smelling_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/ObjectStatus.msg" NAME_WE)
add_dependencies(smelling_detection_generate_messages_nodejs _smelling_detection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(smelling_detection_gennodejs)
add_dependencies(smelling_detection_gennodejs smelling_detection_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS smelling_detection_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(smelling_detection
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Rectangle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/smelling_detection
)
_generate_msg_py(smelling_detection
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/PickingInfo.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Coord2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/smelling_detection
)
_generate_msg_py(smelling_detection
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Coord2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/smelling_detection
)
_generate_msg_py(smelling_detection
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/ObjectStatus.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Rectangle.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/smelling_detection
)

### Generating Services

### Generating Module File
_generate_module_py(smelling_detection
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/smelling_detection
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(smelling_detection_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(smelling_detection_generate_messages smelling_detection_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Rectangle.msg" NAME_WE)
add_dependencies(smelling_detection_generate_messages_py _smelling_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/PickingInfo.msg" NAME_WE)
add_dependencies(smelling_detection_generate_messages_py _smelling_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/Coord2D.msg" NAME_WE)
add_dependencies(smelling_detection_generate_messages_py _smelling_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg/ObjectStatus.msg" NAME_WE)
add_dependencies(smelling_detection_generate_messages_py _smelling_detection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(smelling_detection_genpy)
add_dependencies(smelling_detection_genpy smelling_detection_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS smelling_detection_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/smelling_detection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/smelling_detection
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(smelling_detection_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/smelling_detection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/smelling_detection
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(smelling_detection_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/smelling_detection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/smelling_detection
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(smelling_detection_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/smelling_detection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/smelling_detection
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(smelling_detection_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/smelling_detection)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/smelling_detection\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/smelling_detection
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(smelling_detection_generate_messages_py std_msgs_generate_messages_py)
endif()

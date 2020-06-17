# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "tfpose_ros: 3 messages, 0 services")

set(MSG_I_FLAGS "-Itfpose_ros:/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(tfpose_ros_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Person.msg" NAME_WE)
add_custom_target(_tfpose_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tfpose_ros" "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Person.msg" "tfpose_ros/BodyPartElm"
)

get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Persons.msg" NAME_WE)
add_custom_target(_tfpose_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tfpose_ros" "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Persons.msg" "tfpose_ros/Person:tfpose_ros/BodyPartElm:std_msgs/Header"
)

get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/BodyPartElm.msg" NAME_WE)
add_custom_target(_tfpose_ros_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "tfpose_ros" "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/BodyPartElm.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(tfpose_ros
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Person.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/BodyPartElm.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tfpose_ros
)
_generate_msg_cpp(tfpose_ros
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Persons.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Person.msg;/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/BodyPartElm.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tfpose_ros
)
_generate_msg_cpp(tfpose_ros
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/BodyPartElm.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tfpose_ros
)

### Generating Services

### Generating Module File
_generate_module_cpp(tfpose_ros
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tfpose_ros
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(tfpose_ros_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(tfpose_ros_generate_messages tfpose_ros_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Person.msg" NAME_WE)
add_dependencies(tfpose_ros_generate_messages_cpp _tfpose_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Persons.msg" NAME_WE)
add_dependencies(tfpose_ros_generate_messages_cpp _tfpose_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/BodyPartElm.msg" NAME_WE)
add_dependencies(tfpose_ros_generate_messages_cpp _tfpose_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tfpose_ros_gencpp)
add_dependencies(tfpose_ros_gencpp tfpose_ros_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tfpose_ros_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(tfpose_ros
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Person.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/BodyPartElm.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tfpose_ros
)
_generate_msg_eus(tfpose_ros
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Persons.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Person.msg;/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/BodyPartElm.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tfpose_ros
)
_generate_msg_eus(tfpose_ros
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/BodyPartElm.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tfpose_ros
)

### Generating Services

### Generating Module File
_generate_module_eus(tfpose_ros
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tfpose_ros
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(tfpose_ros_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(tfpose_ros_generate_messages tfpose_ros_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Person.msg" NAME_WE)
add_dependencies(tfpose_ros_generate_messages_eus _tfpose_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Persons.msg" NAME_WE)
add_dependencies(tfpose_ros_generate_messages_eus _tfpose_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/BodyPartElm.msg" NAME_WE)
add_dependencies(tfpose_ros_generate_messages_eus _tfpose_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tfpose_ros_geneus)
add_dependencies(tfpose_ros_geneus tfpose_ros_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tfpose_ros_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(tfpose_ros
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Person.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/BodyPartElm.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tfpose_ros
)
_generate_msg_lisp(tfpose_ros
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Persons.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Person.msg;/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/BodyPartElm.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tfpose_ros
)
_generate_msg_lisp(tfpose_ros
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/BodyPartElm.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tfpose_ros
)

### Generating Services

### Generating Module File
_generate_module_lisp(tfpose_ros
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tfpose_ros
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(tfpose_ros_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(tfpose_ros_generate_messages tfpose_ros_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Person.msg" NAME_WE)
add_dependencies(tfpose_ros_generate_messages_lisp _tfpose_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Persons.msg" NAME_WE)
add_dependencies(tfpose_ros_generate_messages_lisp _tfpose_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/BodyPartElm.msg" NAME_WE)
add_dependencies(tfpose_ros_generate_messages_lisp _tfpose_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tfpose_ros_genlisp)
add_dependencies(tfpose_ros_genlisp tfpose_ros_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tfpose_ros_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(tfpose_ros
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Person.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/BodyPartElm.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tfpose_ros
)
_generate_msg_nodejs(tfpose_ros
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Persons.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Person.msg;/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/BodyPartElm.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tfpose_ros
)
_generate_msg_nodejs(tfpose_ros
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/BodyPartElm.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tfpose_ros
)

### Generating Services

### Generating Module File
_generate_module_nodejs(tfpose_ros
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tfpose_ros
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(tfpose_ros_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(tfpose_ros_generate_messages tfpose_ros_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Person.msg" NAME_WE)
add_dependencies(tfpose_ros_generate_messages_nodejs _tfpose_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Persons.msg" NAME_WE)
add_dependencies(tfpose_ros_generate_messages_nodejs _tfpose_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/BodyPartElm.msg" NAME_WE)
add_dependencies(tfpose_ros_generate_messages_nodejs _tfpose_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tfpose_ros_gennodejs)
add_dependencies(tfpose_ros_gennodejs tfpose_ros_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tfpose_ros_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(tfpose_ros
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Person.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/BodyPartElm.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tfpose_ros
)
_generate_msg_py(tfpose_ros
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Persons.msg"
  "${MSG_I_FLAGS}"
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Person.msg;/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/BodyPartElm.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tfpose_ros
)
_generate_msg_py(tfpose_ros
  "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/BodyPartElm.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tfpose_ros
)

### Generating Services

### Generating Module File
_generate_module_py(tfpose_ros
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tfpose_ros
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(tfpose_ros_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(tfpose_ros_generate_messages tfpose_ros_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Person.msg" NAME_WE)
add_dependencies(tfpose_ros_generate_messages_py _tfpose_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/Persons.msg" NAME_WE)
add_dependencies(tfpose_ros_generate_messages_py _tfpose_ros_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg/BodyPartElm.msg" NAME_WE)
add_dependencies(tfpose_ros_generate_messages_py _tfpose_ros_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(tfpose_ros_genpy)
add_dependencies(tfpose_ros_genpy tfpose_ros_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS tfpose_ros_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tfpose_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/tfpose_ros
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(tfpose_ros_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tfpose_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/tfpose_ros
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(tfpose_ros_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tfpose_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/tfpose_ros
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(tfpose_ros_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tfpose_ros)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/tfpose_ros
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(tfpose_ros_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tfpose_ros)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tfpose_ros\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/tfpose_ros
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(tfpose_ros_generate_messages_py std_msgs_generate_messages_py)
endif()

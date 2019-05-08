# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "obdii_interface: 1 messages, 0 services")

<<<<<<< HEAD
set(MSG_I_FLAGS "-Iobdii_interface:/home/b2256/catkin_ws/src/obdii_interface/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")
=======
set(MSG_I_FLAGS "-Iobdii_interface:/home/ghedger/git/catkin_ws/src/obdii_interface/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")
>>>>>>> 6b687d5f194866803c08e14a8c5df5743416c396

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(obdii_interface_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



<<<<<<< HEAD
get_filename_component(_filename "/home/b2256/catkin_ws/src/obdii_interface/msg/ObdiiState.msg" NAME_WE)
add_custom_target(_obdii_interface_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "obdii_interface" "/home/b2256/catkin_ws/src/obdii_interface/msg/ObdiiState.msg" "std_msgs/Header"
=======
get_filename_component(_filename "/home/ghedger/git/catkin_ws/src/obdii_interface/msg/ObdiiState.msg" NAME_WE)
add_custom_target(_obdii_interface_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "obdii_interface" "/home/ghedger/git/catkin_ws/src/obdii_interface/msg/ObdiiState.msg" "std_msgs/Header"
>>>>>>> 6b687d5f194866803c08e14a8c5df5743416c396
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(obdii_interface
<<<<<<< HEAD
  "/home/b2256/catkin_ws/src/obdii_interface/msg/ObdiiState.msg"
=======
  "/home/ghedger/git/catkin_ws/src/obdii_interface/msg/ObdiiState.msg"
>>>>>>> 6b687d5f194866803c08e14a8c5df5743416c396
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obdii_interface
)

### Generating Services

### Generating Module File
_generate_module_cpp(obdii_interface
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obdii_interface
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(obdii_interface_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(obdii_interface_generate_messages obdii_interface_generate_messages_cpp)

# add dependencies to all check dependencies targets
<<<<<<< HEAD
get_filename_component(_filename "/home/b2256/catkin_ws/src/obdii_interface/msg/ObdiiState.msg" NAME_WE)
=======
get_filename_component(_filename "/home/ghedger/git/catkin_ws/src/obdii_interface/msg/ObdiiState.msg" NAME_WE)
>>>>>>> 6b687d5f194866803c08e14a8c5df5743416c396
add_dependencies(obdii_interface_generate_messages_cpp _obdii_interface_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obdii_interface_gencpp)
add_dependencies(obdii_interface_gencpp obdii_interface_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obdii_interface_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(obdii_interface
<<<<<<< HEAD
  "/home/b2256/catkin_ws/src/obdii_interface/msg/ObdiiState.msg"
=======
  "/home/ghedger/git/catkin_ws/src/obdii_interface/msg/ObdiiState.msg"
>>>>>>> 6b687d5f194866803c08e14a8c5df5743416c396
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/obdii_interface
)

### Generating Services

### Generating Module File
_generate_module_eus(obdii_interface
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/obdii_interface
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(obdii_interface_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(obdii_interface_generate_messages obdii_interface_generate_messages_eus)

# add dependencies to all check dependencies targets
<<<<<<< HEAD
get_filename_component(_filename "/home/b2256/catkin_ws/src/obdii_interface/msg/ObdiiState.msg" NAME_WE)
=======
get_filename_component(_filename "/home/ghedger/git/catkin_ws/src/obdii_interface/msg/ObdiiState.msg" NAME_WE)
>>>>>>> 6b687d5f194866803c08e14a8c5df5743416c396
add_dependencies(obdii_interface_generate_messages_eus _obdii_interface_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obdii_interface_geneus)
add_dependencies(obdii_interface_geneus obdii_interface_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obdii_interface_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(obdii_interface
<<<<<<< HEAD
  "/home/b2256/catkin_ws/src/obdii_interface/msg/ObdiiState.msg"
=======
  "/home/ghedger/git/catkin_ws/src/obdii_interface/msg/ObdiiState.msg"
>>>>>>> 6b687d5f194866803c08e14a8c5df5743416c396
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obdii_interface
)

### Generating Services

### Generating Module File
_generate_module_lisp(obdii_interface
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obdii_interface
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(obdii_interface_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(obdii_interface_generate_messages obdii_interface_generate_messages_lisp)

# add dependencies to all check dependencies targets
<<<<<<< HEAD
get_filename_component(_filename "/home/b2256/catkin_ws/src/obdii_interface/msg/ObdiiState.msg" NAME_WE)
=======
get_filename_component(_filename "/home/ghedger/git/catkin_ws/src/obdii_interface/msg/ObdiiState.msg" NAME_WE)
>>>>>>> 6b687d5f194866803c08e14a8c5df5743416c396
add_dependencies(obdii_interface_generate_messages_lisp _obdii_interface_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obdii_interface_genlisp)
add_dependencies(obdii_interface_genlisp obdii_interface_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obdii_interface_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(obdii_interface
<<<<<<< HEAD
  "/home/b2256/catkin_ws/src/obdii_interface/msg/ObdiiState.msg"
=======
  "/home/ghedger/git/catkin_ws/src/obdii_interface/msg/ObdiiState.msg"
>>>>>>> 6b687d5f194866803c08e14a8c5df5743416c396
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/obdii_interface
)

### Generating Services

### Generating Module File
_generate_module_nodejs(obdii_interface
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/obdii_interface
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(obdii_interface_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(obdii_interface_generate_messages obdii_interface_generate_messages_nodejs)

# add dependencies to all check dependencies targets
<<<<<<< HEAD
get_filename_component(_filename "/home/b2256/catkin_ws/src/obdii_interface/msg/ObdiiState.msg" NAME_WE)
=======
get_filename_component(_filename "/home/ghedger/git/catkin_ws/src/obdii_interface/msg/ObdiiState.msg" NAME_WE)
>>>>>>> 6b687d5f194866803c08e14a8c5df5743416c396
add_dependencies(obdii_interface_generate_messages_nodejs _obdii_interface_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obdii_interface_gennodejs)
add_dependencies(obdii_interface_gennodejs obdii_interface_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obdii_interface_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(obdii_interface
<<<<<<< HEAD
  "/home/b2256/catkin_ws/src/obdii_interface/msg/ObdiiState.msg"
=======
  "/home/ghedger/git/catkin_ws/src/obdii_interface/msg/ObdiiState.msg"
>>>>>>> 6b687d5f194866803c08e14a8c5df5743416c396
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obdii_interface
)

### Generating Services

### Generating Module File
_generate_module_py(obdii_interface
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obdii_interface
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(obdii_interface_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(obdii_interface_generate_messages obdii_interface_generate_messages_py)

# add dependencies to all check dependencies targets
<<<<<<< HEAD
get_filename_component(_filename "/home/b2256/catkin_ws/src/obdii_interface/msg/ObdiiState.msg" NAME_WE)
=======
get_filename_component(_filename "/home/ghedger/git/catkin_ws/src/obdii_interface/msg/ObdiiState.msg" NAME_WE)
>>>>>>> 6b687d5f194866803c08e14a8c5df5743416c396
add_dependencies(obdii_interface_generate_messages_py _obdii_interface_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obdii_interface_genpy)
add_dependencies(obdii_interface_genpy obdii_interface_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obdii_interface_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obdii_interface)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obdii_interface
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(obdii_interface_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/obdii_interface)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/obdii_interface
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(obdii_interface_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obdii_interface)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obdii_interface
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(obdii_interface_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/obdii_interface)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/obdii_interface
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(obdii_interface_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obdii_interface)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obdii_interface\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obdii_interface
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(obdii_interface_generate_messages_py std_msgs_generate_messages_py)
endif()

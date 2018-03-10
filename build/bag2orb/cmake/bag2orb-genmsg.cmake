# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "bag2orb: 2 messages, 0 services")

set(MSG_I_FLAGS "-Ibag2orb:/home/b2256/catkin_ws/src/bag2orb/msg;-Inav_msgs:/opt/ros/kinetic/share/nav_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(bag2orb_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/b2256/catkin_ws/src/bag2orb/msg/Sync_orb.msg" NAME_WE)
add_custom_target(_bag2orb_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bag2orb" "/home/b2256/catkin_ws/src/bag2orb/msg/Sync_orb.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/b2256/catkin_ws/src/bag2orb/msg/TatBry.msg" NAME_WE)
add_custom_target(_bag2orb_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bag2orb" "/home/b2256/catkin_ws/src/bag2orb/msg/TatBry.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(bag2orb
  "/home/b2256/catkin_ws/src/bag2orb/msg/Sync_orb.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bag2orb
)
_generate_msg_cpp(bag2orb
  "/home/b2256/catkin_ws/src/bag2orb/msg/TatBry.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bag2orb
)

### Generating Services

### Generating Module File
_generate_module_cpp(bag2orb
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bag2orb
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(bag2orb_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(bag2orb_generate_messages bag2orb_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/b2256/catkin_ws/src/bag2orb/msg/Sync_orb.msg" NAME_WE)
add_dependencies(bag2orb_generate_messages_cpp _bag2orb_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/b2256/catkin_ws/src/bag2orb/msg/TatBry.msg" NAME_WE)
add_dependencies(bag2orb_generate_messages_cpp _bag2orb_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bag2orb_gencpp)
add_dependencies(bag2orb_gencpp bag2orb_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bag2orb_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(bag2orb
  "/home/b2256/catkin_ws/src/bag2orb/msg/Sync_orb.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bag2orb
)
_generate_msg_eus(bag2orb
  "/home/b2256/catkin_ws/src/bag2orb/msg/TatBry.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bag2orb
)

### Generating Services

### Generating Module File
_generate_module_eus(bag2orb
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bag2orb
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(bag2orb_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(bag2orb_generate_messages bag2orb_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/b2256/catkin_ws/src/bag2orb/msg/Sync_orb.msg" NAME_WE)
add_dependencies(bag2orb_generate_messages_eus _bag2orb_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/b2256/catkin_ws/src/bag2orb/msg/TatBry.msg" NAME_WE)
add_dependencies(bag2orb_generate_messages_eus _bag2orb_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bag2orb_geneus)
add_dependencies(bag2orb_geneus bag2orb_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bag2orb_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(bag2orb
  "/home/b2256/catkin_ws/src/bag2orb/msg/Sync_orb.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bag2orb
)
_generate_msg_lisp(bag2orb
  "/home/b2256/catkin_ws/src/bag2orb/msg/TatBry.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bag2orb
)

### Generating Services

### Generating Module File
_generate_module_lisp(bag2orb
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bag2orb
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(bag2orb_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(bag2orb_generate_messages bag2orb_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/b2256/catkin_ws/src/bag2orb/msg/Sync_orb.msg" NAME_WE)
add_dependencies(bag2orb_generate_messages_lisp _bag2orb_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/b2256/catkin_ws/src/bag2orb/msg/TatBry.msg" NAME_WE)
add_dependencies(bag2orb_generate_messages_lisp _bag2orb_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bag2orb_genlisp)
add_dependencies(bag2orb_genlisp bag2orb_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bag2orb_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(bag2orb
  "/home/b2256/catkin_ws/src/bag2orb/msg/Sync_orb.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bag2orb
)
_generate_msg_nodejs(bag2orb
  "/home/b2256/catkin_ws/src/bag2orb/msg/TatBry.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bag2orb
)

### Generating Services

### Generating Module File
_generate_module_nodejs(bag2orb
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bag2orb
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(bag2orb_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(bag2orb_generate_messages bag2orb_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/b2256/catkin_ws/src/bag2orb/msg/Sync_orb.msg" NAME_WE)
add_dependencies(bag2orb_generate_messages_nodejs _bag2orb_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/b2256/catkin_ws/src/bag2orb/msg/TatBry.msg" NAME_WE)
add_dependencies(bag2orb_generate_messages_nodejs _bag2orb_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bag2orb_gennodejs)
add_dependencies(bag2orb_gennodejs bag2orb_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bag2orb_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(bag2orb
  "/home/b2256/catkin_ws/src/bag2orb/msg/Sync_orb.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bag2orb
)
_generate_msg_py(bag2orb
  "/home/b2256/catkin_ws/src/bag2orb/msg/TatBry.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bag2orb
)

### Generating Services

### Generating Module File
_generate_module_py(bag2orb
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bag2orb
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(bag2orb_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(bag2orb_generate_messages bag2orb_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/b2256/catkin_ws/src/bag2orb/msg/Sync_orb.msg" NAME_WE)
add_dependencies(bag2orb_generate_messages_py _bag2orb_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/b2256/catkin_ws/src/bag2orb/msg/TatBry.msg" NAME_WE)
add_dependencies(bag2orb_generate_messages_py _bag2orb_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bag2orb_genpy)
add_dependencies(bag2orb_genpy bag2orb_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bag2orb_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bag2orb)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bag2orb
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(bag2orb_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(bag2orb_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bag2orb)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bag2orb
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(bag2orb_generate_messages_eus nav_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(bag2orb_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bag2orb)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bag2orb
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(bag2orb_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(bag2orb_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bag2orb)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bag2orb
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(bag2orb_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(bag2orb_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bag2orb)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bag2orb\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bag2orb
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(bag2orb_generate_messages_py nav_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(bag2orb_generate_messages_py std_msgs_generate_messages_py)
endif()

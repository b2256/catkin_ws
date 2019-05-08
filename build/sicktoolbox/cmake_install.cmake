# Install script for directory: /home/b2256/catkin_ws/src/sicktoolbox

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/b2256/catkin_ws/build/sicktoolbox/catkin_generated/installspace/sicktoolbox.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sicktoolbox/cmake" TYPE FILE FILES
    "/home/b2256/catkin_ws/build/sicktoolbox/catkin_generated/installspace/sicktoolboxConfig.cmake"
    "/home/b2256/catkin_ws/build/sicktoolbox/catkin_generated/installspace/sicktoolboxConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/sicktoolbox" TYPE FILE FILES "/home/b2256/catkin_ws/src/sicktoolbox/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/b2256/catkin_ws/build/sicktoolbox/CMakeFiles/CMakeRelink.dir/libSickLD.so")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/b2256/catkin_ws/build/sicktoolbox/CMakeFiles/CMakeRelink.dir/libSickLMS1xx.so")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/b2256/catkin_ws/build/sicktoolbox/CMakeFiles/CMakeRelink.dir/libSickLMS2xx.so")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/b2256/catkin_ws/build/devel/lib/libLDConfigLib.so")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/sicktoolbox" TYPE EXECUTABLE FILES "/home/b2256/catkin_ws/build/sicktoolbox/CMakeFiles/CMakeRelink.dir/ld_config")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/sicktoolbox" TYPE EXECUTABLE FILES "/home/b2256/catkin_ws/build/sicktoolbox/CMakeFiles/CMakeRelink.dir/ld_more_config")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/sicktoolbox" TYPE EXECUTABLE FILES "/home/b2256/catkin_ws/build/sicktoolbox/CMakeFiles/CMakeRelink.dir/ld_multi_sector")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/sicktoolbox" TYPE EXECUTABLE FILES "/home/b2256/catkin_ws/build/sicktoolbox/CMakeFiles/CMakeRelink.dir/ld_single_sector")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/sicktoolbox" TYPE EXECUTABLE FILES "/home/b2256/catkin_ws/build/sicktoolbox/CMakeFiles/CMakeRelink.dir/lms1xx_simple_app")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/sicktoolbox" TYPE EXECUTABLE FILES "/home/b2256/catkin_ws/build/sicktoolbox/CMakeFiles/CMakeRelink.dir/lms2xx_config")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/sicktoolbox" TYPE EXECUTABLE FILES "/home/b2256/catkin_ws/build/sicktoolbox/CMakeFiles/CMakeRelink.dir/lms2xx_mean_values")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/sicktoolbox" TYPE EXECUTABLE FILES "/home/b2256/catkin_ws/build/sicktoolbox/CMakeFiles/CMakeRelink.dir/lms2xx_partial_scan")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/sicktoolbox" TYPE EXECUTABLE FILES "/home/b2256/catkin_ws/build/sicktoolbox/CMakeFiles/CMakeRelink.dir/lms2xx_real_time_indices")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/sicktoolbox" TYPE EXECUTABLE FILES "/home/b2256/catkin_ws/build/sicktoolbox/CMakeFiles/CMakeRelink.dir/lms2xx_set_variant")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/sicktoolbox" TYPE EXECUTABLE FILES "/home/b2256/catkin_ws/build/sicktoolbox/CMakeFiles/CMakeRelink.dir/lms2xx_simple_app")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/sicktoolbox" TYPE EXECUTABLE FILES "/home/b2256/catkin_ws/build/sicktoolbox/CMakeFiles/CMakeRelink.dir/lms2xx_stream_range_and_reflect")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/sicktoolbox" TYPE EXECUTABLE FILES "/home/b2256/catkin_ws/build/sicktoolbox/CMakeFiles/CMakeRelink.dir/lms2xx_subrange")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/sicktoolbox" TYPE DIRECTORY FILES "/home/b2256/catkin_ws/src/sicktoolbox/include/sicktoolbox/" FILES_MATCHING REGEX "/[^/]*\\.hh$" REGEX "/\\.svn$" EXCLUDE)
endif()


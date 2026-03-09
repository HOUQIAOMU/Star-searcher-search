# Install script for directory: /home/jacob/star-searcher/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/jacob/star-searcher/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
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

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/jacob/star-searcher/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/jacob/star-searcher/install" TYPE PROGRAM FILES "/home/jacob/star-searcher/build/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/jacob/star-searcher/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/jacob/star-searcher/install" TYPE PROGRAM FILES "/home/jacob/star-searcher/build/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/jacob/star-searcher/install/setup.bash;/home/jacob/star-searcher/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/jacob/star-searcher/install" TYPE FILE FILES
    "/home/jacob/star-searcher/build/catkin_generated/installspace/setup.bash"
    "/home/jacob/star-searcher/build/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/jacob/star-searcher/install/setup.sh;/home/jacob/star-searcher/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/jacob/star-searcher/install" TYPE FILE FILES
    "/home/jacob/star-searcher/build/catkin_generated/installspace/setup.sh"
    "/home/jacob/star-searcher/build/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/jacob/star-searcher/install/setup.zsh;/home/jacob/star-searcher/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/jacob/star-searcher/install" TYPE FILE FILES
    "/home/jacob/star-searcher/build/catkin_generated/installspace/setup.zsh"
    "/home/jacob/star-searcher/build/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/jacob/star-searcher/install/setup.fish;/home/jacob/star-searcher/install/local_setup.fish")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/jacob/star-searcher/install" TYPE FILE FILES
    "/home/jacob/star-searcher/build/catkin_generated/installspace/setup.fish"
    "/home/jacob/star-searcher/build/catkin_generated/installspace/local_setup.fish"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/jacob/star-searcher/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/jacob/star-searcher/install" TYPE FILE FILES "/home/jacob/star-searcher/build/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/jacob/star-searcher/build/gtest/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/mav_comm/mav_comm/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/rotors_simulator/rotors_description/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/mav_comm/mav_state_machine_msgs/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/mav_comm/mav_system_msgs/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/uav_simulator/Utils/quadrotor_msgs/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/rotors_simulator/rotors_comm/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/mav_comm/mav_msgs/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/velodyne_simulator/velodyne_description/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/velodyne_simulator/velodyne_simulator/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/uav_simulator/Utils/cmake_utils/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/gazebo_map_generator/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/search_planner/utils/lkh_tsp_solver/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/uav_simulator/map_generator/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/search_planner/plan_env/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/search_planner/bspline/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/search_planner/path_searching/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/search_planner/active_perception/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/search_planner/bspline_opt/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/search_planner/poly_traj/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/uav_simulator/poscmd_2_odom/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/uav_simulator/Utils/pose_utils/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/search_planner/utils/sensor_pose_trans/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/search_planner/fuae_gazebo/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/mav_comm/mav_planning_msgs/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/rotors_simulator/rotors_control/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/uav_simulator/so3_disturbance_generator/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/apriltag_ros/apriltag_ros/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/uav_simulator/Utils/odom_visualization/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/uav_simulator/local_sensing/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/search_planner/gazebo_plugins/realsense_gazebo_plugin/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/uav_simulator/so3_control/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/uav_simulator/Utils/multi_map_server/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/tag_bridge/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/search_planner/traj_utils/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/search_planner/plan_manage/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/search_planner/exploration_manager/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/uav_simulator/Utils/uav_utils/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/uav_simulator/so3_quadrotor_simulator/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/rotors_simulator/rotors_gazebo_plugins/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/uav_simulator/Utils/rviz_plugins/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/velodyne_simulator/velodyne_gazebo_plugins/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/search_planner/uav_simulator/Utils/waypoint_generator/cmake_install.cmake")
  include("/home/jacob/star-searcher/build/STAR-Searcher/Star-Searcher/rotors_simulator/rotors_gazebo/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/jacob/star-searcher/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")

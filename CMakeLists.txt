cmake_minimum_required(VERSION 3.8)
project(raspicat_setup_scripts)
find_package(ament_cmake_auto REQUIRED)
ament_auto_find_build_dependencies()
ament_auto_package(
  INSTALL_TO_SHARE
  device_driver_auto_install
  hotspot
  time_synchronization
)
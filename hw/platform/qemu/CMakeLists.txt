add_library(qemu OBJECT hw_qemu.c)
target_include_directories(qemu PUBLIC ./)


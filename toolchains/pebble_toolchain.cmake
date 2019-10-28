# TODO Search for ~/pebble-sdk-4.5-linux64 and ~/pebble-dev/pebble-sdk-4.5-linux64 as well
#      This needs to be a bit flexible on where the sdk is installed.
set(sdk_dir ${PROJECT_SOURCE_DIR}/lib/pebble-sdk-4.5-linux64/arm-cs-tools)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_C_COMPILER ${sdk_dir}/bin/arm-none-eabi-gcc)

set(CMAKE_FIND_ROOT_PATH ${sdk_dir})

SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)


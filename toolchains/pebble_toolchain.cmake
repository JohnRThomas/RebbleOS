set(search_paths
          ~/
          ~/pebble-dev/
          /usr/bin
          /usr/local/Cellar/
)

if (APPLE)
    set(sdk pebble-toolchain/2.0 )
else()
    set(sdk pebble-sdk-4.5-linux64 )
endif()

find_path(PEBBLE_SDK ${sdk} ${search_paths})

if(NOT PEBBLE_SDK)
    message(FATAL_ERROR "Pebble SDK not found! Searched in: ${search_paths}")
endif()

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_C_COMPILER ${PEBBLE_SDK}/${sdk}/arm-cs-tools/bin/arm-none-eabi-gcc)

set(CMAKE_FIND_ROOT_PATH ${PEBBLE_SDK}/${sdk}/arm-cs-tools/)

SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)


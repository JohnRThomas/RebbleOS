cmake_minimum_required(VERSION 3.12)

# Set the default platform to snowy
if( NOT platform )
    message(STATUS "No platform specified, defaulting to snowy. Provide -Dplatform={platform} to specify.")
    set(platform snowy)
endif()

#TODO Is this needed for non-pebble platforms? Should it be moved to the platform specific flags?
# This needs to be before the platform include as it needs to be applied to any targets the platform generates.
add_compile_options(-DNGFX_IS_CORE=1)

# Setup the build env for the desired platform
include(hw/platform/${platform}/platform.cmake)

project(RebbleOS)

SET(CMAKE_COLOR_MAKEFILE ON)

# Set Global C_FLAGS
add_compile_options(-O0 -ggdb -Wall -ffunction-sections -fdata-sections -mthumb -mlittle-endian -finline-functions -std=gnu99 -falign-functions=16 -MMD -MP -MT)

# TODO change this to -wError
add_compile_options(-Wno-unused-function -Wno-unused-variable -Wno-format)

# TODO This should be moved as it clutters the top level (if libopencm3 is added, this will go away)
add_library(CMSIS INTERFACE)
target_include_directories(CMSIS INTERFACE Platform/CMSIS/Include/)

# TODO This should be controlled by the individual platform.
add_library(config INTERFACE)
target_include_directories(config INTERFACE Config/)

# Set up the build target for the desired platform
add_subdirectory(hw/platform/${platform})

# TODO make this only incude if the user has specified a flag.
add_subdirectory(hw/platform/qemu)

# Include this platform's HAL libs
add_subdirectory(hw/chip/${chip})

# TODO The platfrom should specify each driver it needs individually.
add_subdirectory(hw/drivers/)

# Include needed libraries
add_subdirectory(lib/btstack)
add_subdirectory(lib/minilib)
add_subdirectory(lib/neographics)
add_subdirectory(lib/png)
add_subdirectory(lib/pbl_strftime)

# TODO fix this being needed. neographics should specify this on it's own, or should only add the single needed target.
set_target_properties(neographics_rect PROPERTIES EXCLUDE_FROM_ALL 1)
set_target_properties(neographics_rect_bw PROPERTIES EXCLUDE_FROM_ALL 1)
set_target_properties(neographics_round PROPERTIES EXCLUDE_FROM_ALL 1)

set_target_properties(test_neographics_rect PROPERTIES EXCLUDE_FROM_ALL 1)
set_target_properties(test_neographics_rect_bw PROPERTIES EXCLUDE_FROM_ALL 1)
set_target_properties(test_neographics_round PROPERTIES EXCLUDE_FROM_ALL 1)

# TODO neographics should specify PUBLIC include directories so it doesn't need to be specified here.
target_include_directories(${neographics} PUBLIC lib/neographics/contrib/)

# Enable only the neographics target this platform needs
set_target_properties(${neographics} PROPERTIES EXCLUDE_FROM_ALL 0)

# Add the Top Level OS projects
add_subdirectory(FreeRTOS)
#add_subdirectory(res)
include(res.cmake)
include(version.cmake)

add_subdirectory(rcore)
add_subdirectory(rwatch)
add_subdirectory(Apps/System)
add_subdirectory(Watchfaces)

#TODO add pbz target

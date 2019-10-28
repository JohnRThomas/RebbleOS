# TODO This should probably exist in the res directory itself
# TODO update scripts to use Python3
find_package(Python2 COMPONENTS Interpreter)

set(root ${PROJECT_SOURCE_DIR}/res)

set(input_json_file ${root}/${platform}.json)
set(base_pbpack ${root}/build/pebble-${platform}.pbpack)
set(script ${PROJECT_SOURCE_DIR}/Utilities/mkpack.py)

set(output_dir ${CMAKE_BINARY_DIR}/res)
set(resource_header_file ${output_dir}/platform_res.h)
set(resource_depend_file ${output_dir}/platform_res.d)
set(resource_pbpack_file ${output_dir}/platform_res.pbpack)

add_custom_command(
    OUTPUT ${root}/build/
    COMMAND mkdir
    ARGS ${root}/build/
)

add_custom_command(
    OUTPUT ${output_dir}
    COMMAND mkdir
    ARGS ${output_dir}
)

# TODO Remove the dependency on this binary. Currently this pulls fonts and images out of the pebble binaries, we should probably use our own.
add_custom_command (
   DEPENDS ${input_json_file} ${root}/build/ ${output_dir}
   OUTPUT  ${base_pbpack}
   COMMAND dd
   ARGS if=${root}/qemu-tintin-images/${spi_file}/qemu_spi_flash.bin of=${base_pbpack} bs=1 skip=${spi_offset} count=${spi_size}
   COMMENT "Extracting Base pbpack")

add_custom_command (
   DEPENDS ${script} ${input_json_file} ${base_pbpack}
   OUTPUT  ${resource_header_file} ${resource_pbpack_file} ${resource_depend_file}
   COMMAND ${Python_EXECUTABLE}
   ARGS ${script} -r "${root}" -M -H -P ${input_json_file} ${output_dir}/platform_res >/dev/null
   COMMENT "Packaging Resources")

add_custom_target(package_resources DEPENDS ${resource_header_file} ${resource_depend_file} ${resource_pbpack_file})

# TODO Since artifacts are generated outside the build directory next to artifacts of other builds, tell cmake not to clean up the cutom output.
# Since this target's custom output is ${root}/build/, which may contain files from other builds, that needs to be excluded and then specific files need to be explicitly included. This is hacky and breaks some of cmake's rules. If the dependency on the pre-built binaries is removed, this will go away too.
set_property(DIRECTORY PROPERTY CLEAN_NO_CUSTOM true)
set_property(DIRECTORY APPEND PROPERTY ADDITIONAL_MAKE_CLEAN_FILES ${base_pbpack})
set_property(DIRECTORY APPEND PROPERTY ADDITIONAL_MAKE_CLEAN_FILES ${resource_header_file})
set_property(DIRECTORY APPEND PROPERTY ADDITIONAL_MAKE_CLEAN_FILES ${resource_pbpack_file})
set_property(DIRECTORY APPEND PROPERTY ADDITIONAL_MAKE_CLEAN_FILES ${resource_depend_file})

add_library(resources INTERFACE)
add_dependencies(resources package_resources)
target_include_directories(resources INTERFACE ${output_dir})


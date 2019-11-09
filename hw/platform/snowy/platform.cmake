# This platform needs the Pebble SDK compiler
set(CMAKE_TOOLCHAIN_FILE toolchains/pebble_toolchain.cmake)

# TODO Verify things work with the standard/modern version of gcc and remove the dependency on pebble
#set(CMAKE_TOOLCHAIN_FILE toolchains/arm_gcc_toolchain.cmake)

# Set this platform's mcu
set(chip stm32f4xx)

# Set this platform's drivers
# TODO this should list them individually so that platforms are more configurable
set(peripherals stm32)

# Define which shape this watch is
set(neographics neographics_rect)

# SPI settings
set(spi_file basalt/3.0)
set(spi_size 512000)
set(spi_offset 3670016)

add_definitions(-DREBBLE_PLATFORM_SNOWY)

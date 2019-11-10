set(src_files
	snowy_ambient.c
	snowy_common.c
	snowy_display.c
	snowy_ext_flash.c
	snowy_power.c
	snowy_scanlines.c
	snowy_vibrate.c	
)

add_library(snowy_family STATIC ${src_files})
target_link_libraries(snowy_family fpga_obj rcore_headers stm32f4 drivers_stm32 btstack)
target_include_directories(snowy_family PUBLIC  ./)


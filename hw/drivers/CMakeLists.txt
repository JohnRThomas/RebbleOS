set(src_files
	stm32_bluetooth_cc256x/stm32_cc256x.c
	stm32_dma/stm32_dma.c
	stm32_power/stm32_power.c
	stm32_spi/stm32_spi.c
	stm32_backlight/stm32_backlight.c
	stm32_buttons/stm32_buttons.c
	stm32_i2c/stm32_i2c.c
	stm32_rtc/stm32_rtc.c
	stm32_usart/stm32_usart.c)

add_library(drivers_stm32 STATIC ${src_files})
target_link_libraries(drivers_stm32 ${platform} rwatch_headers FreeRTOS minilib)

target_include_directories(drivers_stm32 PUBLIC
 	stm32_bluetooth_cc256x
	stm32_dma
	stm32_power
	stm32_spi
	stm32_backlight
	stm32_buttons
	stm32_i2c
	stm32_rtc
	stm32_usart)


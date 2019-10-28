set(src_files
	startup_stm32f4xx.s
	system_stm32f4xx.c
	misc.c
	stm32f4xx_adc.c
	stm32f4xx_crc.c
	stm32f4xx_dcmi.c
	stm32f4xx_dma.c
	stm32f4xx_dsi.c
	stm32f4xx_exti.c
	stm32f4xx_flash.c
	stm32f4xx_flash_ramfunc.c
	stm32f4xx_fmc.c
	stm32f4xx_gpio.c
	stm32f4xx_i2c.c
	stm32f4xx_iwdg.c
	stm32f4xx_lptim.c
	stm32f4xx_ltdc.c
	stm32f4xx_pwr.c
	stm32f4xx_rcc.c
	stm32f4xx_rng.c
	stm32f4xx_rtc.c
	stm32f4xx_sai.c
	stm32f4xx_sdio.c
	stm32f4xx_spdifrx.c
	stm32f4xx_spi.c
	stm32f4xx_syscfg.c
	stm32f4xx_tim.c
	stm32f4xx_usart.c
	stm32f4xx_wwdg.c
)

add_library(stm32f4 STATIC ${src_files})

target_include_directories(stm32f4 PUBLIC inc)
target_link_libraries(stm32f4 CMSIS config)

target_compile_options(stm32f4 PUBLIC -DUSE_STDPERIPH_DRIVER -DSTM32F4XX -DSTM32F429_439xx -D__FPU_PRESENT=1 -D__FPU_USED=0 -DARM_MATH_CM4 -mcpu=cortex-m4 -mfloat-abi=soft -fsingle-precision-constant)

# TODO get cmake 3.15 and use this instead
#target_link_options(stm32f4 -Wl,-Tstm32f4xx.ld)
set_target_properties(stm32f4 PROPERTIES LINK_FLAGS -Wl,-Tstm32f4xx.ld)


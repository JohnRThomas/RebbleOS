set (src_files 
	croutine.c
	event_groups.c
	list.c
	queue.c
	tasks.c
	timers.c
	portable/GCC/ARM_CM4F/port.c
)

add_library(FreeRTOS STATIC ${src_files})
target_include_directories(FreeRTOS PUBLIC include portable/GCC/ARM_CM4F/)
target_link_libraries(FreeRTOS ${platform} config)


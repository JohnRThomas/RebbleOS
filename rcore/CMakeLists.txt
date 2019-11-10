set (src_files 
	ambient.c
	appmanager.c
	appmanager_app.c
	appmanager_app_api.c
	appmanager_app_runloop.c
	appmanager_app_timer.c
	backlight.c
	bluetooth.c
	ppogatt.c
	buttons.c
	display.c
	debug.c
	gyro.c
	main.c
	notification_manager.c
	notification_message.c
	power.c
	rebbleos.c
	smartstrap.c
	rebble_time.c
	rebble_memory.c
	vibrate.c
	flash.c
	fs.c
	log.c
	resource.c
	watchdog.c
	overlay_manager.c
	rebble_util.c
	qemu.c
	qemu_endpoints.c

	protocol/protocol_notification.c
	protocol/protocol_system.c
	protocol/protocol.c
	protocol/protocol_app.c
	protocol/protocol_blob.c

	service/blob_db.c
	service/blob_db_ramfs.c
	service/timeline.c
)

add_executable(rcore ${src_files})
# TODO Make the drivers work generically.
target_link_libraries(rcore FreeRTOS apps ${neographics} minilib png rwatch strftime ${platform} resources qemu drivers_stm32 version watchfaces)
target_include_directories(rcore PUBLIC ./ protocol service 
				 PRIVATE ${PROJECT_SOURCE_DIR}/lib/neographics/src
					 ${PROJECT_SOURCE_DIR}/lib/neographics/contrib
					 ${PROJECT_SOURCE_DIR}/lib/neographics/src/text
					 ${PROJECT_SOURCE_DIR}/lib/neographics/src/types)

add_library(rcore_headers INTERFACE)
target_include_directories(rcore_headers INTERFACE ./ protocol service)

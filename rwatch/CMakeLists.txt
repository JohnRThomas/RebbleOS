set (src_files 
	librebble.c
	math_sin.c
	ngfxwrap.c

	event/app_timer.c
	event/battery_state_service.c
	event/connection_service.c
	event/tick_timer_service.c

	graphics/font_loader.c
	graphics/gbitmap.c
	graphics/graphics.c

	input/click_config.c

	ui/action_menu.c
	ui/notification_window.c
	ui/vibes.c
	ui/window.c

	ui/animation/animation.c
	ui/animation/property_animation.c

	ui/layer/action_bar_layer.c
	ui/layer/bitmap_layer.c
	ui/layer/layer.c
	ui/layer/menu_layer.c
	ui/layer/notification_layer.c
	ui/layer/scroll_layer.c
	ui/layer/simple_menu_layer.c
	ui/layer/status_bar_layer.c
	ui/layer/text_layer.c

	ui/notifications/battery_overlay.c
	ui/notifications/mini_message.c
	ui/notifications/notification_window.c

#	ui/test/graphics_standalone_tests.c
)

add_library(rwatch ${src_files})
target_link_libraries(rwatch ${platform} png ${neographics} resources)
# TODO Maybe seperate src and include for rwatch so that there only needs to be one include level here.
target_include_directories(rwatch PRIVATE ./ event graphics input ui ui/layer ui/notifications ui/animation 
				          ${PROJECT_SOURCE_DIR}/Apps/System 
                                          ${PROJECT_SOURCE_DIR}/Apps/System/tests 
					  ${PROJECT_SOURCE_DIR}/lib/neographics/contrib
					  ${PROJECT_SOURCE_DIR}/lib/neographics/src
					  ${PROJECT_SOURCE_DIR}/lib/neographics/src/text
					  ${PROJECT_SOURCE_DIR}/lib/neographics/src/types)

add_library(rwatch_headers INTERFACE)
target_include_directories(rwatch_headers INTERFACE ./ event graphics input ui ui/layer ui/notifications ui/animation)


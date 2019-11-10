set(src_files
	menu.c
	notification.c
	systemapp.c
	test.c
	testapp.c
	
	# TODO These should probably have their own target
	tests/action_menu_test.c
	tests/color_test.c
	tests/menu_multi_column_test.c
	tests/menu_simple_test.c
	tests/overlay_test.c
	tests/test_test.c
	tests/vibes_test.c)

add_library(apps STATIC ${src_files})
target_link_libraries(apps rwatch ${platform} ${neographics})
target_include_directories(apps PUBLIC  ./ ./tests
                                PRIVATE ${PROJECT_SOURCE_DIR}/lib/neographics/src
					${PROJECT_SOURCE_DIR}/lib/neographics/src/text
					${PROJECT_SOURCE_DIR}/lib/neographics/src/types)


set(src_files
	simple.c
	nivz.c)

add_library(watchfaces STATIC ${src_files})
target_link_libraries(watchfaces rwatch ${platform} ${neographics})
target_include_directories(watchfaces PRIVATE ${PROJECT_SOURCE_DIR}/lib/neographics/src
					${PROJECT_SOURCE_DIR}/lib/neographics/src/text
					${PROJECT_SOURCE_DIR}/lib/neographics/src/types)


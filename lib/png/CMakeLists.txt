set(src_files
	png.c 
	upng.c)

add_library(png STATIC ${src_files})
#TODO clean up the dependencies here. The dep on rcore and platform shouldn't be here if this is being treated as a 3rd party lib. The main issue here is the usage of app_alloc.
target_link_libraries(png ${neographics} ${platform} config rcore_headers)
target_include_directories(png PUBLIC ./ PRIVATE ${PROJECT_SOURCE_DIR}/FreeRTOS/include)

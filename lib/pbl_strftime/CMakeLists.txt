set(src_files
	src/strftime.c)

add_library(strftime OBJECT ${src_files})
target_include_directories(strftime PUBLIC ./src)


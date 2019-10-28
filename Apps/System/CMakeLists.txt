set(src_files
	menu.c
	notification.c
	systemapp.c)

add_library(apps STATIC ${src_files})
target_include_directories(apps PUBLIC ./)


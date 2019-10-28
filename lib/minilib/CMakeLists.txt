set(src_files
	dprint.c 
	fmt.c
	minilib.c
	qalloc.c
	rand.c
	sbrk.c
	unfmt.c)

add_library(minilib STATIC ${src_files})
target_link_libraries(minilib ${platform})
target_include_directories(minilib PUBLIC inc)


find_package(Git QUIET REQUIRED)

# Set up a command that gets the git version
execute_process(
    COMMAND "${GIT_EXECUTABLE}" describe --always --dirty
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
    OUTPUT_VARIABLE REBBLE_OS_VERSION
    OUTPUT_STRIP_TRAILING_WHITESPACE)

execute_process(
    COMMAND "${GIT_EXECUTABLE}" shortlog -s
    COMMAND cut -c8-
    COMMAND sort -f
    COMMAND sed -e "s/\\(.*\\)/    \"\\1\",/"
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
    OUTPUT_VARIABLE REBBLE_OS_CONTRIBUTORS
    OUTPUT_STRIP_TRAILING_WHITESPACE)

# Make cmake re-configure if the git index changes.
# This will make the values of ${REBBLE_OS_VERSION} 
# and ${REBBLE_OS_CONTRIBUTERS} always current.
set_property(GLOBAL APPEND
             PROPERTY CMAKE_CONFIGURE_DEPENDS
             "${CMAKE_SOURCE_DIR}/.git/index")

#TODO Generate the easter_egg myx23 mrk1 _ok23o1_oqq[] __k331sl43o__((2om3syx(\".5o12syx_231sxq.c\"))) = \"C4snkny! Lk2 vvkwk2 2yx w48 zovsq1y2k2!\"; | tr '[a-z0-9]' '[0-9a-z]'
file(WRITE ${CMAKE_BINARY_DIR}/version.c 
"//AUTO GENERATED
const char git_version[] __attribute__((section(\".version_string.1\"))) = \"${REBBLE_OS_VERSION}\";
const char _easter_egg[] __attribute__((section(\".version_string.2\"))) = \"Todo I'm afraid :(\";

const char *const git_authors[] = {
${REBBLE_OS_CONTRIBUTORS}
    0
};")

add_library(version OBJECT ${CMAKE_BINARY_DIR}/version.c)


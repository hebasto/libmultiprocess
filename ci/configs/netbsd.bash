CI_DESC="CI config for NetBSD"
CI_DIR=build-netbsd
export CXXFLAGS="-Werror -Wall -Wextra -Wpedantic -Wno-unused-parameter"
CMAKE_ARGS=(-G Ninja)
BUILD_ARGS=(-v -k 0)

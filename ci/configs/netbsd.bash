CI_DESC="CI config for NetBSD"
CI_DIR=build-netbsd
export CXXFLAGS="-Werror -Wall -Wextra -Wpedantic"
export CXX="/usr/pkg/gcc14/bin/g++"
CMAKE_ARGS=(-G Ninja)
BUILD_ARGS=(-k 0)

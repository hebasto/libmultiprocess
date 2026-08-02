CI_DESC="CI config for FreeBSD"
CI_DIR=build-freebsd
export CXXFLAGS="-Werror -Wall -Wextra -Wextra-semi -Wpedantic -Wno-unused-parameter"
CMAKE_ARGS=(-G Ninja)
BUILD_ARGS=(-k 0)

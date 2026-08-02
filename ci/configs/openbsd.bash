CI_DESC="CI config for OpenBSD"
CI_DIR=build-openbsd
export CXXFLAGS="-Werror -Wall -Wextra -Wextra-semi -Wpedantic -Wno-unused-parameter"
CMAKE_ARGS=(-G Ninja)
BUILD_ARGS=(-k 0)

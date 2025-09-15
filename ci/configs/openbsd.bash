CI_DESC="CI config for OpenBSD"
CI_DIR=build-openbsd
export CXXFLAGS="-Werror -Wall -Wextra -Wpedantic -Wno-unused-parameter"
BUILD_ARGS=(-k 0)

CI_DESC="CI config for FreeBSD"
CI_DIR=build-freebsd
export CXXFLAGS="-Werror -Wall -Wextra -Wpedantic -Wno-unused-parameter"
BUILD_ARGS=(-k 0)

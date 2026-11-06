CI_DESC="CI config for OpenIndiana"
CI_DIR=build-openindiana
# The -pthread flag works around a bug in CMake's FindThreads module.
# See https://gitlab.kitware.com/cmake/cmake/-/issues/26063.
export CXXFLAGS="-pthread -Werror -Wall -Wextra -Wpedantic -Wunused -Wunused-const-variable"
# Cap'n Proto is built from source and installed under /usr/local.
# See the "Install Cap'n Proto" step in .github/workflows/ci.yml.
# The socket API lives in libsocket on illumos.
CMAKE_ARGS=(-G Ninja -DCMAKE_PREFIX_PATH=/usr/local "-DCMAKE_EXE_LINKER_FLAGS=-lsocket -lnsl")
BUILD_ARGS=(-k 0)

CI_DESC="CI config for OpenIndiana"
CI_DIR=build-openindiana
# The -pthread flag works around a bug in CMake's FindThreads module.
# See https://gitlab.kitware.com/cmake/cmake/-/issues/26063.
export CXXFLAGS="-Werror -Wall -Wextra -Wpedantic -Wunused -Wunused-const-variable -pthread"
# OpenIndiana does not package Cap'n Proto, so build it from source.
CAPNP_CHECKOUT=v1.5.0
# KJ fibers do not work on illumos.
CAPNP_CMAKE_ARGS=(-DWITH_FIBERS=OFF)
# The socket API lives in libsocket and libnsl on illumos, and neither the
# Cap'n Proto build nor this project links them.
CAPNP_CMAKE_ARGS+=("-DCMAKE_EXE_LINKER_FLAGS=-lsocket -lnsl")
CMAKE_ARGS=(-G Ninja "-DCMAKE_EXE_LINKER_FLAGS=-lsocket -lnsl")
BUILD_ARGS=(-k 0)

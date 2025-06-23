CI_DESC="CI job using default libraries and tools"
CI_DIR=build-default
CMAKE_ARGS=(
  -DCMAKE_CXX_FLAGS="-Werror -Wall -Wextra -Wpedantic -Wno-unused-parameter"
)
BUILD_ARGS=(-k)

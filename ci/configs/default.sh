CI_DESC="CI job using default libraries and tools, and running IWYU"
CI_DIR=build-default
CMAKE_ARGS=(
  -DCMAKE_CXX_FLAGS="-Werror -Wall -Wextra -Wpedantic -Wno-unused-parameter"
  -DMP_ENABLE_IWYU=ON
)
BUILD_ARGS=(-k)

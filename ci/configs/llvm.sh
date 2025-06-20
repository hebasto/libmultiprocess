CI_DESC="CI job using LLVM-based tools (clang, clang-tidy, iwyu) and testing Ninja"
CI_DIR=build-llvm
export CXX=clang++
export CXXFLAGS="-Werror -Wall -Wextra -Wpedantic -Wthread-safety-analysis -Wno-unused-parameter"
CMAKE_ARGS=(
  -G Ninja
  -DMP_ENABLE_CLANG_TIDY=ON
  -DMP_ENABLE_IWYU=ON
)
BUILD_ARGS=(-k 0)

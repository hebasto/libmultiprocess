CI_DESC="CI job using LLVM-based tools (clang, clang-tidy, iwyu) and testing Ninja"
CI_DIR=build-llvm
CMAKE_ARGS=(
  -G Ninja
  -DCMAKE_CXX_COMPILER=clang++
  -DCMAKE_CXX_FLAGS="-Werror -Wall -Wextra -Wpedantic -Wthread-safety-analysis -Wno-unused-parameter"
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
  -DMP_ENABLE_CLANG_TIDY=ON
  -DMP_ENABLE_IWYU=ON
)
BUILD_ARGS=(-k 0)

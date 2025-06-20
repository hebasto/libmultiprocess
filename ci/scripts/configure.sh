#!/usr/bin/env bash
set -euo pipefail

cmake -B build -G Ninja \
  -DCMAKE_BUILD_TYPE=Debug \
  -DCMAKE_CXX_COMPILER=clang++ \
  -DCMAKE_CXX_FLAGS="-Wall -Wextra -Wpedantic -Wthread-safety-analysis -Wno-unused-parameter" \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
  -DMP_ENABLE_CLANG_TIDY=ON \
  -DMP_ENABLE_IWYU=ON

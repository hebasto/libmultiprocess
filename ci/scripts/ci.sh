#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail -o xtrace

[ "${CI_CONFIG+x}" ] && source "$CI_CONFIG"

: "${CI_DIR:=build}"

if command -v clang++ >/dev/null 2>&1; then
  clang++ --version
fi
if command -v include-what-you-use >/dev/null 2>&1; then
  include-what-you-use --version
fi
if command -v clang-tidy >/dev/null 2>&1; then
  clang-tidy --version
fi

cmake -B "$CI_DIR" "${CMAKE_ARGS[@]+"${CMAKE_ARGS[@]}"}"
cmake --build "$CI_DIR" -t all tests mpexamples -- "${BUILD_ARGS[@]+"${BUILD_ARGS[@]}"}"
ctest --test-dir "$CI_DIR" --output-on-failure

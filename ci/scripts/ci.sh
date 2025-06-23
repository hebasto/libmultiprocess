#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail -o xtrace

[ "${CI_CONFIG+x}" ] && source "$CI_CONFIG"

: "${CI_DIR:=build}"

cmake -B "$CI_DIR" "${CMAKE_ARGS[@]+"${CMAKE_ARGS[@]}"}"
cmake --build "$CI_DIR" -t all tests mpexamples -- "${BUILD_ARGS[@]+"${BUILD_ARGS[@]}"}"
ctest --test-dir "$CI_DIR" --output-on-failure

#!/usr/bin/env bash
#
# Copyright (c) The Bitcoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

export LC_ALL=C.UTF-8

set -o errexit -o nounset -o pipefail -o xtrace

[ "${CI_CONFIG+x}" ] && source "$CI_CONFIG"

: "${CI_DIR:=build}"

[ -n "${CI_CLEAN-}" ] && rm -rf "${CI_DIR}"

cmake -B "$CI_DIR" "${CMAKE_ARGS[@]+"${CMAKE_ARGS[@]}"}"
cmake --build "$CI_DIR" -t all tests mpexamples -- "${BUILD_ARGS[@]+"${BUILD_ARGS[@]}"}"
ctest --test-dir "$CI_DIR" --output-on-failure

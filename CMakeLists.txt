# Copyright (c) The Bitcoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

# Call cmake_minimum_required() only if it was not already called, so parent
# projects set the policy version when this project is included via
# add_subdirectory().
#
# Rationale: Different projects have different practices for choosing policy
# versions. For example, the Bitcoin Core project sets an old policy version,
# causing CMake to use deprecated behaviors instead of new behaviors and
# maximize compatibility with a single old version of CMake, reducing variance
# between builds with newer CMake versions. By contrast CMake documentation
# recommends setting the policy version to the latest supported version of
# CMake, as an upgrading mechanism rather than a pinning mechanism, to let
# project authors fix problems before enabling newer policies, while not opting
# into deprecated policies on a longer term basis.
if(NOT DEFINED CMAKE_MINIMUM_REQUIRED_VERSION
   OR CMAKE_MINIMUM_REQUIRED_VERSION VERSION_LESS 3.12)
  # The left number in the range below is the minimum CMake version required to
  # run this project. The right number is the CMake policy version.
  #
  # The purpose of the minimum version is to trigger a helpful error if a version
  # of CMake is being used that is too old to work. If this number is changed,
  # the version in ci/configs/olddeps.bash should be changed to match.
  #
  # The purpose of the policy version is to opt out of policies introduced in
  # newer versions of CMake until they have been tested. If this number is
  # changed, the version in ci/configs/newdeps.bash should be changed to match.
  cmake_minimum_required(VERSION 3.12...4.1 FATAL_ERROR)
endif()

project("Libmultiprocess" CXX)
if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
  set(CMAKE_CXX_STANDARD 20)
  set(CMAKE_CXX_STANDARD_REQUIRED YES)
endif()

include("cmake/compat_find.cmake")

find_package(Threads REQUIRED)
find_package(CapnProto 0.7 QUIET NO_MODULE)
 if(NOT CapnProto_FOUND)
   message(FATAL_ERROR
     "Cap'n Proto is required but was not found.\n"
     "To resolve, choose one of the following:\n"
     "  - Install Cap'n Proto (version 1.0+ recommended)\n"
     "  - For Bitcoin Core compilation build with -DENABLE_IPC=OFF to disable multiprocess support\n"
   )
 endif()

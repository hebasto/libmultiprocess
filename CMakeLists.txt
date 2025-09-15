cmake_minimum_required(VERSION 3.12...4.1 FATAL_ERROR)
project("Libmultiprocess" CXX)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED YES)

include("cmake/compat_find.cmake")

find_package(Threads REQUIRED)

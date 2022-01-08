#------------------------------------------------------------
# setup default install directory
# (must in the beginning)
#------------------------------------------------------------
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/install" CACHE PATH "Installation Directory")
endif()
message(STATUS "CMAKE_INSTALL_PREFIX = ${CMAKE_INSTALL_PREFIX}")


cmake_minimum_required(VERSION 3.17)

project(HelloCpp)

#--- options
option(HELLO_COVERAGE "code coverage?" OFF)
option(HELLO_CODECOV "coverage report to CodeCov?" OFF) # relies on HELLO_COVERAGE

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

list(INSERT CMAKE_MODULE_PATH 0 "${CMAKE_SOURCE_DIR}/cmake/modules")

find_package(GTest REQUIRED)

add_library(hello STATIC
  api/hello/hello.hpp
  src/hello.cpp
  src/cv.cpp
)
set_target_properties(hello PROPERTIES
  PUBLIC_HEADER "api/hello/hello.hpp"
  DEBUG_POSTFIX _d
)
target_include_directories(hello PUBLIC
  $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/api>
  $<INSTALL_INTERFACE:include>
)
if(HELLO_COVERAGE)
  include(cmake/coverage/coverage.cmake)
  target_compile_options(hello PUBLIC ${coverage_compile_options})
  target_link_libraries(hello PUBLIC ${coverage_link_libraries})
endif()

#----------------------------------------------------------------------
# Testing
#----------------------------------------------------------------------
include(cmake/test/unittest.cmake)

#----------------------------------------------------------------------
# Installing
#----------------------------------------------------------------------
#include(cmake/install/manual_install.cmake)
include(cmake/install/auto_install.cmake)

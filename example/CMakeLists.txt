cmake_minimum_required(VERSION 3.17)

project(hello_example)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(hello_DIR "/home/zz/work/HelloCpp/build/install")
find_package(hello REQUIRED)

add_executable(use_hello use_hello.cpp)
target_include_directories(use_hello PRIVATE
  ${hello_INCLUDE_DIR}
)
target_link_libraries(use_hello PRIVATE
  ${hello_LIB}
)


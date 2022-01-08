# compile and link flags
if(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
  set(coverage_compile_options -coverage -fprofile-arcs -ftest-coverage)
  set(coverage_link_libraries -coverage -lgcov)
elseif(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  if(CMAKE_SYSTEM_NAME MATCHES "Linux")
    set(coverage_compile_options -coverage -fprofile-arcs -ftest-coverage)
    set(coverage_link_libraries -coverage -lgcov)
  elseif(CMAKE_SYSTEM_NAME MATCHES "Darwin")
    set(coverage_compile_options -coverage -fprofile-arcs -ftest-coverage)
    set(coverage_link_libraries -coverage) # AppleClang, no -lgcov
  elseif(ANDROID)
    set(coverage_compile_options -coverage -fprofile-arcs -ftest-coverage)
    set(coverage_link_libraries -coverage -lgcov)
  else()
    message(FATAL_ERROR "not supported compiler/platform for coverage compile and link flags")
  endif()
else()
  message(FATAL_ERROR "not supported compiler/platform for coverage compile and link flags")
endif()

message(STATUS "    coverage_compile_options: ${coverage_compile_options}")
message(STATUS "    coverage_link_libraries: ${coverage_link_libraries}")

# coverage tool
if(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
  find_program(GCOV_PATH gcov REQUIRED)
  message(STATUS "    - found gcov: ${GCOV_PATH}")
  set(GCOV_TOOL gcov)
elseif(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  find_program(LLVM_COV_PATH llvm-cov REQUIRED)
  message(STATUS "    - found llvm-cov: ${LLVM_COV_PATH}")
  set(GCOV_TOOL ${CMAKE_SOURCE_DIR}/scripts/gcov_for_clang.sh)
endif()

find_program(LCOV_PATH lcov REQUIRED)
find_program(GENHTML_PATH genhtml REQUIRED)
message(STATUS "    - found lcov: ${LCOV_PATH}")
message(STATUS "    - found genhtml: ${GENHTML_PATH}")
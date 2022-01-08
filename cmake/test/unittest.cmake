enable_testing()

#---------------------------------------------------------------
# hello_add_test 宏： 用来创建单元测试的可执行文件、并链接 gtest
# 本来是可以用： gtest_add_tests(TARGET test_hello)
# 但为了在 x86 架构上运行 qemu-aarch64 从而实现 aarch64 的测试
# 手动魔改了 cmake 自带的 GoogleTest.cmake， 并参照 ncnn 的 run_test.cmake
# 最后再封装了一层， 也就是这个宏。
# ncnn 的写法比较简洁（单个.cpp内的多个test无法区分，因此我暂时不用）
# add_test(NAME test_hello COMMAND ${CMAKE_COMMAND} -DTEST_EXECUTABLE=$<TARGET_FILE:test_hello> -P ${CMAKE_SOURCE_DIR}/cmake/run_test.cmake)
# 在实际运行ctest时：
# 
macro(hello_add_test name)
  add_executable(test_${name} test/test_${name}.cpp)
  target_link_libraries(test_${name} PRIVATE hello GTest::gtest)
  if ( (NOT ANDROID) AND CMAKE_SYSTEM_NAME MATCHES "Linux" AND CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64")
    gtest_add_tests(
      TARGET test_${name}
      COMMAND ${CMAKE_COMMAND} -DTEST_EXECUTABLE=$<TARGET_FILE:test_${name}> -P ${CMAKE_SOURCE_DIR}/cmake/qemu_run_test.cmake
    )
  else()
    gtest_add_tests(TARGET test_${name})
  endif()
endmacro()

hello_add_test(hello)

if(HELLO_COVERAGE)
  # first run `make test` or `ctest`, ensure .gcdata generated
  # then run `make test_coverage` to get statistics
  # if `make test_coverage` failed, most likely no `make test` executed yet.

  if(HELLO_CODECOV)
    #with lcov front end tool
    add_custom_target(coverage
      COMMAND ctest --output-on-failure
      COMMAND lcov -d ./ -c -o lcov.info --gcov-tool ${GCOV_TOOL}
      COMMAND lcov -r lcov.info '/usr/*' -o lcov.info --gcov-tool ${GCOV_TOOL}
      COMMAND lcov -r lcov.info '*/build/*' -o lcov.info --gcov-tool ${GCOV_TOOL}
      COMMAND lcov -r lcov.info '*/test/test_*' -o lcov.info --gcov-tool ${GCOV_TOOL}
      COMMAND lcov --list lcov.info --gcov-tool ${GCOV_TOOL}
      COMMAND genhtml -o coverage_report lcov.info
      COMMAND ${CMAKE_COMMAND} -E cmake_echo_color --cyan "View test coverage html report:"
      COMMAND ${CMAKE_COMMAND} -E cmake_echo_color --cyan "    cd coverage_report"
      COMMAND ${CMAKE_COMMAND} -E cmake_echo_color --cyan "    python -m http.server 7082"
      WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
    )
  else()
    # with gcovr front end tool
    # `pip install gcovr`
    message(STATUS "... GCOV_TOOL is ${GCOV_TOOL}")
    add_custom_target(coverage
      COMMAND ctest --output-on-failure
      COMMAND gcovr -r ${CMAKE_SOURCE_DIR} ${CMAKE_BINARY_DIR} -f ${CMAKE_SOURCE_DIR}/src --html --html-details -o gcovr_test_coverage.html --gcov-executable ${GCOV_TOOL}
      COMMAND ${CMAKE_COMMAND} -E cmake_echo_color --cyan "View test coverage html report:"
      COMMAND ${CMAKE_COMMAND} -E cmake_echo_color --cyan "    open gcovr_test_coverage.html"
      WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
    )
  endif()
endif()
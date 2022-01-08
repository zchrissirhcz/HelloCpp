install(TARGETS hello EXPORT helloTargets
  ARCHIVE DESTINATION lib
  PUBLIC_HEADER DESTINATION include/hello
)

configure_file(${CMAKE_SOURCE_DIR}/cmake/config/auto_helloConfig.cmake.in helloConfig.cmake @ONLY)
install(
  FILES
    ${CMAKE_SOURCE_DIR}/README.md
    ${CMAKE_SOURCE_DIR}/LICENSE
    DESTINATION "."
)
install(
  FILES
    ${CMAKE_BINARY_DIR}/helloConfig.cmake DESTINATION lib/cmake/hello
)

# Install package management files
install(EXPORT helloTargets DESTINATION lib/cmake/hello)

# please make sure example directory does not contain `build` sub directory
if (EXISTS "${CMAKE_SOURCE_DIR}/example/build")
  execute_process(
    COMMAND ${CMAKE_COMMAND} -E rm -R ${CMAKE_SOURCE_DIR}/example/build
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
  )
endif()
install(DIRECTORY
  "${CMAKE_SOURCE_DIR}/example/" DESTINATION "example"
)

set(CPACK_GENERATOR "ZIP")
set(CPACK_PACKAGE_FILE_NAME "HelloCpp-Linux-x64")
include(CPack)
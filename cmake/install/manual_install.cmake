install(TARGETS hello
  ARCHIVE DESTINATION lib
  PUBLIC_HEADER DESTINATION include/hello
)

configure_file(${CMAKE_SOURCE_DIR}/cmake/config/manual_helloConfig.cmake.in helloConfig.cmake @ONLY)
install(FILES
  ${CMAKE_BINARY_DIR}/helloConfig.cmake
  ${CMAKE_SOURCE_DIR}/README.md
  ${CMAKE_SOURCE_DIR}/LICENSE
  DESTINATION "."
)

# please make sure example directory does not contain `build` sub directory
install(DIRECTORY
  "${PROJECT_SOURCE_DIR}/example/" DESTINATION "example"
)

set(CPACK_GENERATOR "ZIP")
set(CPACK_PACKAGE_FILE_NAME "HelloCpp-Linux-x64")
include(CPack)
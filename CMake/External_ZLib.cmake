# The ZLib external project for fletch

ExternalProject_Add(ZLib
  URL ${ZLib_file}
  URL_MD5 ${zlib_md5}
  DOWNLOAD_NAME ${zlib_dlname}
  ${COMMON_EP_ARGS}
  ${COMMON_CMAKE_EP_ARGS}
  PATCH_COMMAND ${CMAKE_COMMAND}
     -DZLib_patch=${fletch_SOURCE_DIR}/Patches/ZLib
     -DZLib_source=${fletch_BUILD_PREFIX}/src/ZLib
     -P ${fletch_SOURCE_DIR}/Patches/ZLib/Patch.cmake
  CMAKE_ARGS
    ${COMMON_CMAKE_ARGS}
    -DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
)

set(ZLIB_ROOT ${fletch_BUILD_INSTALL_PREFIX} CACHE PATH "" FORCE)
file(APPEND ${fletch_CONFIG_INPUT} "
########################################
# ZLib
########################################
set(ZLIB_ROOT \${fletch_ROOT})

set(fletch_ENABLED_ZLib TRUE)
")

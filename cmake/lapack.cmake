set(LAPACK_NAME lapack)
string(TOLOWER ${LAPACK_NAME} LAPACK_PACKAGE_NAME)
set(LAPACK_URL ${PROJECT_SOURCE_DIR}/files)
set(LAPACK_TAR lapack-3.6.0.tar)
set(LAPACK_MD5 "bab11fba46e31e780f8ea0ffa0815928")

message("-- Building ${LAPACK_NAME}")
ExternalProject_Add(${LAPACK_NAME}
  URL ${LAPACK_URL}/${LAPACK_TAR}
  URL_MD5 ${LAPACK_MD5}
  UPDATE_COMMAND ""
  CMAKE_ARGS
    -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
    -DCMAKE_C_COMPILER:FILEPATH=${CMAKE_C_COMPILER}
    -DCMAKE_C_FLAGS:STRING=${CMAKE_C_FLAGS}
    -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
    -DCMAKE_INSTALL_LIBDIR:PATH=${CMAKE_INSTALL_PREFIX}/lib
    -DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}
    -DLAPACKE=ON
   LOG_BUILD 1
)

ExternalProject_Add_Step(${LAPACK_NAME} fixup
  COMMAND ${CMAKE_COMMAND} -P ${CMAKE_SOURCE_DIR}/scripts/lapack_post_install.cmake ${CMAKE_INSTALL_PREFIX}
    DEPENDEES install
)

set(LAPACK_INCLUDE_DIR ${CMAKE_INSTALL_PREFIX}/include)
set(LAPACK_LIBRARIES ${CMAKE_INSTALL_PREFIX}/lib/${CMAKE_LIBRARY_PREFIX}lapacke${CMAKE_LIBRARY_SUFFIX})

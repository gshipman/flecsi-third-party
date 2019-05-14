set(CALIPER_NAME caliper)
set(CALIPER_URL ${PROJECT_SOURCE_DIR}/files)
set(CALIPER_GZ  Caliper-2.0.1.tar.gz)
set(CALIPER_MD5 "8053757911f3d53b79d88e2fc5c0b0e8")

message(STATUS "Building ${CALIPER_NAME}")
ExternalProject_Add(${CALIPER_NAME}
 URL ${CALIPER_URL}/${CALIPER_GZ}
 URL_MD5 ${CALIPER_MD5}
 PREFIX ${CALIPER_NAME}
 INSTALL_DIR ${CALIPER_NAME}/install
 CONFIGURE_COMMAND ${CMAKE_COMMAND}
   -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
   -DCMAKE_CXX_COMPILER:FILEPATH=${CMAKE_CXX_COMPILER}
   -DCMAKE_CXX_FLAGS:STRING=${CMAKE_CXX_FLAGS}
   -DCMAKE_C_COMPILER:FILEPATH=${CMAKE_C_COMPILER}
   -DCMAKE_C_FLAGS:STRING=${CMAKE_C_FLAGS}
   -DMPI_C_COMPILER:FILEPATH=${MPI_C_COMPILER}
   -DMPI_CXX_COMPILER:FILEPATH=${MPI_CXX_COMPILER}
   -DCMAKE_SHARED_LINKER_FLAGS:STRING=${CMAKE_SHARED_LINKER_FLAGS}
   -DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}
   -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
   -DWITH_CALLPATH:BOOL=ON
   -DWITH_CUPTI:BOOL=OFF
   -DWITH_DYNINST:BOOL=ON
   -DWITH_FORTRAN:BOOL=OFF
   -DWITH_GOTCHA:BOOL=ON
   -DWITH_LIBDW:BOOL=OFF
   -DWITH_LIBPFM:BOOL=ON
   -DWITH_MPI:BOOL=ON
   -DWITH_MPIT:BOOL=OFF
   -DWITH_NETOUT:BOOL=OFF
   -DWITH_NVPROF:BOOL=OFF
   -DWITH_OMPT:BOOL=OFF
   -DWITH_PAPI:BOOL=ON
   -DWITH_SAMPLER:BOOL=ON
   -DWITH_SOS:BOOL=OFF
   -DWITH_TOOLS:BOOL=ON
   -DWITH_VTUNE:BOOL=OFF
   <SOURCE_DIR>
)
ExternalProject_get_property(${CALIPER_NAME} INSTALL_DIR)
install(DIRECTORY ${INSTALL_DIR}/ DESTINATION ${CMAKE_INSTALL_PREFIX} USE_SOURCE_PERMISSIONS)

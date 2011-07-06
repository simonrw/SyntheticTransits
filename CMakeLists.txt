cmake_minimum_required(VERSION 2.6)
set(CMAKE_C_COMPILER ccache)
set(CMAKE_C_COMPILER_ARG1 gcc)
set(CMAKE_CXX_COMPILER ccache)
set(CMAKE_CXX_COMPILER_ARG1 g++)
set(TARGET SyntheticLightcurves)
project(${TARGET})

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} $ENV{HOME}/cmake_packages)

find_package(CCfits REQUIRED)
#find_package(fitsio REQUIRED)
#find_package(Qt4 COMPONENTS QtCore REQUIRED)
find_package(pugixml REQUIRED)
find_package(glog REQUIRED)
find_package(tclap REQUIRED)
find_package(nr3 REQUIRED)

#include(${QT_USE_FILE})

include_directories(
    ${${TARGET}_SOURCE_DIR}/include
    ${CCFITS_INCLUDE_DIR}
    ${PUGIXML_INCLUDE_DIR}
   ${TCLAP_INCLUDE_DIR}
   ${NR3_INCLUDE_DIR}
   ${GLOG_INCLUDE_DIR}
#    ${FITSIO_INCLUDE_DIR}
    )

aux_source_directory(
    ${${TARGET}_SOURCE_DIR}/src
    SRCS
    )

add_executable(${TARGET} ${SRCS})

target_link_libraries(
   ${TARGET}
   ${CCFITS_LIBRARIES}
   ${PUGIXML_LIBRARIES}
   ${GLOG_LIBRARIES}
#    ${FITSIO_LIBRARIES}
#    ${QT_LIBRARIES}
   )


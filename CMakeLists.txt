cmake_minimum_required(VERSION 3.5)

project(swigInterfaceTest LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

find_package( Java COMPONENTS Runtime Development )
find_package( JNI )
find_package( SWIG )

include( UseJava )
include( UseSWIG )

set_property( SOURCE interface.i PROPERTY CPLUSPLUS ON)
set_property( SOURCE interface.i PROPERTY SWIG_MODULE_NAME InterfaceTest)
set_property( SOURCE interface.i PROPERTY USE_TARGET_INCLUDE_DIRECTORIES ON)
set_property( SOURCE interface.i PROPERTY COMPILE_OPTIONS -Wall -package com.test.interfacetest -DDEBUG_DIRECTOR_OWNED)

swig_add_library(${PROJECT_NAME}SWIG LANGUAGE java OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/com/test/interfacetest SOURCES interface.i)
target_include_directories(
  ${PROJECT_NAME}SWIG
  PUBLIC
    ${JNI_INCLUDE_DIRS}
    ${CMAKE_CURRENT_LIST_DIR}
)

get_property(support_files TARGET ${PROJECT_NAME}SWIG PROPERTY SWIG_SUPPORT_FILES)
get_property(SWIG_SUPPORT_FILES_DIRECTORY TARGET ${PROJECT_NAME}SWIG PROPERTY SWIG_SUPPORT_FILES_DIRECTORY)
add_jar(${PROJECT_NAME}
  SOURCES
    ${support_files}
)
add_dependencies(${PROJECT_NAME} ${PROJECT_NAME}SWIG)

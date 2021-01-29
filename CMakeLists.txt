cmake_minimum_required(VERSION 3.5)

project(swigDirectorTest LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

add_library(${PROJECT_NAME}Lib STATIC
    observer.cpp
    observer.h
    observable.cpp
    observable.h
    )
target_include_directories(${PROJECT_NAME}Lib PUBLIC ${CMAKE_CURRENT_LIST_DIR})

add_executable(swigDirectorTestExe main.cpp)
target_link_libraries(swigDirectorTestExe PUBLIC ${PROJECT_NAME}Lib)

find_package( Java COMPONENTS Runtime Development )
find_package( JNI )
find_package( SWIG )

include( UseJava )
include( UseSWIG )

set_property( SOURCE observation.i PROPERTY CPLUSPLUS ON)
set_property( SOURCE observation.i PROPERTY SWIG_MODULE_NAME Observation)
set_property( SOURCE observation.i PROPERTY USE_TARGET_INCLUDE_DIRECTORIES ON)
set_property( SOURCE observation.i PROPERTY COMPILE_OPTIONS -Wall -package com.test.observation -DDEBUG_DIRECTOR_OWNED)

swig_add_library(${PROJECT_NAME}SWIG LANGUAGE java OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/com/test/observation SOURCES observation.i)
swig_link_libraries(${PROJECT_NAME}SWIG ${PROJECT_NAME}Lib)
target_include_directories(
  ${PROJECT_NAME}SWIG
  PUBLIC
    ${JNI_INCLUDE_DIRS}
)

get_property(support_files TARGET ${PROJECT_NAME}SWIG PROPERTY SWIG_SUPPORT_FILES)
get_property(SWIG_SUPPORT_FILES_DIRECTORY TARGET ${PROJECT_NAME}SWIG PROPERTY SWIG_SUPPORT_FILES_DIRECTORY)
add_jar(${PROJECT_NAME}
  SOURCES
    ${support_files}
)
add_dependencies(${PROJECT_NAME} ${PROJECT_NAME}SWIG)

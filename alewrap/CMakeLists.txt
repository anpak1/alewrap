CMAKE_MINIMUM_REQUIRED(VERSION 2.6 FATAL_ERROR)
CMAKE_POLICY(VERSION 2.6)

FILE(GLOB src *.cc *.h *.cpp *.hpp)
FILE(GLOB luasrc *.lua)
SET(luasrc ${luasrc} alewrap.inl)

MESSAGE(STATUS "CMAKE_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX}")
MESSAGE(STATUS "TORCH_INSTALL_PREFIX ${TORCH_INSTALL_PREFIX}")
MESSAGE(STATUS "LUAROCKS_INSTALL_PREFIX ${LUAROCKS_INSTALL_PREFIX}")

IF ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    MESSAGE(STATUS "Using Clang")
    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")        ## Optimize
    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ftemplate-depth=1024")
    MESSAGE(STATUS "FLAGS ${CMAKE_CXX_FLAGS}")
# Using GCC.
ELSEIF ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
    MESSAGE(STATUS "Using GCC")
    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")        ## Optimize
    SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O3")        ## Optimize
    MESSAGE(STATUS "FLAGS ${CMAKE_CXX_FLAGS}")
# Using Intel C++.
ELSEIF ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Intel")
    MESSAGE(STATUS "Using Intel C++")
# Using Visual Studio C++.
ELSEIF ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
    MESSAGE(STATUS "Using Visual Studio C++")
ENDIF()


# We are building alewraplib.
# We specify the paths to ALE includes and libale.
# INCLUDE_DIRECTORIES(${Torch_SOURCE_INCLUDES})
find_path(XITARI_INCLUDE_DIR xitari/ale_interface.hpp
          HINTS 
          ${TORCH_INSTALL_PREFIX}/include
          ${CMAKE_INSTALL_PREFIX}/include
          ${CMAKE_INSTALL_PREFIX}/../../../../../include
          ${LUAROCKS_INSTALL_PREFIX}/../../../../../include
          PATH_SUFFIXES include)

find_path(XITARI_LIBRARY_DIR NAMES xitari libxitari.a
          HINTS 
          ${TORCH_INSTALL_PREFIX}/lib 
          ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/../../../../../lib 
          ${LUAROCKS_INSTALL_PREFIX}/../../../../../lib)

find_library(XITARI_LIBRARY NAMES xitari libxitari.a
          HINTS 
          ${TORCH_INSTALL_PREFIX}/lib 
          ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/../../../../../lib 
          ${LUAROCKS_INSTALL_PREFIX}/../../../../../lib)

IF(NOT(XITARI_INCLUDE_DIR))
  MESSAGE(ERROR "Could not find Xitari include location")
ENDIF()

IF(NOT(XITARI_LIBRARY_DIR))
  MESSAGE(ERROR "Could not find Xitari library")
ENDIF()

IF(NOT(XITARI_LIBRARY))
  MESSAGE(ERROR "Could not find Xitari library")
ENDIF()

SET(INCDIR "${XITARI_INCLUDE_DIR}")
SET(LIBDIR "${XITARI_LIBRARY_DIR}")

INCLUDE_DIRECTORIES("${INCDIR}")
#include_directories("${Remote_INCLUDE_DIR}")
#include_directories("${Boost_INCLUDE_DIRS}")
LINK_DIRECTORIES("${LIBDIR}")

if(NOT Boost_FOUND)
	set(Boost_USE_MULTITHREADED ON)		# default is ON, use -mt variant
#	set(Boost_USE_STATIC_LIBS ON)		# default is OFF, use boost static library
#	set(Boost_USE_STATIC_RUNTIME ON)	# default is not set.

	find_package(Boost 1.50.0 COMPONENTS serialization thread system chrono)
	if(NOT Boost_FOUND)
		set(BOOST_ROOT "C:/boost/boost_1_57_0")						# if not set, it will let cmake to find it.
		set(BOOST_LIBRARYDIR ${BOOST_ROOT}/stage/lib/x86)			# might need to set this too.
		set(Boost_NO_SYSTEM_PATHS ON)								# default is OFF, set to ON if BOOST_ROOT is set
		find_package(Boost 1.50.0 COMPONENTS serialization thread system chrono REQUIRED)
	endif()
endif()

add_compile_options(-lboost_system)
include_directories(${Boost_INCLUDE_DIRS})
MESSAGE( STATUS "Boost_INCLUDE_DIRS:         " ${Boost_INCLUDE_DIRS} )

#if(NOT Remote_FOUND)
#	set(CPPREMOTE_ROOT ${PROJECT_SOURCE_DIR}/../CppRemote)
#	MESSAGE( STATUS "PROJECT_SOURCE_DIR:         " ${PROJECT_SOURCE_DIR} )
#	MESSAGE( STATUS "CPPREMOTE_ROOT:         " ${CPPREMOTE_ROOT} )
#	set(Remote_INCLUDE_DIR ${CPPREMOTE_ROOT}/include)
#	set(Remote_USE_STATIC_LIBS OFF)

#	if(MSVC)
##		set(Remote_LIBRARY_PATH_DEBUG ${CPPREMOTE_ROOT}/lib/Debug)
##		set(Remote_LIBRARY_PATH_RELEASE ${CPPREMOTE_ROOT}/lib/Release)
#	else()
##		set(Remote_LIBRARY_PATH_DEBUG ${CPPREMOTE_ROOT}/lib)
##		set(Remote_LIBRARY_PATH_RELEASE ${CPPREMOTE_ROOT}/lib)
#	endif()
##	find_library(Remote_LIBRARY_DEBUG remote ${Remote_LIBRARY_PATH_DEBUG})
#	find_library(Remote_LIBRARY_RELEASE remote ${Remote_LIBRARY_PATH_RELEASE})
##	if(NOT Remote_LIBRARY_DEBUGNOTFOUND)
##		if(NOT Remote_LIBRARY_RELEASENOTFOUND)
#			set(Remote_FOUND)
##			set(Remote_LIBRARY debug ${Remote_LIBRARY_DEBUG} optimized ${Remote_LIBRARY_RELEASE})
##			set(Remote_LIBRARY ${Remote_LIBRARY_RELEASE})
##		endif()
##	endif()
#endif()

find_path(Remote_INCLUDE_DIR remote/session.hpp
          HINTS
          ${TORCH_INSTALL_PREFIX}/include
          ${CMAKE_INSTALL_PREFIX}/include
          ${CMAKE_INSTALL_PREFIX}/../../../../../include
          ${LUAROCKS_INSTALL_PREFIX}/../../../../../include
          PATH_SUFFIXES include)

find_path(Remote_LIBRARY_DIR NAMES remote libremote.so
          HINTS
          ${TORCH_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/../../../../../lib
          ${LUAROCKS_INSTALL_PREFIX}/../../../../../lib
          ${PROJECT_SOURCE_DIR}/../CppRemote)

find_library(Remote_LIBRARY NAMES remote libremote.so
          HINTS
          ${TORCH_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/../../../../../lib
          ${LUAROCKS_INSTALL_PREFIX}/../../../../../lib
          ${PROJECT_SOURCE_DIR}/../CppRemote)

IF(NOT(Remote_INCLUDE_DIR))
  MESSAGE(ERROR "Could not find remote include location")
ENDIF()

IF(NOT(Remote_LIBRARY_DIR))
  MESSAGE(ERROR "Could not find remote library")
ENDIF()

IF(NOT(Remote_LIBRARY))
  MESSAGE(ERROR "Could not find remote library")
ENDIF()

INCLUDE_DIRECTORIES("${Remote_INCLUDE_DIR}")
#include_directories("${Remote_INCLUDE_DIR}")
#include_directories("${Boost_INCLUDE_DIRS}")
LINK_DIRECTORIES("${Remote_LIBRARY_DIR}")

add_compile_options(-lz)
set(CMAKE_SHARED_LINKER_FLAGS "-lz")

set(alewrap_client
	${Example_SRC_DIR}/remote_ALEInterface.cpp
	${Example_SRC_DIR}/remote_ALEInterface.hpp
	${Example_SRC_DIR}/alewrap.h
	${Example_SRC_DIR}/alewrap.cc
)

MESSAGE( STATUS "Remote_LIBRARY:         " ${Remote_LIBRARY} )
MESSAGE( STATUS "Remote_INCLUDE_DIR:         " ${Remote_INCLUDE_DIR} )
MESSAGE( STATUS "Remote_LIBRARY_PATH_RELEASE:         " ${Remote_LIBRARY_PATH_RELEASE} )
MESSAGE( STATUS "Boost_LIBRARIES:         " ${Boost_LIBRARIES} )


#add_subdirectory("${Remote_INCLUDE_DIR}")
#add_library(big ${other_srcs} $<TARGET_OBJECTS:${Remote_INCLUDE_DIR}>)
#TARGET_LINK_LIBRARIES(remote)
ADD_TORCH_PACKAGE(alewrap "${src}" "${luasrc}" "ALE Wrapper")
TARGET_LINK_LIBRARIES(alewrap "${XITARI_LIBRARY}")
#TARGET_LINK_LIBRARIES(alewrap "${remote_LIBRARY}")
TARGET_LINK_LIBRARIES(alewrap ${Remote_LIBRARY})
TARGET_LINK_LIBRARIES(alewrap  ${Boost_LIBRARIES})

# INCLUDE_DIRECTORIES(../../xiborg/xitari)
# LINK_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/../../xiborg/xitari/build)
# ADD_LIBRARY(alewraplib SHARED ${libsrc})
# TARGET_LINK_LIBRARIES(alewraplib xitari z)

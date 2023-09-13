# Install script for directory: /Users/shashankpritam/github/personal/tda/gudhi.3.8.0

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Library/Developer/CommandLineTools/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gudhi" TYPE FILE FILES
    "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/GUDHIConfig.cmake"
    "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/GUDHIConfigVersion.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/include/gudhi")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/python/cmake_install.cmake")
  include("/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/common/cmake_install.cmake")
  include("/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Alpha_complex/cmake_install.cmake")
  include("/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Bitmap_cubical_complex/cmake_install.cmake")
  include("/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Bottleneck_distance/cmake_install.cmake")
  include("/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Cech_complex/cmake_install.cmake")
  include("/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Collapse/cmake_install.cmake")
  include("/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Persistence_representations/cmake_install.cmake")
  include("/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Rips_complex/cmake_install.cmake")
  include("/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Witness_complex/cmake_install.cmake")
  include("/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Nerve_GIC/cmake_install.cmake")
  include("/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/GudhUI/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")

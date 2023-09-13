# Install script for directory: /Users/shashankpritam/github/personal/tda/gudhi.3.8.0/utilities/Persistence_representations/persistence_heat_maps

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Persistence_representations/persistence_heat_maps/create_pssk")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/create_pssk" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/create_pssk")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/create_pssk")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Persistence_representations/persistence_heat_maps/create_p_h_m_weighted_by_arctan_of_their_persistence")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/create_p_h_m_weighted_by_arctan_of_their_persistence" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/create_p_h_m_weighted_by_arctan_of_their_persistence")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/create_p_h_m_weighted_by_arctan_of_their_persistence")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Persistence_representations/persistence_heat_maps/create_p_h_m_weighted_by_distance_from_diagonal")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/create_p_h_m_weighted_by_distance_from_diagonal" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/create_p_h_m_weighted_by_distance_from_diagonal")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/create_p_h_m_weighted_by_distance_from_diagonal")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Persistence_representations/persistence_heat_maps/create_p_h_m_weighted_by_squared_diag_distance")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/create_p_h_m_weighted_by_squared_diag_distance" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/create_p_h_m_weighted_by_squared_diag_distance")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/create_p_h_m_weighted_by_squared_diag_distance")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Persistence_representations/persistence_heat_maps/create_persistence_heat_maps")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/create_persistence_heat_maps" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/create_persistence_heat_maps")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/create_persistence_heat_maps")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Persistence_representations/persistence_heat_maps/plot_persistence_heat_map")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/plot_persistence_heat_map" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/plot_persistence_heat_map")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/plot_persistence_heat_map")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Persistence_representations/persistence_heat_maps/average_persistence_heat_maps")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/average_persistence_heat_maps" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/average_persistence_heat_maps")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/average_persistence_heat_maps")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Persistence_representations/persistence_heat_maps/compute_distance_of_persistence_heat_maps")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/compute_distance_of_persistence_heat_maps" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/compute_distance_of_persistence_heat_maps")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/compute_distance_of_persistence_heat_maps")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Persistence_representations/persistence_heat_maps/compute_scalar_product_of_persistence_heat_maps")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/compute_scalar_product_of_persistence_heat_maps" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/compute_scalar_product_of_persistence_heat_maps")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/compute_scalar_product_of_persistence_heat_maps")
    endif()
  endif()
endif()


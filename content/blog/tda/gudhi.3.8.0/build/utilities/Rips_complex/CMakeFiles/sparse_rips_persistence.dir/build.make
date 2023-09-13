# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.27.4/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.27.4/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/shashankpritam/github/personal/tda/gudhi.3.8.0

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build

# Include any dependencies generated for this target.
include utilities/Rips_complex/CMakeFiles/sparse_rips_persistence.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include utilities/Rips_complex/CMakeFiles/sparse_rips_persistence.dir/compiler_depend.make

# Include the progress variables for this target.
include utilities/Rips_complex/CMakeFiles/sparse_rips_persistence.dir/progress.make

# Include the compile flags for this target's objects.
include utilities/Rips_complex/CMakeFiles/sparse_rips_persistence.dir/flags.make

utilities/Rips_complex/CMakeFiles/sparse_rips_persistence.dir/sparse_rips_persistence.cpp.o: utilities/Rips_complex/CMakeFiles/sparse_rips_persistence.dir/flags.make
utilities/Rips_complex/CMakeFiles/sparse_rips_persistence.dir/sparse_rips_persistence.cpp.o: /Users/shashankpritam/github/personal/tda/gudhi.3.8.0/utilities/Rips_complex/sparse_rips_persistence.cpp
utilities/Rips_complex/CMakeFiles/sparse_rips_persistence.dir/sparse_rips_persistence.cpp.o: utilities/Rips_complex/CMakeFiles/sparse_rips_persistence.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object utilities/Rips_complex/CMakeFiles/sparse_rips_persistence.dir/sparse_rips_persistence.cpp.o"
	cd /Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Rips_complex && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT utilities/Rips_complex/CMakeFiles/sparse_rips_persistence.dir/sparse_rips_persistence.cpp.o -MF CMakeFiles/sparse_rips_persistence.dir/sparse_rips_persistence.cpp.o.d -o CMakeFiles/sparse_rips_persistence.dir/sparse_rips_persistence.cpp.o -c /Users/shashankpritam/github/personal/tda/gudhi.3.8.0/utilities/Rips_complex/sparse_rips_persistence.cpp

utilities/Rips_complex/CMakeFiles/sparse_rips_persistence.dir/sparse_rips_persistence.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/sparse_rips_persistence.dir/sparse_rips_persistence.cpp.i"
	cd /Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Rips_complex && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/shashankpritam/github/personal/tda/gudhi.3.8.0/utilities/Rips_complex/sparse_rips_persistence.cpp > CMakeFiles/sparse_rips_persistence.dir/sparse_rips_persistence.cpp.i

utilities/Rips_complex/CMakeFiles/sparse_rips_persistence.dir/sparse_rips_persistence.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/sparse_rips_persistence.dir/sparse_rips_persistence.cpp.s"
	cd /Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Rips_complex && /Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/shashankpritam/github/personal/tda/gudhi.3.8.0/utilities/Rips_complex/sparse_rips_persistence.cpp -o CMakeFiles/sparse_rips_persistence.dir/sparse_rips_persistence.cpp.s

# Object files for target sparse_rips_persistence
sparse_rips_persistence_OBJECTS = \
"CMakeFiles/sparse_rips_persistence.dir/sparse_rips_persistence.cpp.o"

# External object files for target sparse_rips_persistence
sparse_rips_persistence_EXTERNAL_OBJECTS =

utilities/Rips_complex/sparse_rips_persistence: utilities/Rips_complex/CMakeFiles/sparse_rips_persistence.dir/sparse_rips_persistence.cpp.o
utilities/Rips_complex/sparse_rips_persistence: utilities/Rips_complex/CMakeFiles/sparse_rips_persistence.dir/build.make
utilities/Rips_complex/sparse_rips_persistence: /Users/shashankpritam/micromamba/lib/libboost_program_options.dylib
utilities/Rips_complex/sparse_rips_persistence: /opt/homebrew/lib/libgmpxx.dylib
utilities/Rips_complex/sparse_rips_persistence: /opt/homebrew/lib/libmpfr.dylib
utilities/Rips_complex/sparse_rips_persistence: /opt/homebrew/lib/libgmp.dylib
utilities/Rips_complex/sparse_rips_persistence: utilities/Rips_complex/CMakeFiles/sparse_rips_persistence.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable sparse_rips_persistence"
	cd /Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Rips_complex && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sparse_rips_persistence.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
utilities/Rips_complex/CMakeFiles/sparse_rips_persistence.dir/build: utilities/Rips_complex/sparse_rips_persistence
.PHONY : utilities/Rips_complex/CMakeFiles/sparse_rips_persistence.dir/build

utilities/Rips_complex/CMakeFiles/sparse_rips_persistence.dir/clean:
	cd /Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Rips_complex && $(CMAKE_COMMAND) -P CMakeFiles/sparse_rips_persistence.dir/cmake_clean.cmake
.PHONY : utilities/Rips_complex/CMakeFiles/sparse_rips_persistence.dir/clean

utilities/Rips_complex/CMakeFiles/sparse_rips_persistence.dir/depend:
	cd /Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/shashankpritam/github/personal/tda/gudhi.3.8.0 /Users/shashankpritam/github/personal/tda/gudhi.3.8.0/utilities/Rips_complex /Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build /Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Rips_complex /Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Rips_complex/CMakeFiles/sparse_rips_persistence.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : utilities/Rips_complex/CMakeFiles/sparse_rips_persistence.dir/depend


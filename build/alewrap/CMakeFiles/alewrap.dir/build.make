# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/anp/alewrap

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/anp/alewrap/build

# Include any dependencies generated for this target.
include alewrap/CMakeFiles/alewrap.dir/depend.make

# Include the progress variables for this target.
include alewrap/CMakeFiles/alewrap.dir/progress.make

# Include the compile flags for this target's objects.
include alewrap/CMakeFiles/alewrap.dir/flags.make

alewrap/CMakeFiles/alewrap.dir/alewrap.cc.o: alewrap/CMakeFiles/alewrap.dir/flags.make
alewrap/CMakeFiles/alewrap.dir/alewrap.cc.o: ../alewrap/alewrap.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/anp/alewrap/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object alewrap/CMakeFiles/alewrap.dir/alewrap.cc.o"
	cd /home/anp/alewrap/build/alewrap && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/alewrap.dir/alewrap.cc.o -c /home/anp/alewrap/alewrap/alewrap.cc

alewrap/CMakeFiles/alewrap.dir/alewrap.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/alewrap.dir/alewrap.cc.i"
	cd /home/anp/alewrap/build/alewrap && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/anp/alewrap/alewrap/alewrap.cc > CMakeFiles/alewrap.dir/alewrap.cc.i

alewrap/CMakeFiles/alewrap.dir/alewrap.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/alewrap.dir/alewrap.cc.s"
	cd /home/anp/alewrap/build/alewrap && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/anp/alewrap/alewrap/alewrap.cc -o CMakeFiles/alewrap.dir/alewrap.cc.s

alewrap/CMakeFiles/alewrap.dir/alewrap.cc.o.requires:
.PHONY : alewrap/CMakeFiles/alewrap.dir/alewrap.cc.o.requires

alewrap/CMakeFiles/alewrap.dir/alewrap.cc.o.provides: alewrap/CMakeFiles/alewrap.dir/alewrap.cc.o.requires
	$(MAKE) -f alewrap/CMakeFiles/alewrap.dir/build.make alewrap/CMakeFiles/alewrap.dir/alewrap.cc.o.provides.build
.PHONY : alewrap/CMakeFiles/alewrap.dir/alewrap.cc.o.provides

alewrap/CMakeFiles/alewrap.dir/alewrap.cc.o.provides.build: alewrap/CMakeFiles/alewrap.dir/alewrap.cc.o

# Object files for target alewrap
alewrap_OBJECTS = \
"CMakeFiles/alewrap.dir/alewrap.cc.o"

# External object files for target alewrap
alewrap_EXTERNAL_OBJECTS =

alewrap/libalewrap.so: alewrap/CMakeFiles/alewrap.dir/alewrap.cc.o
alewrap/libalewrap.so: alewrap/CMakeFiles/alewrap.dir/build.make
alewrap/libalewrap.so: /home/anp/deepmind-atari/torch/lib/libxitari.so
alewrap/libalewrap.so: /lib/libremote.so
alewrap/libalewrap.so: /usr/lib/x86_64-linux-gnu/libboost_serialization.so
alewrap/libalewrap.so: /usr/lib/x86_64-linux-gnu/libboost_thread.so
alewrap/libalewrap.so: /usr/lib/x86_64-linux-gnu/libboost_system.so
alewrap/libalewrap.so: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
alewrap/libalewrap.so: /usr/lib/x86_64-linux-gnu/libpthread.so
alewrap/libalewrap.so: alewrap/CMakeFiles/alewrap.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared module libalewrap.so"
	cd /home/anp/alewrap/build/alewrap && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/alewrap.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
alewrap/CMakeFiles/alewrap.dir/build: alewrap/libalewrap.so
.PHONY : alewrap/CMakeFiles/alewrap.dir/build

alewrap/CMakeFiles/alewrap.dir/requires: alewrap/CMakeFiles/alewrap.dir/alewrap.cc.o.requires
.PHONY : alewrap/CMakeFiles/alewrap.dir/requires

alewrap/CMakeFiles/alewrap.dir/clean:
	cd /home/anp/alewrap/build/alewrap && $(CMAKE_COMMAND) -P CMakeFiles/alewrap.dir/cmake_clean.cmake
.PHONY : alewrap/CMakeFiles/alewrap.dir/clean

alewrap/CMakeFiles/alewrap.dir/depend:
	cd /home/anp/alewrap/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/anp/alewrap /home/anp/alewrap/alewrap /home/anp/alewrap/build /home/anp/alewrap/build/alewrap /home/anp/alewrap/build/alewrap/CMakeFiles/alewrap.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : alewrap/CMakeFiles/alewrap.dir/depend


# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_COMMAND = /home/ruiy/software/clion-2019.1/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/ruiy/software/clion-2019.1/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ruiy/mqtt/temp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ruiy/mqtt/temp/cmake-build-debug

# Include any dependencies generated for this target.
include src/CMakeFiles/MQTT_SUBSCRIBE.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/MQTT_SUBSCRIBE.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/MQTT_SUBSCRIBE.dir/flags.make

src/CMakeFiles/MQTT_SUBSCRIBE.dir/MQTT_SUBSCRIBE.cpp.o: src/CMakeFiles/MQTT_SUBSCRIBE.dir/flags.make
src/CMakeFiles/MQTT_SUBSCRIBE.dir/MQTT_SUBSCRIBE.cpp.o: ../src/MQTT_SUBSCRIBE.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ruiy/mqtt/temp/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/MQTT_SUBSCRIBE.dir/MQTT_SUBSCRIBE.cpp.o"
	cd /home/ruiy/mqtt/temp/cmake-build-debug/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/MQTT_SUBSCRIBE.dir/MQTT_SUBSCRIBE.cpp.o -c /home/ruiy/mqtt/temp/src/MQTT_SUBSCRIBE.cpp

src/CMakeFiles/MQTT_SUBSCRIBE.dir/MQTT_SUBSCRIBE.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MQTT_SUBSCRIBE.dir/MQTT_SUBSCRIBE.cpp.i"
	cd /home/ruiy/mqtt/temp/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ruiy/mqtt/temp/src/MQTT_SUBSCRIBE.cpp > CMakeFiles/MQTT_SUBSCRIBE.dir/MQTT_SUBSCRIBE.cpp.i

src/CMakeFiles/MQTT_SUBSCRIBE.dir/MQTT_SUBSCRIBE.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MQTT_SUBSCRIBE.dir/MQTT_SUBSCRIBE.cpp.s"
	cd /home/ruiy/mqtt/temp/cmake-build-debug/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ruiy/mqtt/temp/src/MQTT_SUBSCRIBE.cpp -o CMakeFiles/MQTT_SUBSCRIBE.dir/MQTT_SUBSCRIBE.cpp.s

# Object files for target MQTT_SUBSCRIBE
MQTT_SUBSCRIBE_OBJECTS = \
"CMakeFiles/MQTT_SUBSCRIBE.dir/MQTT_SUBSCRIBE.cpp.o"

# External object files for target MQTT_SUBSCRIBE
MQTT_SUBSCRIBE_EXTERNAL_OBJECTS =

src/MQTT_SUBSCRIBE: src/CMakeFiles/MQTT_SUBSCRIBE.dir/MQTT_SUBSCRIBE.cpp.o
src/MQTT_SUBSCRIBE: src/CMakeFiles/MQTT_SUBSCRIBE.dir/build.make
src/MQTT_SUBSCRIBE: src/CMakeFiles/MQTT_SUBSCRIBE.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ruiy/mqtt/temp/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable MQTT_SUBSCRIBE"
	cd /home/ruiy/mqtt/temp/cmake-build-debug/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/MQTT_SUBSCRIBE.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/MQTT_SUBSCRIBE.dir/build: src/MQTT_SUBSCRIBE

.PHONY : src/CMakeFiles/MQTT_SUBSCRIBE.dir/build

src/CMakeFiles/MQTT_SUBSCRIBE.dir/clean:
	cd /home/ruiy/mqtt/temp/cmake-build-debug/src && $(CMAKE_COMMAND) -P CMakeFiles/MQTT_SUBSCRIBE.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/MQTT_SUBSCRIBE.dir/clean

src/CMakeFiles/MQTT_SUBSCRIBE.dir/depend:
	cd /home/ruiy/mqtt/temp/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ruiy/mqtt/temp /home/ruiy/mqtt/temp/src /home/ruiy/mqtt/temp/cmake-build-debug /home/ruiy/mqtt/temp/cmake-build-debug/src /home/ruiy/mqtt/temp/cmake-build-debug/src/CMakeFiles/MQTT_SUBSCRIBE.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/MQTT_SUBSCRIBE.dir/depend


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
include libs/CMakeFiles/paho-mqtt3as.dir/depend.make

# Include the progress variables for this target.
include libs/CMakeFiles/paho-mqtt3as.dir/progress.make

# Include the compile flags for this target's objects.
include libs/CMakeFiles/paho-mqtt3as.dir/flags.make

libs/CMakeFiles/paho-mqtt3as.dir/MQTTAsync.c.o: libs/CMakeFiles/paho-mqtt3as.dir/flags.make
libs/CMakeFiles/paho-mqtt3as.dir/MQTTAsync.c.o: ../libs/MQTTAsync.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ruiy/mqtt/temp/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object libs/CMakeFiles/paho-mqtt3as.dir/MQTTAsync.c.o"
	cd /home/ruiy/mqtt/temp/cmake-build-debug/libs && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/paho-mqtt3as.dir/MQTTAsync.c.o   -c /home/ruiy/mqtt/temp/libs/MQTTAsync.c

libs/CMakeFiles/paho-mqtt3as.dir/MQTTAsync.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/paho-mqtt3as.dir/MQTTAsync.c.i"
	cd /home/ruiy/mqtt/temp/cmake-build-debug/libs && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ruiy/mqtt/temp/libs/MQTTAsync.c > CMakeFiles/paho-mqtt3as.dir/MQTTAsync.c.i

libs/CMakeFiles/paho-mqtt3as.dir/MQTTAsync.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/paho-mqtt3as.dir/MQTTAsync.c.s"
	cd /home/ruiy/mqtt/temp/cmake-build-debug/libs && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ruiy/mqtt/temp/libs/MQTTAsync.c -o CMakeFiles/paho-mqtt3as.dir/MQTTAsync.c.s

libs/CMakeFiles/paho-mqtt3as.dir/SSLSocket.c.o: libs/CMakeFiles/paho-mqtt3as.dir/flags.make
libs/CMakeFiles/paho-mqtt3as.dir/SSLSocket.c.o: ../libs/SSLSocket.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ruiy/mqtt/temp/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object libs/CMakeFiles/paho-mqtt3as.dir/SSLSocket.c.o"
	cd /home/ruiy/mqtt/temp/cmake-build-debug/libs && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/paho-mqtt3as.dir/SSLSocket.c.o   -c /home/ruiy/mqtt/temp/libs/SSLSocket.c

libs/CMakeFiles/paho-mqtt3as.dir/SSLSocket.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/paho-mqtt3as.dir/SSLSocket.c.i"
	cd /home/ruiy/mqtt/temp/cmake-build-debug/libs && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ruiy/mqtt/temp/libs/SSLSocket.c > CMakeFiles/paho-mqtt3as.dir/SSLSocket.c.i

libs/CMakeFiles/paho-mqtt3as.dir/SSLSocket.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/paho-mqtt3as.dir/SSLSocket.c.s"
	cd /home/ruiy/mqtt/temp/cmake-build-debug/libs && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ruiy/mqtt/temp/libs/SSLSocket.c -o CMakeFiles/paho-mqtt3as.dir/SSLSocket.c.s

# Object files for target paho-mqtt3as
paho__mqtt3as_OBJECTS = \
"CMakeFiles/paho-mqtt3as.dir/MQTTAsync.c.o" \
"CMakeFiles/paho-mqtt3as.dir/SSLSocket.c.o"

# External object files for target paho-mqtt3as
paho__mqtt3as_EXTERNAL_OBJECTS =

libs/libpaho-mqtt3as.so: libs/CMakeFiles/paho-mqtt3as.dir/MQTTAsync.c.o
libs/libpaho-mqtt3as.so: libs/CMakeFiles/paho-mqtt3as.dir/SSLSocket.c.o
libs/libpaho-mqtt3as.so: libs/CMakeFiles/paho-mqtt3as.dir/build.make
libs/libpaho-mqtt3as.so: libs/CMakeFiles/paho-mqtt3as.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ruiy/mqtt/temp/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C shared library libpaho-mqtt3as.so"
	cd /home/ruiy/mqtt/temp/cmake-build-debug/libs && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/paho-mqtt3as.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libs/CMakeFiles/paho-mqtt3as.dir/build: libs/libpaho-mqtt3as.so

.PHONY : libs/CMakeFiles/paho-mqtt3as.dir/build

libs/CMakeFiles/paho-mqtt3as.dir/clean:
	cd /home/ruiy/mqtt/temp/cmake-build-debug/libs && $(CMAKE_COMMAND) -P CMakeFiles/paho-mqtt3as.dir/cmake_clean.cmake
.PHONY : libs/CMakeFiles/paho-mqtt3as.dir/clean

libs/CMakeFiles/paho-mqtt3as.dir/depend:
	cd /home/ruiy/mqtt/temp/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ruiy/mqtt/temp /home/ruiy/mqtt/temp/libs /home/ruiy/mqtt/temp/cmake-build-debug /home/ruiy/mqtt/temp/cmake-build-debug/libs /home/ruiy/mqtt/temp/cmake-build-debug/libs/CMakeFiles/paho-mqtt3as.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libs/CMakeFiles/paho-mqtt3as.dir/depend


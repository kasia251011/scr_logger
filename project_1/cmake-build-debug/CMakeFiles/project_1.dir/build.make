# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

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
CMAKE_COMMAND = /opt/clion/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /opt/clion/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /media/sf_SCR/project_1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /media/sf_SCR/project_1/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/project_1.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/project_1.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/project_1.dir/flags.make

CMakeFiles/project_1.dir/main.c.o: CMakeFiles/project_1.dir/flags.make
CMakeFiles/project_1.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/sf_SCR/project_1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/project_1.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/project_1.dir/main.c.o   -c /media/sf_SCR/project_1/main.c

CMakeFiles/project_1.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/project_1.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /media/sf_SCR/project_1/main.c > CMakeFiles/project_1.dir/main.c.i

CMakeFiles/project_1.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/project_1.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /media/sf_SCR/project_1/main.c -o CMakeFiles/project_1.dir/main.c.s

CMakeFiles/project_1.dir/logger.c.o: CMakeFiles/project_1.dir/flags.make
CMakeFiles/project_1.dir/logger.c.o: ../logger.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/sf_SCR/project_1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/project_1.dir/logger.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/project_1.dir/logger.c.o   -c /media/sf_SCR/project_1/logger.c

CMakeFiles/project_1.dir/logger.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/project_1.dir/logger.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /media/sf_SCR/project_1/logger.c > CMakeFiles/project_1.dir/logger.c.i

CMakeFiles/project_1.dir/logger.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/project_1.dir/logger.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /media/sf_SCR/project_1/logger.c -o CMakeFiles/project_1.dir/logger.c.s

# Object files for target project_1
project_1_OBJECTS = \
"CMakeFiles/project_1.dir/main.c.o" \
"CMakeFiles/project_1.dir/logger.c.o"

# External object files for target project_1
project_1_EXTERNAL_OBJECTS =

project_1: CMakeFiles/project_1.dir/main.c.o
project_1: CMakeFiles/project_1.dir/logger.c.o
project_1: CMakeFiles/project_1.dir/build.make
project_1: CMakeFiles/project_1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/media/sf_SCR/project_1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable project_1"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/project_1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/project_1.dir/build: project_1

.PHONY : CMakeFiles/project_1.dir/build

CMakeFiles/project_1.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/project_1.dir/cmake_clean.cmake
.PHONY : CMakeFiles/project_1.dir/clean

CMakeFiles/project_1.dir/depend:
	cd /media/sf_SCR/project_1/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /media/sf_SCR/project_1 /media/sf_SCR/project_1 /media/sf_SCR/project_1/cmake-build-debug /media/sf_SCR/project_1/cmake-build-debug /media/sf_SCR/project_1/cmake-build-debug/CMakeFiles/project_1.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/project_1.dir/depend

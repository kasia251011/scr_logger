cmake_minimum_required(VERSION 3.17)
project(project_1 C)

set(CMAKE_C_STANDARD 11)
set(THREADS_PREFER_PTHREAD_FLAG ON)

add_executable(project_1 main.c logger.c logger.h)

find_package(Threads REQUIRED)
target_link_libraries(project_1 ${CMAKE_THREAD_LIBS_INIT} rt)
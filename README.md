stm32-cmake
===========

Minimal stm32 project build with cmake. It's tested together with nucleo-L053R8 board.

# HowTO use:
* mkdir build
* cd build
* cmake -DCMAKE_TOOLCHAIN_FILE=../cmake/Modules/arm-none-eabi.cmake -G Unix\ Makefiles ..
* make

# Write/read/erase flash
* make write
* make read
* make erase

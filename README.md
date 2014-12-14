stm32-cmake
===========

STM32 project build with cmake. It's tested together with nucleo-L053R8 board. It`s possible to compile production code on host machine according with point 3. When compiling on host machine, gtest framework is enabled.

# HowTO build for STM32:
* mkdir build
* cd build
* cmake -DCMAKE_TOOLCHAIN_FILE=../cmake/Modules/arm-none-eabi.cmake -G "Unix Makefiles" ..
* make

# Write/read/erase flash
* make write
* make read
* make erase

# HowTO build for host:
* mkdir host
* cd host
* cmake -G "Unix Makefiles" ..
* make
* make test

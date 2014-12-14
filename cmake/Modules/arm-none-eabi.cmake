find_program(ARM-NONE-EABI "arm-none-eabi-gcc")
if (NOT ARM-NONE-EABI)
	message( FATAL_ERROR "No cross compiler found")

endif(NOT ARM-NONE-EABI)

INCLUDE(CMakeForceCompiler)

set(CMAKE_SYSTEM_NAME Generic)

set( CROSS_COMPILE arm-none-eabi- )

CMAKE_FORCE_C_COMPILER(arm-none-eabi-gcc GNU)
CMAKE_FORCE_CXX_COMPILER(arm-none-eabi-g++ GNU)
set(CMAKE_ASM_COMPILER arm-none-eabi-as)
set(CMAKE_OBJCOPY arm-none-eabi-objcopy)

# SET(CMAKE_C_FLAGS "-mthumb -mcpu=cortex-m0plus -fno-builtin -Wall -std=gnu99 -fdata-sections -ffunction-sections" CACHE INTERNAL "c compiler flags")
SET(CMAKE_C_FLAGS "-mthumb -mcpu=cortex-m0plus" CACHE INTERNAL "c compiler flags")
# SET(CMAKE_CXX_FLAGS "-mthumb -mcpu=cortex-m0plus -fno-builtin -fdata-sections -ffunction-sections" CACHE INTERNAL "cxx compiler flags")
SET(CMAKE_CXX_FLAGS "-mthumb -mcpu=cortex-m0plus" CACHE INTERNAL "cxx compiler flags")
SET(CMAKE_ASM_FLAGS "-mthumb -mcpu=cortex-m0plus" CACHE INTERNAL "asm compiler flags")

# SET(CMAKE_EXE_LINKER_FLAGS "-nostartfiles -Wl,-Map=mmap.map,--cref,--no-warn-mismatch -mthumb -mcpu=cortex-m0plus" CACHE INTERNAL "exe link flags")
set(CMAKE_EXE_LINKER_FLAGS "-nostartfiles -mcpu=cortex-m0plus -mthumb" CACHE INTERNAL "exe link flags")

set(CMAKE_FIND_ROOT_PATH "/usr/arm-none-eabi")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)

set(PLATFORM_INCLUDE
	${CMAKE_CURRENT_SOURCE_DIR}/include
	${CMAKE_CURRENT_SOURCE_DIR}/cmsis
	PARENT_SCOPE
)

set(PLATFORM_LINKER_SCRIPT
	${CMAKE_CURRENT_SOURCE_DIR}/linker/STM32L053R8_FLASH.ld
	PARENT_SCOPE
)

include_directories(include cmsis)
add_library(platform src/system_stm32l0xx.c src/startup_stm32l053xx.s)
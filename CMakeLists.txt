cmake_minimum_required( VERSION 3.0 FATAL_ERROR )
project( "stm32l053-blinky" )
# project( "stm32l053-blinky" C ASM )

list( APPEND CMAKE_MODULE_PATH
	${CMAKE_SOURCE_DIR}/cmake/Modules
)

# Determine toolchain
GET_FILENAME_COMPONENT(TOOLCHAIN ${CMAKE_C_COMPILER} NAME )
if( ${TOOLCHAIN} MATCHES "arm-none-eabi-gcc" )
	message( "Cross compiling with ${TOOLCHAIN}" )
	include(arm-none-eabi)
	set(CMAKE_EXE_LINKER_FLAGS
		"${CMAKE_EXE_LINKER_FLAGS} -T${PLATFORM_LINKER_SCRIPT}")

# Use platform files
add_subdirectory(platform)

	include_directories(${PLATFORM_INCLUDE}
	)
else( )
	message( "Compiling for Host machine" )
	message( "Enable testing" )
	enable_testing()
	find_package(GTest REQUIRED)
	include_directories(${GTEST_INCLUDE_DIRS})

	# Use fake platform for tests
	add_subdirectory(platform_for_tests)

	include_directories( ${PLATFORM_INCLUDE_FOR_TESTS}
	)
endif( ${TOOLCHAIN} MATCHES "arm-none-eabi-gcc" )

add_subdirectory(src)

if( ${TOOLCHAIN} MATCHES "arm-none-eabi-gcc" )
	add_executable(${PROJECT_NAME}.elf
		src/main.c
	)

	target_link_libraries(
		${PROJECT_NAME}.elf
		platform
	)

	add_custom_target(${PROJECT_NAME}.bin ALL DEPENDS ${PROJECT_NAME}.elf
		COMMAND ${CMAKE_OBJCOPY} -Obinary ${PROJECT_NAME}.elf ${PROJECT_NAME}.bin
	)

	find_program(ST_FLASH "st-flash")

	if(NOT ST_FLASH)
		message( SEND_ERROR "Can't use make write/read/erase" )

	else()
		set(FLASH_ADDR	"0x8000000")
		add_custom_target(write DEPENDS ${PROJECT_NAME}.bin
			COMMAND ${ST_FLASH} --reset write ${PROJECT_NAME}.bin ${FLASH_ADDR} 2>&1 | tail -2
		)

		add_custom_target(read
			COMMAND ${ST_FLASH} --reset read ${PROJECT_NAME}_read.bin ${FLASH_ADDR} 2>&1 | tail -2
		)

		add_custom_target(erase
			COMMAND ${ST_FLASH} --reset erase
		)

	endif(NOT ST_FLASH)

else( )
	add_executable(${PROJECT_NAME}
		src/main.c
	)

	target_link_libraries(
		${PROJECT_NAME}
		platform_for_tests
	)

endif( ${TOOLCHAIN} MATCHES "arm-none-eabi-gcc" )

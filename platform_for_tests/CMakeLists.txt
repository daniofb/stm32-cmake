set( PLATFORM_INCLUDE_FOR_TESTS
	${CMAKE_CURRENT_SOURCE_DIR}/include
	PARENT_SCOPE
)

include_directories( include cmsis )
add_library( platform_for_tests src/system_stm32l0xx.c )

# Add test cpp file
add_executable( runUnitTests src/testgtest.cxx )
target_link_libraries(runUnitTests ${GTEST_BOTH_LIBRARIES})
add_test( runUnitTests runUnitTests )

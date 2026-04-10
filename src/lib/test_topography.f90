program test_topography
    use rconstants, only: init_planet_constants, has_liquid_water, has_vegetation
    implicit none

    integer :: exit_code
    exit_code = 0

    print *, "--- Starting Topography and Biosphere Unit Tests ---"

    ! 1. TEST EARTH SURFACE
    call init_planet_constants('earth')

    if (.not. has_liquid_water) then
        print *, "FAIL: Earth should support liquid water"
        exit_code = 1
    end if
    
    if (.not. has_vegetation) then
        print *, "FAIL: Earth should support vegetation"
        exit_code = 1
    end if

    print *, "--- Earth topography and biosphere verified."

    ! 2. TEST MARS SURFACE
    call init_planet_constants('mars')

    if (has_liquid_water) then
        print *, "FAIL: Mars should NOT support liquid water"
        exit_code = 1
    end if

    if (has_vegetation) then
        print *, "FAIL: Mars should NOT support vegetation"
        exit_code = 1
    end if

    print *, "--- Mars barren topography verified."

    if (exit_code == 0) then
        print *, "SUCCESS: All topography tests passed."
    else
        print *, "ERROR: One or more topography tests failed."
    end if

    call exit(exit_code)

end program test_topography

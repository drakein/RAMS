program test_map_proj
    use rconstants, only: init_planet_constants, erad
    implicit none

    integer :: exit_code
    real :: ri_earth, rj_earth, ri_mars, rj_mars
    exit_code = 0

    print *, "--- Starting Geographic Projection Unit Tests ---"

    ! 1. TEST EARTH PROJECTION
    call init_planet_constants('earth')

    call ll2lc(45.0, -100.0, 46.0, -99.0, ri_earth, rj_earth, 45.0, -100.0, 10000.0)

    print *, "Earth projection (ri, rj): ", ri_earth, rj_earth

    ! 2. TEST MARS PROJECTION
    call init_planet_constants('mars')

    call ll2lc(45.0, -100.0, 46.0, -99.0, ri_mars, rj_mars, 45.0, -100.0, 10000.0)

    print *, "Mars projection (ri, rj): ", ri_mars, rj_mars

    if (abs(ri_earth - ri_mars) < 1.0) then
        print *, "FAIL: Mars grid spacing exactly matched Earth! The erad boundary failed."
        exit_code = 1
    end if

    print *, "--- Geographic boundary divergence verified successfully."

    if (exit_code == 0) then
        print *, "SUCCESS: All geo-projection tests passed."
    else
        print *, "ERROR: One or more geo-projection tests failed."
    end if

    call exit(exit_code)

end program test_map_proj

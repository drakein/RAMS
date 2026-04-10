program test_orbital
    use rconstants, only: init_planet_constants, seconds_per_day, days_per_year, axial_tilt, eccentricity
    implicit none

    integer :: exit_code
    exit_code = 0

    print *, "--- Starting Orbital Unit Tests ---"

    ! 1. TEST EARTH
    call init_planet_constants('earth')

    if (abs(seconds_per_day - 86400.) > 1.0) then
        print *, "FAIL: Earth seconds per day should be 86400.0, got ", seconds_per_day
        exit_code = 1
    end if

    if (abs(days_per_year - 365.) > 1.0) then
        print *, "FAIL: Earth days per year should be 365.0, got ", days_per_year
        exit_code = 1
    end if

    print *, "--- Earth orbital boundary verified."

    ! 2. TEST MARS
    call init_planet_constants('mars')

    if (abs(seconds_per_day - 88775.) > 1.0) then
        print *, "FAIL: Mars seconds per day should be 88775.0, got ", seconds_per_day
        exit_code = 1
    end if

    if (abs(days_per_year - 687.) > 1.0) then
        print *, "FAIL: Mars days per year should be 687.0, got ", days_per_year
        exit_code = 1
    end if

    if (abs(axial_tilt - 25.19) > 0.01) then
        print *, "FAIL: Mars axial tilt should be 25.19, got ", axial_tilt
        exit_code = 1
    end if

    print *, "--- Mars orbital boundary verified."

    if (exit_code == 0) then
        print *, "SUCCESS: All orbital tests passed."
    else
        print *, "ERROR: One or more orbital tests failed."
    end if

    call exit(exit_code)

end program test_orbital

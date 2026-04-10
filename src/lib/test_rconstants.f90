program test_rconstants
    use rconstants
    implicit none

    integer :: error_count

    error_count = 0

    print *, "Starting planetary physics unit test..."

    ! 1. TEST EARTH
    call init_planet_constants('earth')
    if (abs(erad - 6367000.) > 1.0) then
        print *, "FAIL: Earth radius should be 6367000., got ", erad
        error_count = error_count + 1
    endif
    if (abs(g - 9.80) > 0.01) then
        print *, "FAIL: Earth gravity should be 9.80, got ", g
        error_count = error_count + 1
    endif

    print *, "--- Earth initialization verified."

    ! 2. TEST MARS
    call init_planet_constants('mars')
    if (abs(erad - 3389500.) > 1.0) then
        print *, "FAIL: Mars radius should be 3389500., got ", erad
        error_count = error_count + 1
    endif
    if (abs(g - 3.721) > 0.01) then
        print *, "FAIL: Mars gravity should be 3.721, got ", g
        error_count = error_count + 1
    endif

    print *, "--- Mars initialization verified."

    if (error_count > 0) then
        print *, "UNIT TEST FAILED with ", error_count, " errors."
        call exit(1)
    else
        print *, "UNIT TEST PASSED."
        call exit(0)
    endif

end program test_rconstants

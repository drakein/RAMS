!##############################################################################
Module rconstants

implicit none

real :: rgas=287., cp=1004., cv=717., rm=461., p00=1.e5, t00=273.16, g=9.80, &
        pi180=3.1415927/180., pi4=3.1415927*4., spcon=111120., erad=6367000., &
        vonk=0.40, tkmin=5.e-4, alvl=2.50e6, alvi=2.834e6, alli=0.334e6, &
        alvl2=6.25e12, alvi2=8.032e12, solar=1.3533e3, stefan=5.6696e-8, &
        cww=4218., c0=752.55*4.18684e4, viscos=.15e-4, rowt=1.e3, dlat=111120., &
        omega=7.292e-5, rocp=287./1004., p00i=1./1.e5, cpor=1004./287., &
        rocv=287./717., cpi=1./1004., cpi4=4.*(1./1004.), cp253i=(1./1004.)/253., &
        allii=1./0.334e6, aklv=2.50e6/1004., akiv=2.834e6/1004., gama=1004./717., &
        gg=.5*9.80, ep=287./461., p00k=26.870941, p00ki=1./26.870941
real :: seconds_per_day=86400., days_per_year=365., axial_tilt=23.5, eccentricity=0.0167
logical :: has_liquid_water=.true., has_vegetation=.true.

contains

  subroutine init_planet_constants(planet_name)
    implicit none
    character(len=*), intent(in) :: planet_name

    if (trim(planet_name) == 'mars') then
       ! Mars constants
       rgas     = 192.
       cp       = 860.
       cv       = cp / 1.3
       rm       = 461.
       p00      = 600.
       t00      = 273.16
       g        = 3.721
       pi180    = 3.1415927 / 180.
       pi4      = 3.1415927 * 4.
       spcon    = 111120.
       erad     = 3389500.
       vonk     = 0.40
       tkmin    = 5.e-4
       alvl     = 2.50e6
       alvi     = 2.834e6
       alli     = 0.334e6
       alvl2    = 6.25e12
       alvi2    = 8.032e12
       solar    = 586.      ! Solar flux at Mars
       stefan   = 5.6696e-8
       cww      = 4218.
       c0       = 752.55 * 4.18684e4
       viscos   = .15e-4
       rowt     = 1.e3
       dlat     = 111120.
       omega    = 7.088e-5 ! Mars angular velocity
       seconds_per_day = 88775.
       days_per_year   = 687.
       axial_tilt      = 25.19
       eccentricity    = 0.0934
       has_liquid_water = .false.
       has_vegetation  = .false.
    else
       ! Earth constants (defaults)
       rgas     = 287.
       cp       = 1004.
       cv       = 717.
       rm       = 461.
       p00      = 1.e5
       t00      = 273.16
       g        = 9.80
       pi180    = 3.1415927 / 180.
       pi4      = 3.1415927 * 4.
       spcon    = 111120.
       erad     = 6367000.
       vonk     = 0.40
       tkmin    = 5.e-4
       alvl     = 2.50e6
       alvi     = 2.834e6
       alli     = 0.334e6
       alvl2    = 6.25e12
       alvi2    = 8.032e12
       solar    = 1.3533e3
       stefan   = 5.6696e-8
       cww      = 4218.
       c0       = 752.55 * 4.18684e4
       viscos   = .15e-4
       rowt     = 1.e3
       dlat     = 111120.
       omega    = 7.292e-5
       seconds_per_day = 86400.
       days_per_year   = 365.
       axial_tilt      = 23.5
       eccentricity    = 0.0167
       has_liquid_water = .true.
       has_vegetation  = .true.
    endif

    ! Recalculate derived constants dynamically
    rocp     = rgas / cp
    p00i     = 1. / p00
    cpor     = cp / rgas
    rocv     = rgas / cv
    cpi      = 1. / cp
    cpi4     = 4. * cpi
    cp253i   = cpi / 253.
    allii    = 1. / alli
    aklv     = alvl / cp
    akiv     = alvi / cp
    gama     = cp / cv
    gg       = .5 * g
    ep       = rgas / rm
    p00k     = p00 ** rocp
    p00ki    = 1. / p00k

  end subroutine init_planet_constants

END MODULE rconstants

include <MCAD\gears.scad>;
include <MCAD\units.scad>;

//translate([0,0,1 * inch])
 
 difference(){
 linear_extrude(.25 * inch)
//	gear(number_of_teeth=20,diametral_pitch=1.8, pressure_angle=20, clearance=-.5);
 gear(number_of_teeth=120,circular_pitch=97.8, pressure_angle=.25);


  cylinder(r = 1 * inch, h = 5 * inch, center = true);
}

//cylinder(r = 2.5/2 * inch, h = .37 * inch, center = true, $fn=200)cylinder(r = .47/2 * inch, h = .37 * inch, center = true, $fn=200);
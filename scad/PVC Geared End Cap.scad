include <MCAD\gears.scad>;
include <MCAD\units.scad>;

//translate([0,0,1 * inch])
 
 difference(){
 linear_extrude(.25 * inch)
	gear(number_of_teeth=50,diametral_pitch=.5, pressure_angle=0, clearance=0);
	// gear(number_of_teeth=50,circular_pitch=200, pressure_angle=.25);


  cylinder(r = 1.75 * inch, h = 5 * inch, center = true);
}
include <MCAD\gears.scad>;
include <MCAD\units.scad>;

//translate([0,0,1 * inch])
 
 difference(){
 linear_extrude(.25 * inch)
			gear(number_of_teeth=100,diametral_pitch=(100+2)/63.6619, pressure_angle=20, clearance=-.25);
// gear(number_of_teeth=20,circular_pitch=1.713600311563693, pressure_angle=0);


 		cylinder(r = 1 * inch, h = 5 * inch, center = true);
}

//cylinder(r = 2.5/2 * inch, h = .37 * inch, center = true, $fn=200)cylinder(r = .47/2 * inch, h = .37 * inch, center = true, $fn=200);
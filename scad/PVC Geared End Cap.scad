include <MCAD\gears.scad>;
include <MCAD\units.scad>;
use <Herringbone_gears_hi-res.scad>;

//translate([0,0,1 * inch])
numberOfTeeth = 110;
gearDiameter = 63.6619;

 
addJoiningHoles() addCenterHole() {
	 linear_extrude(.4 * inch)
				gear(number_of_teeth=numberOfTeeth,diametral_pitch=1.633630161839342, pressure_angle=20, clearance=-.25);
					//			gear(number_of_teeth=numberOfTeeth,diametral_pitch=(numberOfTeeth+4)/gearDiameter, pressure_angle=20, clearance=-.25);
					// gear(number_of_teeth=20,circular_pitch=1.713600311563693, pressure_angle=0);


					//cylinder(r = 2.5/2 * inch, h = .37 * inch, center = true, $fn=200)cylinder(r = .47/2 * inch, h = .37 * inch, center = true, $fn=200);

	 
		translate([0,0,.55 * inch])
		biggear();

		{
			for (side = [1,-1])
			{
				translate([0,0,.275 * inch * side + (.4 * inch/2)])
					beltSideWall();
			}
			
		}
	}
	
translate([0,4 * inch,0])
	  rotate([180,0,0])
	  addJoiningHoles() addCenterHole() pipeConnection(); 
	  

	
module biggear() {
    translate([0,0,11/2])
	difference()
	{
	WadeL_double_helix();
	cylinder(200, 1.15 * inch, 1.15 * inch, center = true);
	}
}

module beltSideWall()
{
	rotate_extrude(convexity = 50)
		translate([1.35 * inch, 0, 0])
			circle(r = 2, $fn=100); 
	 cylinder(4,1.35*inch,1.35*inch, center=true );
}


module pipeConnection()
{
translate([0,0,-1 * inch])
	difference()
	{	  
		cylinder(2 * inch, 4 * inch /2 , 4 * inch /2, center = true);
		translate([0,0,-.25 * inch])
			cylinder(2 * inch, 3.5 * inch /2 , 3.5 * inch /2, center = true);
	}
}


module addCenterHole()
{
		difference(){
			children();
			cylinder(1000,4,4,center=true, $fn=100);
		}
}

module addJoiningHoles()
{
		difference(){
			children();
			for (otherSide = [1, -1])
			for (side = [1,-1])
			translate([13 * side,13 * otherSide,0])
				cylinder(1000,2,2,center=true, $fn=100);
		}
}
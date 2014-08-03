include <MCAD\gears.scad>;
include <MCAD\units.scad>;
use <Herringbone_gears_hi-res.scad>;

//translate([0,0,1 * inch])


  addCenterHole() {
	
		
		comboGears();
		cone();
		translate([0,0,-13])
			nutHolder();
		
}



translate([0,0,.75/2 * inch])
	  rotate([180,0,0])
	 	addHolesToConnectToPipe()  addCenterHole() pipeConnection(); 
	  
	  
	  
	  
	  
	  
module addHolesToConnectToPipe() {
	difference()
	{
		children();
		translate([0,0,-25])
			rotate([90,0,0])
				cylinder(200,2,2,center=true, $fn=100);
		translate([0,0,-25])
			rotate([0,90,0])
				cylinder(200,2,2,center=true, $fn=100);
	}
}	  
	  
	  
module comboGears(){
	rotate([180,0,0])
	translate([0,0,.15375 * inch])
	{		
		removeCenterCore() beltGear();
			translate([0,0,.55 * inch])
				motorGear();
			for (side = [1,-1])
			{
				translate([0,0,.275 * inch * side + (.4 * inch/2)])
					removeCenterCore() beltSideWall();
			}
	}
}

module cone()
{
  translate([0,0,.75/2 * inch])
  difference() {
		cylinder(.75 * inch, 2.85/2 * inch, 4/2 * inch, center = true, $fn=100);
		cylinder(.80 * inch, (2.85-.5)/2 * inch, 3.525/2 * inch, center = true, $fn=100);
	}		
}

	
module motorGear() {
    translate([0,0,11/2])
	{
		difference()
		{
		rotate([180,0,0])
			WadeL_double_helix();
		cylinder(200, 1.15 * inch, 1.15 * inch, center = true, $fn=100);
		}
		cylinder(11, 1.15 * inch, 1.15 * inch, center = true, $fn=100);
	}
}

module beltGear()
{
numberOfTeeth = 110;
gearDiameter = 63.6619;
 linear_extrude(.4 * inch)
				gear(number_of_teeth=numberOfTeeth,diametral_pitch=1.633630161839342, pressure_angle=20, clearance=-.25);
					//			gear(number_of_teeth=numberOfTeeth,diametral_pitch=(numberOfTeeth+4)/gearDiameter, pressure_angle=20, clearance=-.25);
					// gear(number_of_teeth=20,circular_pitch=1.713600311563693, pressure_angle=0);


					//cylinder(r = 2.5/2 * inch, h = .37 * inch, center = true, $fn=200)cylinder(r = .47/2 * inch, h = .37 * inch, center = true, $fn=200);
}

module beltSideWall()
{
	rotate_extrude(convexity = 50, $fn=100)
		translate([1.35 * inch, 0, 0])
			circle(r = 2, $fn=100); 
	 cylinder(4,1.35*inch,1.35*inch, center=true , $fn=100);
}


module pipeConnection()
{
translate([0,0,-1 * inch])
	difference()
	{	  
		cylinder(1.25 * inch, 4 * inch /2 , 4 * inch /2, center = true, $fn=100);
		cylinder(2 * inch, 3.525 * inch /2 , 3.525 * inch /2, center = true, $fn=100);
	}
}

module removeCenterCore()
{
		difference(){
			children();
			cylinder(1000,1.1 * inch,1.1 * inch,center=true, $fn=100);
		}
}

module addCenterHole()
{
		difference(){
			children();
			cylinder(1000,4,4,center=true, $fn=100);
		}
}


module nutHolder() {
	difference(){
	  cylinder(10,25/2,25/2, center=true);
	  cylinder(11,.595/2*inch,.595/2*inch, center=true, $fn=6);
	}
  
}
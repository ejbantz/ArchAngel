include <MCAD\units.scad>;

union(){
	rotate([0,180,0])
		addHolesToConnectToPipe()  addCenterHole() pipeConnection(); 
	translate([0,0,20])
		nutHolder();
}
	  
	  
module addHolesToConnectToPipe() {
	difference()
	{
		children();
		translate([0,0,-27])
			rotate([90,0,0])
				cylinder(200,2,2,center=true, $fn=100);
		translate([0,0,-27])
			rotate([0,90,0])
				cylinder(200,2,2,center=true, $fn=100);
	}
}	  
	  
	  



module nutHolder() {
	difference(){
	  cylinder(10,25/2,25/2, center=true);
	  cylinder(11,.595/2*inch,.595/2*inch, center=true, $fn=6);
	}
  
}
	  
module pipeConnection()
{
translate([0,0,-1 * inch])
	difference()
	{	  
		cylinder(1.25 * inch, 4 * inch /2 , 4 * inch /2, center = true, $fn=100);
		translate([0,0,-.25 * inch])
			cylinder(1.25 * inch, 3.525 * inch /2 , 3.525 * inch /2, center = true, $fn=100);
	}
}


module addCenterHole()
{
		difference(){
			children();
			cylinder(1000,4,4,center=true, $fn=100);
		}
}

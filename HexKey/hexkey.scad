// from https://www.brixel.be/projecten/3d-allen-key/
include <write/Write.scad>;

Maat = 15;
Kort = 30;
Lang = 70;
TXT="15 mm";

FontSize = Maat / 2;
Bocht = Maat;

union()
{
Kort_Stuk();
Lang_Stuk();
Tussenstuk();
}



module Kort_Stuk()
{
// Kort Stuk
color ("Green")
linear_extrude(height=Kort)
//rotate(30,0,0)
circle(r=Maat/2/cos(30),$fn=6);
}

module Lang_Stuk()
{
// Lang stuk
color ("Blue")
translate(v=[-Lang - Bocht, 0, Kort + Bocht])
rotate(a=90, v=[0,1,0])
linear_extrude(height=Lang)
//rotate(30,0,0)
circle(r=Maat/2/cos(30),$fn=6);

// Tekst
color ("Yellow") 
translate(v=[-Lang - Bocht + 30, + FontSize/2, Kort + Bocht - Maat/2])
rotate(a=180, v=[1,0,0])
write(TXT,h=FontSize,t=0.8,font="knewave.dxf");
}

module Tussenstuk()
{
color ("Red")
translate([-Bocht,0,Kort])
difference()
{
// Rotate_extruded hexagon
rotate([90,0,0])
rotate_extrude($fn=64)
translate([Bocht,0,0])
//rotate(30,0,0)
circle(r=Maat/2/cos(30),$fn=6);

// Bottom Cube to subtract
translate([0,0,-Bocht])
cube([4*Bocht,2*Maat,2*Bocht],center=true);

// Side Cube to subtract
rotate([0,-90,0])
translate([-1.5*Bocht,-Maat,0])
cube([4*Bocht,2*Maat,2*Bocht],center=false);
}
}

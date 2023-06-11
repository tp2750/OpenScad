// divider
$fa = 1;
$fs = 0.1;

// Length: 116 mm
// dip_width: 3 mm
// dip heigth: 1 mm
// height: 36 mm

module wall(l=116, w=3, h=30, dw=3, dh=1) {
    translate([-Width/2,0,0]){
      cube([w, l, h], center=false);
      translate([0,0,-dh]) cube([dw,l,dh+1]);
    }
}
module foot(l=40, w=5, h=5, ) {
    translate([0,0,h/2])
    rotate([0,0,90]) 
    cube([w, l, h], center=true);
}
// consts
Length = 116;
Height = 30;
Width = 3;
FootExtend = 20;
FootLength = 2*FootExtend + Width;
FootHeight = 5;
FootWidth = 5;
FootPlaceDist = Length / 3;
DipWidth = 3;
DipHeight = 0;
// geometry
wall(Length, Width, Height, DipWidth, DipHeight); // wall
translate([0, FootPlaceDist,0])  
        foot(FootLength, FootWidth, FootHeight); // foot 1
translate([0, 2* FootPlaceDist,0])  
        foot(FootLength, FootWidth, FootHeight); // foot 2


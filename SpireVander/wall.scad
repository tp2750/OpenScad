// divider
$fa = 1;
$fs = 0.1;

// Length: 116 mm
// dip_width: 3 mm
// dip heigth: 1 mm
// height: 36 mm

module wall(l=116, w=3, h=30) {
    translate([-Width/2,0,0]){
      cube([w, l, h], center=false);
    }
}
module foot_flat(l=40, w=5, h=5, ) {
    translate([0,0,h/2])
    rotate([0,0,90]) 
    cube([w, l, h], center=true);
}
module foot1(l=40, w=5, h=5, a=60) {
    //translate([0,0,h/2])
    translate([w/2,0,l*sin(a)+ w*sin(a/2)])
    rotate([90,180-a/2,0]) 
    cube([w, l, h], center=false);
}
module foot(l=40, w=5, h=5, a=60) {
    foot1(l,w,h,a);
    mirror([1,0,0]) foot1(l,w,h,a);
}
// consts
Length = 110;
Height = 30;
Width = 3;
FootExtend = 20; // see calc below
FootLength = FootExtend;
FootHeight = 3;
FootWidth = 3;
FootPlaceDist = Length / 3;
// geometry
wall(Length, Width, Height); // wall
translate([0, FootPlaceDist,0])  
        foot(FootLength, FootWidth, FootHeight, 60); // foot 1
translate([0, 2* FootPlaceDist,0])  
        foot(FootLength, FootWidth, FootHeight, 60); // foot 2

// Length of foot:
// b(l,h) = l*sind(60) # + h/2/cosd(3)
// b is distance from center of wall to center of foot
// center of foot is "floating"
// b(20,3) == 17.32
// This matches distance from center of valley to a top
$fa = 1;
$fs = 0.1;
// OBS: inner should be 8.9 mm. 
// d1/12, t1=1.35 => 9.3, bu apparently still too rarrow
module inner(h1, h2, w1, d1, t1) {
    // h1: cylinder height 14.3
    // h2: dent height 3.25
    // w1: dent weith 3.25
    // d1: diameter (outer) 12
    // t1: wall thickness 1.35
    difference(){
        cylinder(h1+.8, d1/2, d1/2);
        translate([0,0,-5])
            cylinder(h1+10, d1/2-t1, d1/2-t1);
        translate([0,0,h1])
            cube([d1,w1,2*h2], center=true);
        translate([0,0,h1])
            rotate([0,0,90])
            cube([d1,w1,2*h2], center=true);
    }
    p1 = t1/6;
    for (i=[0:3]){
    rotate([0,0,25+90*i])
        translate([d1/2-t1,0,0])
           cylinder(h1-h2,p1,p1);
    }
}

inner(14.3, 3.25, 3.25, 12, 1.35);

module outer(h1=5,h2=15,d1=12,d2=23, t1=1, w1=1.1) {
    // h1: solid height 5
    // h2: total height 15
    // d1: solid diameter 12
    // d2: top diameter 23
    // t1: thickness 1
    // w1: dent width 1.1
    difference(){
    cylinder(h1+1,d1/2,d1/2);  
      translate([0,0,1.5*t1])  
        cylinder(h1*2,d1/2-t1,d1/2-t1);       
    }
    translate([0,0,h1]){
        difference(){
            cylinder(h2-h1,d1/2,d2/2);
            cylinder(h2-h1+1, d1/2-t1, d2/2-t1);
            for (i=[0:7]){
                rotate([0,0,i*45])
                translate([d1/2,-w1/2,w1])
                    cube([(d2-d1)/2,w1,h2-h1+1]);
            }
        }
    }
}

outer();
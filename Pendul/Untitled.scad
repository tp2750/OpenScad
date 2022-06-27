$fa = 1;
$fs = 0.1;

H=100; // length of leg
D=2; // diameter of leg
B=40; // length of top
S=10; // slant of legs
Hp = H*(1-sin(S/H+D/2)); // projected height
R1=5; // Ring diameter
R2=3; // Ring opening
N=3; // Number of rings
H2=20; // height of support

module leg(h1,d1,dx1,dy1) {
    // h1: length in mm
    // d1: diameter in mm
    // dx1: displacement of top in x
    // dy1: displacement of top in y
    rotate(a=[asin(-dy1/h1),asin(dx1/h1),0]){
        cylinder(h=h1, d=d1, center=false);
    }
}
module ring(d1,d2,h1) {
    rotate([90,0,0]){
    difference(){
        cylinder(h=h1, d=d1);
        translate([0,0,-h1]){
            cylinder(h=3*h1, d=d2);
        }
    }
}
}
leg(H,D,S,S); // ben1
translate([B+2*S,0,0]){
    leg(H,D,-S,S); // ben2
}
translate([0,2*S,0]){
    leg(H,D,S,-S); // ben3
    translate([B+2*S,0,0]){
        leg(H,D,-S,-S); // ben4
    }
}
translate([S,S,Hp]){ // Top
    rotate([0,90,0])
    cylinder(h=B,d=D,center=false);
}
translate([S,S+D/2,Hp-R1/2]){ // Rings
    for (i = [1:N]) {
        translate([i*B/(N+1),0,0])
            ring(R1,R2,D);
    }
}
translate([S/H*H2,S/H*H2,H2]){ // Support
    rotate([0,90,0])    
        cylinder(h=B*(1+2*H2/H),d=D);
}
translate([S/H*H2,2*S-S/H*H2,H2]){
    rotate([0,90,0])    
        cylinder(h=B*(1+2*H2/H),d=D);
}
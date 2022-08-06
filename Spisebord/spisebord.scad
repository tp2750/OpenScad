//$fa = 1;
//$fs = 0.1;

r1 = 5; // thin end 3m pole
r2 = 7.5; // think end 3m, thin end 6m
r3 = 10; // thik end 6m pole
d1 = 10; // dig down
s1 = 150; // spread of legs
h1 = 150; // hight of crossing on gavl
m3 = 300; // short pole
m6 = 600; // long pole
hs = 50; // height of seat
ht = 90; // height of table

module lodret() translate([0 ,0,-d1]) cylinder(m3, r2, r1); 
module vandret() rotate([-90,0,0])cylinder(m6, r3, r2); 
module bar() rotate([0,90,0]) cylinder(m3,r2,r1);

module venstre_ben() {
    translate([-s1,0,-d1]) {
        rotate([0,atan(s1/h1),0]) {
            cylinder(m3,r2,r1);
        }
    }    
}
module hojre_ben() {
    translate([s1,0,-d1]) {
        rotate([0,-atan(s1/h1),0]) {
            cylinder(m3,r2,r1);
        }
    }    
}
module gavl(){
    lodret();
    translate([0,r2,0])venstre_ben();
    translate([0,-r2,0])hojre_ben();
}

function seat_x() = s1-s1/h1*hs+ 2*r1;
function top_x() = s1-s1/h1*ht - 4*r1;
module seat(sign=1) {
    translate([sign*seat_x(),-r2,hs]) vandret(); // first seat
    translate([sign*(seat_x()+2*r2),-r2,hs]) vandret(); // second seat    
}
module plade(sign=1) {
    translate([sign*top_x(),-r2,ht]) vandret(); // first top
    translate([sign*(top_x()-2*r2),-r2,ht]) vandret(); // secod top    
}

gavl();
translate([0,m6-2*r2,0]) gavl();
seat();
seat(-1);
plade();
plade(-1);
translate([6*r2,0,0]) plade(); // ydre bordplade
translate([-6*r2,0,0])plade(-1); // ydre bordplade
translate([-m3/2, r1, ht+2*r1])bar(); // vandret bærer
translate([-m3/2, r1, hs+2*r1])bar(); // vandret bærer
translate([-m3/2, m6-2*r1-2*r2, ht+2*r1])bar(); // vandret bærer
translate([-m3/2, m6-2*r1-2*r2, hs+2*r1])bar(); // vandret bærer
translate([2*r1,-r1,m3-d1-r2]) vandret(); // top
translate([0,m6/2,0]) gavl();
translate([-m3/2, m6/2-2*r1, hs+2*r1])bar(); // vandret bærer
translate([-m3/2, m6/2-2*r1, ht+2*r1])bar(); // vandret bærer

translate([-r2,-s1+r2,0])rotate([-atan(s1/(m3-r2)),0,0])lodret(); // support
translate([-r2,m6+s1-2*r2,0])rotate([atan(s1/(m3-r2)),0,0])lodret(); // support
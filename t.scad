module t(x=0,y=0,z=0){
    translate([x,y,z])children();
}
module tx(a){
    translate([a,0,0])children();
}

module ty(a){
    translate([0,a,0])children();
}

module tz(a){
    translate([0,0,a])children();
}

module r(x=0,y=0,z=0){
    rotate([x,y,z])children();
}
module rx(a){
    rotate([a,0,0])children();
}

module ry(a){
    rotate([0,a,0])children();
}

module rz(a){
    rotate([0,0,a])children();
}

module mx(){
    mirror([1,0,0])children();
}

module my(){
    mirror([0,1,0])children();
}

module mz(){
    mirror([0,0,1])children();
}

module cub(x=1,y=1,z=1,c=true,h=true){
    tz(h?(z/2):0)cube([x,y,z],c);
}

module ring(r1,t,h){
    difference(){
        cylinder(r=r1,h=h);
        tz(-.1)cylinder(r=r1-t,h=h+1);
    }
}

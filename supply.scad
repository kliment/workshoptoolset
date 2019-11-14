include <t.scad>

module angle(l){
    cube([10.2,1.2,l]);
    cube([1.2,10.2,l]);
}

module plugmod(e=0){
    color("black"){
    t(-3.5/2)cube([3.5,31,50.2],true);
    t(-3.5/2+4.25+2)cube([5.75,31,48],true);
    t(18/2-e)cube([58,28,48],true);
    }
}


*%t(128,18,26){
    r(90)import("usbcharger/usbcharger.stl");
    for(i=[0:1])t(i*-22.5+13.5,-9,4)color("red",.2)cub(13,15,20);

}
t(157,-17,22)//color("green")
{
%t(-25.3,-34,1.75)r(90)t(-104,80)
    import("baseboard/baseboard-export.stl");
%r(90,0,-90)t(-143,100)import("plugboard/plugboard.stl");
}
//intersection()
*t(){
*t(-120,4,-30)cube(300,200,200);
    union(){
{
$fn=60;
t(-195/2+32,70,12.5)r(90)cylinder(r=1.5,h=20);
t(-195/2+32,70,12.5+25)r(90)cylinder(r=1.5,h=20);
t(-195/2+32+150,70,12.5)r(90)cylinder(r=1.5,h=20);
t(-195/2+32+150,70,12.5+25)r(90)cylinder(r=1.5,h=20);
t(-195/2+32,-70,12.5)r(-90)cylinder(r=1.5,h=20);
t(-195/2+32+150,-70,12.5)r(-90)cylinder(r=1.5,h=20);
t(-195/2+32,25,1.5)r(180)cylinder(r=1.5,h=20);
t(-195/2+32,-25,1.5)r(180)cylinder(r=1.5,h=20);
t(-195/2+32+150,25,1.5)r(180)cylinder(r=1.5,h=20);
t(-195/2+32+150,-25,1.5)r(180)cylinder(r=1.5,h=20);

}
%color("silver"){
    cub(195,113,50);
    t(10)cub(215,113,7);
    t(10,112/2)cub(215,2,50);
    t(10,-112/2)cub(215,2,50);
    t(106.5,11.5-6,7)cub(18,87,16);
}
*%t(130,-21,45)color("green")cylinder(r=39.6/2,h=5);
*#t(128,51,7)color("pink")cub(60,6,43);



*t(158,-55)r(90,0,90){
t(110-15,25,-28)color("black",.5)cub(31,50,30);
}
}
}
t(139)bottom();
*r(180)
t(139)top();
//%t(119,21)cube([10,35,10]);
module top(){difference(){
    union(){
        t(0.5,0,8.25)color("pink")cub(43,113,41.84);
        t(-9.5,0,7.8+38)color("pink")cub(63,113,4.3-0.01);
        t(-14.5,24.5,8.25)color("pink")cub(53,13,41.74);
        t(-14.5,-48,8.25)color("pink")cub(53,13,41.74);
        t(-35.5+16,-58.5,0)color("pink")cub(53+30,4.5,41.74+8.25);
        t(-35.5+16,58.5,0)color("pink")cub(53+30,4.5,41.74+8.25);
    }
    
    t(-39,-53,25)color("grey")r(0,0,0)scale(1.05)angle(100);
    //power module clearance
    t(-25,21)cube([20,35,30]);
    t(-45,16)cube([24,35,25]);
    //usb sockets
    t(-5.5,-1,35)cube([16,18,20]);
    t(-5.5-22.5,-1,35)cube([16,18,20]);
    t(-12.5,11,28)cube([7.5,6,20]);
    //angle holder height reduction
    t(-41.5,-56,7.5)cube([18,15,16]);
    //cpuboard controls
    for(i=[0:2])t(-14.25+i*6.5,-53,50)sphere(r=5,$fn=30);
    t(-14.25-4.25,-49,50)scale([1,1,2])sphere(r=5,$fn=30);
    t(-14.25+20.75,-53,50)sphere(r=6,$fn=30);
    
    //speaker
    t(-9,-23,45.1-0.6)color("green")cylinder(r=41/2,h=5);
    t(-9,-23,45.1)render()for(i=[0:55])
        r(0,0,i*137.5)t(2+(i+5)*0.28)
        cylinder(r=1+(i)*1.6/105,h=6,$fn=10);
    
    //usb board mounting
    t(9,18,28.5)r(-90)cylinder(r=1.6,h=8,$fn=30);
    t(-31,18,30.5)r(-90)cylinder(r=1.6,h=8,$fn=30);
    t(-31,18,45.5)r(-90)cylinder(r=1.6,h=8,$fn=30);
    t(-9,20.9,37)hull(){
        for(i=[-1,1])t(i*16)r(90)cylinder(r=5,h=3);
    }
    t(4.75,20.9,9.5)hull(){
        for(i=[-1,1])t(i*3)r(90)cylinder(r=2,h=3);
    }
    //usb board
    t(-11,17.25,41.5-5)cube([46.5,2,25],true);
    t(17.5,42,25)r(0,0,180)plugmod();
    //plugboard
    t(17.2,-16.5,26)cube([2,79.8,48.2],true);
    //cpuboard
    t(-3,-48.75-3,26)cube([35.5,2,48],true);
    t(-7.5,-48.75-3,26+3)cube([35.5,2,42],true);
    t(-20,-43-3,21)cube([8,12,48],true);
    
    //screen window
    t(-3,-48.75-10,22)cube([27,11,32],true);
    t(-1.8,-54,22)cube([34,17.5,48],true);
    //t(-2.8,-54,26)cube([34,3.8,48],true);
    //connector clearances
    t(-2.8+10,-54,23.5)cube([34,4.5,20],true);
    for(i=[0:3])
    t(15,18-i*15-3,6.5)r(90,0,90)cylinder(r=5.5,h=10);
    t(15,-39.25,6.5)r(90,0,90)cylinder(r=4.5,h=10);
    //solder tails plugboard
    t(14,-17,26)r(0,0,90)hull(){
        for(i=[-1,1])for(j=[-1,1])
            t(i*35,0,j*20)r(90)cylinder(r=2,h=3);
    }
    for(i=[0:3])t(17,-27.75+15*i-3,25.6)hull(){
        r(20)cube([12,8.5,22]);
        ty(-6)cube([12,8.5,22]);
        
    }
    t(18,-12.5-4,15)r(0,0,90)hull(){
        for(i=[-1,1])for(j=[-1,1])
            t(i*38,0,j*21)r(90)cylinder(r=2,h=13);
    }
    
    //speaker mounting holes
    t(-9,-23,42.1)for(i=[0,180])rotate(40+i)t(24)cylinder(r=1.5,h=6,$fn=30);
    
    t(-4-6,-15,7.9)cub(36.75+16,66,38,true);
    t(3,13,7.9)cub(17,10,12,true);
    t(7,-37,7.9)cub(17,20,12,true);
    //psu rails
    t(-38-7,-56.25,26)cube([45.5,2.4,52],true);
    t(-38-7,56.25,26)cube([45.5,2.4,52],true);
    //horizontal bottom mounting bolt
    //#t(-18+36,-46,4)r(90)cylinder(r=1.6,h=15,$fn=30);
    t(-18,46,4)r(-90)cylinder(r=1.6,h=15,$fn=30);
    //vertical bottom mounting bolt
    t(11.5,21,-.1)cylinder(r=1.6,h=15,$fn=30);
    t(11.5,21,-.1)cylinder(r=3.6,h=4,$fn=30);
    //psu mounting bolts
    t(-54.5,-46,12.5)r(90)cylinder(r=2.1,h=15,$fn=30);
    t(-54.5,46,12.5)r(-90)cylinder(r=2.1,h=15,$fn=30);
    t(-54.5,46,12.5+25)r(-90)cylinder(r=2.1,h=15,$fn=30);
    //antenna bolt
    t(-34,-8,50-6.2)cylinder(r=6.4/2,h=6,$fn=6);
    t(-34,-8,50-4)cylinder(r=1.8,h=6,$fn=30);
    //light connector clearance
    t(15,-55.5,29)cube([14,14.7,20]);
}

}

module bottom(){difference(){
    union(){
        t(0,0,0)color("pink")cub(43,111,8);
        t(0,24.5,0)color("pink")cub(43,13,8);
    }
    t(9,18,28.5)r(-90)cylinder(r=1.6,h=8,$fn=30);
    t(-31,18,30.5)r(-90)cylinder(r=1.6,h=8,$fn=30);
    t(-31,18,45.5)r(-90)cylinder(r=1.6,h=8,$fn=30);
    t(-9,20.9,37)hull(){
        for(i=[-1,1])t(i*16)r(90)cylinder(r=5,h=3);
    }
    t(4.75,20.9,9.5)hull(){
        for(i=[-1,1])t(i*3)r(90)cylinder(r=2,h=3);
    }
    t(-.5,17.25,11)cube([24,2,15],true);
    //%t(157,40,25)r(0,0,180)plugmod();
    t(17.5,42,26)r(0,0,180)plugmod(5.5);
    t(17.2,-16.,26)cube([2,79,48],true);
    t(-3,-48.75-3,26)cube([35.5,2,48],true);
    t(-2.5,-51-2.,26)cube([34,3.5,48],true);
    for(i=[0:3])
    t(15,18-i*15-3,6.5)r(90,0,90)cylinder(r=5.5,h=10);
    t(15,-36.25-3,6.5)r(90,0,90)cylinder(r=4.5,h=10);
    t(14,-14,26)r(0,0,90)hull(){
        for(i=[-1,1])for(j=[-1,1])
            t(i*35,0,j*20)r(90)cylinder(r=2,h=3);
    }
    t(-4,-15,8)cube([32,60,12],true);
    t(3,13,8)cube([17,10,12],true);
    t(7,-37,8)cube([17,20,12],true);
    //t(-18-5,-66,4)r(-90)cylinder(r=1.6,h=13,$fn=30);
    t(-18,66,4)r(90)cylinder(r=1.6,h=15,$fn=30);
    t(11.5,21,-.1)cylinder(r=1.6,h=15,$fn=30);
    t(11.5,21,-.1)cylinder(r=3.6,h=3,$fn=30);
    
}

}
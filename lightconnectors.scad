include <t.scad>

$fn=30;

module angle(l){
    cube([10.2,1.2,l]);
    cube([1.2,10.2,l]);
}

module clamp(){
    difference(){
        hull(){
            for(i=[-1,1])tx(i*4)cylinder(r=10,h=30);
            t(-13,-9)cylinder(r=1,h=30);
        }
        #t(-2,-3,5)angle(40);
        #t(-2-1.2,-3-1.2,-0.1)angle(25.1);
        #t(-8,9,15)rotate([90,0,0])bolt();
        t(-8,-3.5,15)rotate([90,0,0])cylinder(r=5.5/2,h=7);
        
        t(-22,-4,-.1)cube([30,1,41]);
    }
}
module bolt(){
    color("grey"){
        cylinder(r=7.5/2,h=3);
        cylinder(r=4/2,h=23);
    }
    color("red")tz(-2)cylinder(r=7/2,h=3);
        
}

module hubbase(){
    difference(){
        tz(5.5)cube([60,60,11],true);
        for(x=[-1,1])for(y=[-1,1])
            t(x*35,y*35,-.1)cylinder(r=29,h=13);
        for(a=[0,90,180,270])
            rotate(a)t(10,-5,11.5)rotate([0,90,0])angle(60);
        t(-5,-5,3)angle(60);
        rotate(45)t(4,-1.5,-.1)cube([50,3,13]);
        t(3,3)tz(-.1)cylinder(r=5,h=13);
        for(i=[1,-1])t(i*10,-i*10,-.1)
            cylinder(r=5/2,h=12.2);
    }
    
}
module hubtop(){
    difference(){
        tz(1.5)cube([60,60,3],true);
        for(x=[-1,1])for(y=[-1,1])
            t(x*35,y*35,-.1)cylinder(r=29,h=13);
        for(a=[0,90,180,270])
            rotate(a)t(10,-5,.5)rotate([0,90,0])angle(60);
        t(-5,-5,-3)scale(1.2)angle(60);
        rotate(45)t(4,-1.5,-.1)cube([50,3,13]);
        t(3,3)tz(-.1)cylinder(r=5,h=13);
        for(i=[1,-1])t(i*10,-i*10,-.1)
            cylinder(r=4/2,h=12.2);
        *for(i=[1,-1])t(i*10,-i*10,5)
            %mirror([0,0,1])bolt();
    }
    
}

module gripbase(){
    difference(){
        union(){
            tz(4)cube([60,60,8],true);
            tz(-10)cube([20,20,21],true);
        }
        for(x=[-1,1])for(y=[-1,1])
            t(x*35,y*35,-.1)cylinder(r=29,h=13);
        t(-5,-5,3)angle(60);
        for(x=[-1,1])for(y=[-1,1])
            t(39.5*x,39.5*y,1.25)#ring(38,1.5,6);

    }
    
}

module gripmid(){
    difference(){
        tz(4)cube([60,60,8],true);
        for(x=[-1,1])for(y=[-1,1])
            t(x*35,y*35,-.1)cylinder(r=29,h=13);
        for(x=[-1,1])for(y=[-1,1])
            t(39.5*x,39.5*y,1.25)#ring(38,1.5,6);

        t(-5,-5,-3)scale(1.02)angle(60);
    }
    
}
%t(-5,-5,3)angle(360);
        
*tz(100)r(180)gripmid();

//for(i=[0:1])for(j=[0:3])t(i*30,j*25)clamp()
//r(180)tz(20)gripbase();
//rz(-36)for(i=[0:2])for(j=[0:1])
//t(i*40-j*32,j*40+i*32,0)
//hubbase();
//tz(11.5)
//*tz(3)rotate([180,0,0])
hubtop();

%for(x=[-1,1])for(y=[-1,1])t(x*38.5,y*38.5)cylinder(r=67.5/2,h=258);
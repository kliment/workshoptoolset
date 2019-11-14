module r(x=0,y=0,z=0){
    rotate([x,y,z])children();
}

module t(x=0,y=0,z=0){
    translate([x,y,z])children();
}

$fn=90;

module lightboard(){
    difference(){
            hull(){
                circle(r=30/2);
                for(i=[-1,1])
                    t(i*(15-4),15-4)circle(r=4);
            }
            t(0,15+6)circle(r=9);
            circle(r=20.6/2);
            t(-6,6)circle(r=7/2);
            t(0,-17.5)circle(r=7/2);
     }
}

*lightboard();

module iron(){
    cylinder(r1=1,r2=2,h=10);
    t(z=10)cylinder(r=2,h=1.65);
    t(z=10+1.56)cylinder(r=5.6/2,h=33);
    t(z=10+1.56+33)cylinder(r=4,h=19);
    t(z=10+1.56+33+19)cylinder(r=13/2,h=7);
    t(z=10+1.56+33+19+7)cylinder(r=11/2,h=3);
    t(z=10+1.56+33+19+7+3)cylinder(r=17/2,h=3.5);
    t(z=10+1.56+33+19+7+3+3.5)
        cylinder(r1=17/2,r2=19.5/2,h=2);
    t(z=10+1.56+33+19+7+3+3.5+2)
        cylinder(r1=19.5/2,r2=21/2,h=9.6);
    t(z=10+1.56+33+19+7+3+3.5+2+9.6){
        cylinder(r=22.8/2,h=4);
        color("red")linear_extrude(1.2)lightboard();
    }
    t(z=10+1.56+33+19+7+3+3.5+2+9.6+4)
        cylinder(r1=22.8/2,r2=17/2,h=2.5);
    t(z=10+1.56+33+19+7+3+3.5+2+9.6+4+2.5)
        cylinder(r1=17/2,r2=16.6/2,h=36);
    t(z=10+1.56+33+19+7+3+3.5+2+9.6+4+2.5+36)
        cylinder(r1=14.5/2,r2=13/2,h=64);
}

module restingiron(){
r(-4.5)t(0,-90,15)r(-90)iron();
}

module standingiron(){
t(z=30)r(26)t(0,-90,15)r(-90)iron();
}


//%t(-105)cube([150,110,2],true);
//t(-70)linear_extrude(1.2)
*t(){
intersection(){
    union(){
    t()standwall();
    t(40)mirror()mirror([0,1,0])standwall();
    t(-14.5,27.5-5)r(z=180)standgrip();
    t(-14.5,-29.5+5)standtop();
    t(-20,0)standbase();
    h=5;
    }
    t(-34.5)square([149,90],true);
}
t(-9.5,47.5)square([99,4.5],true);
t(-9.5,-47.5)square([99,4.5],true);
}
*t(){
%t(0,45)standingiron();

for(i=[-1,1])t(i*15)r(0,-90)linear_extrude(1.2)mirror([0,0,i-1])standwall();
t(-.75,-25,16)r(16){
    linear_extrude(1.2)standtop();
 
 }
t(-.75,28.7,24)r(90+26)r(y=180)linear_extrude(1.2)standgrip();
t(23,0,-1.2)linear_extrude(1.2)standbase();
}
module matedpart(){
    color("black")cube([10.35,8.45,2.5],true);
    for(i=[-3,-1,1,3])t(i*1.27,1)cube([.3,13,.3],true);
    t(0,8.45/2+2.5/2-10.76,2.75){
        color("black")cube([10.35,2.5,3],true);
        for(i=[-3,-1,1,3])t(i*1.27,0,1)cube([.3,.3,7.3],true);
    
    }
    
}


module standbase(){
    difference(){
        t(-24)square([30,100],true);
        for(j=[-1,1])for(k=[-1,1])
        t(k*10-23,j*27,5.75)r(0,0,90){
            %r(y=180)mirror([0,k-1,0])r(90)matedpart();
            for(i=[-3,-1,1,3])t(i*1.27,0)circle(r=.35);
        }
    }
}

module standtop(){
    difference(){
        t(0,-3)square([28,35],true);
        t(0,9)hull(){
            circle(r=2.5);
            t(0,5)circle(r=5);
        }
        t(10,2,5)r(0,0,90){
            %r(180)matedpart();
            for(i=[-3,-1,1,3])t(i*1.27,5.25)circle(r=.35);
        }
        t(-10,2,5)r(0,0,-90){
            %r(180)matedpart();
            for(i=[-3,-1,1,3])t(i*1.27,5.25)circle(r=.35);
        }
    }
}

module standgrip(){
    difference(){
        t(0,-3)square([28,39],true);
        t(0,11)hull(){
            circle(r=4.5);
            t(0,7)circle(r=8);
        }
        t(10,-17,5)r(0,0,90){
            %r(180)matedpart();
            for(i=[-3,-1,1,3])t(i*1.27,5.25)circle(r=.35);
        }
        t(-10,-17,5)r(0,0,-90){
            %r(180)matedpart();
            for(i=[-3,-1,1,3])t(i*1.27,5.25)circle(r=.35);
        }
    }
}


module standwall(){ 
    //for(i=[1,0])t(x=i*40)mirror([i,0,0])mirror([0,i,0])mirror([0,0,i])
    difference(){
    t(y=-50){
        
        hull(){
            square([1,100]);   
            t(16,99)square([1,1]);   
            t(12,100-5)circle(5);
            
        }
        hull(){
            square([6,100]);   
            t(5+14,21+6)circle(5);
            t(10,11)circle(5);
        }
        
    }
    t(21.35,-24.5,5.75)r(0,0,-90-16){
            %r(y=180)r(90)matedpart();
            for(i=[-3,-1,1,3])t(i*1.27,0)circle(r=.35);
        }
    
    t(10.85,40.75,5.75)r(0,0,-26){
            %r(y=180)r(90)matedpart();
            for(i=[-3,-1,1,3])t(i*1.27,0)circle(r=.35);
        }
     for(i=[-1,1])t(5.5-1.1,i*27,5)r(0,0,-90){
            %r(180)matedpart();
            for(i=[-3,-1,1,3])t(i*1.27,5.25)circle(r=.35);
        }
        
    }

}

%restingiron();
*lightboard();


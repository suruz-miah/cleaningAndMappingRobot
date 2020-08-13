$fs=0.4;
$fa=0.1;
$fn=100;

module disinfectingRobot() {
    // motors
    translate([4,0,-1])
        cube([5,2,1],center=true);
    translate([-4,0,-1])
        cube([5,2,1],center=true);


    // wheels
    translate([8,0,-1])
        rotate([0,90,0])
        cylinder(r=5,h=1,center=true);
    translate([-8,0,-1])
        rotate([0,90,0])
        cylinder(r=5,h=1,center=true);
    difference() {
        cylinder(r=10,h=1,center=true);
        translate([8,0,0])
            cube([1.2,10.1,2],center=true);
        translate([-8,0,0])
            cube([1.2,10.1,2],center=true);
    }    

    // axles
    rotate([0,90,0])
        translate([1,0,-6])
        cylinder(r=0.5,h=5,center=true);
    rotate([0,90,0])
        translate([1,0,6])
        cylinder(r=0.5,h=5,center=true);

    // caster ball
    translate([0,8,-5])
        sphere(r=1);
    translate([0,8,-2.5])
        cylinder(r=1.2,h=5,center=true);

    translate([-6,-6,5])
        cylinder(r=1,h=10,center=true);
    translate([6,-6,5])
        cylinder(r=1,h=10,center=true);
    translate([-6,6,5])
        cylinder(r=1,h=10,center=true);
    translate([6,6,5])
        cylinder(r=1,h=10,center=true);
    translate([0,0,10])
        cylinder(r=10,h=1,center=true);

    /**
    Beaglebone board
    **/
    
    // standoffs
    translate([1.25,1.75,0.75])
        cylinder(r=0.11,h=0.5,center=true);
    translate([-1.25,1.75,0.75])
        cylinder(r=0.11,h=0.5,center=true);
    translate([1.25,-1.75,0.75])
        cylinder(r=0.11,h=0.5,center=true);
    translate([-1.25,-1.75,0.75])
        cylinder(r=0.11,h=0.5,center=true);
    
    // board
    translate([0,0,0.85])
        color("black")
        cube([3,4,0.1],center=true); 
    
    // UV light
    difference() {
        translate([0,0,11])
            cylinder(r=3,h=1,center=true);
        translate([0,0,11])
            cylinder(r=2,h=3,center=true);
    }
    
    difference() {
        translate([0,0,12])
            cylinder(r=2.5,h=1,center=true);
        translate([0,0,12])
            cylinder(r=2,h=5,center=true);
    }

    difference() {
        translate([0,0,13])
            cylinder(r=3,h=1,center=true);
        translate([0,0,13])
            cube([0.5,0.5,3],center=true);
    }
    
    translate([1,1,13])
        cylinder(r=1,h=10,center=true);
}
disinfectingRobot();
    
use <MCAD/involute_gears.scad>

$fn=150;

module wheel() {
    color("black") translate([0,0,5]) rotate_extrude($fn=200) translate([52,0,0]) circle(d=10);

    difference() {
        union() {
            cylinder(d=25, h=10);
            difference() {
                rotate_extrude($fn=200) polygon( points=[[0,0],[50,0],[50,2],[48,4],[48,6],[50,8],[50,10],[0,10]] );
                translate([0,0,3]) gear (
                        number_of_teeth = 135,
                        circular_pitch=100,
                        bore_diameter=0,
                        gear_thickness=20    
                 );
            }
        }
        cylinder(d=5,h=12);
    };

  color("red") translate([30,10,5]) union() {
    gear(
        number_of_teeth=8,
        circular_pitch=100,
        hub_diameter=4
    );
    cylinder(d=4,h=20);
    translate([0,0,10]) cylinder(d=20,h=30);
  }
    
}

translate([40,0,0]) rotate([180,90,0]) wheel();
translate([-40,0,0]) rotate([0,90,0]) wheel();

color("silver") rotate([0,90,0]) cylinder(d=3,h=100,center=true);

difference() {
    sphere(d=150);
    sphere(d=144);
    translate([0,0,75]) cube([150,150,150], center=true);
    translate([0,0,-115]) cube([150,150,150], center=true);
}

intersection() {
    difference() {
        sphere(d=150);
        translate([0,0,75]) cube([150,150,150], center=true);
        translate([0,0,-115]) cube([150,150,150], center=true);
    }
    union() {
        translate([60,0,0]) rotate([0,90,0]) cylinder(d=10,h=30,center=true);
        translate([-60,0,0]) rotate([0,90,0]) cylinder(d=10,h=30,center=true);
        
        translate([45,0,0]) cube([2,150,150], center=true);
        translate([-45,0,0]) cube([2,150,150], center=true);
        translate([25,0,0]) cube([2,150,150], center=true);
        translate([-25,0,0]) cube([2,150,150], center=true);
        
        translate([60,0,0]) cube([30,2,150], center=true);
        translate([-60,0,0]) cube([30,2,150], center=true);
        translate([0,0,-40]) cube([50,150,2], center=true);
    }
}


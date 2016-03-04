// Totally phoney model with made up numbers.
// OpenSCAD rocks, though.

$fn=33;

// XXX shell cutouts should come from minikowski sum of the components and a small sphere (I think) but this doesn't perform well on my laptop :-/
// TODO define "motor_cutout" and "main_board_cutout" modules which represent this negative space around components.

// PCB and components

module motor (motor_d, motor_l, axle_d, axle_l, wheel_d, wheel_l) {
        
    color("blue") translate([0,0,motor_l/2-axle_l/2]) cylinder(d=motor_d, h=motor_l, center=true);
    color("silver") translate([0,0,0]) cylinder(d=axle_d, h=axle_l, center=true);
    translate([0,0,axle_l/2-wheel_l/2]) {
        color("white") cylinder(d=wheel_d/2, h=wheel_l-1, center=true);
        color("black") difference() {
            cylinder(d=wheel_d, h=wheel_l, center=true);
            cylinder(d=wheel_d/2, h=wheel_l+1, center=true);
        }
    }
}

module main_board() {
    color("red") cube([34,34,2], center=true);

    translate([0,14,-4]) rotate([90,90,180]) motor(6,12,2,18,16,5);
    translate([0,-14,-4]) rotate([90,90,0]) motor(6,12,2,18,16,5);

    color("silver") translate([21,0,5]) rotate([0,90,0]) cylinder(d=8, h=8, center=true);
    color("gold") translate([-10,0,2]) cube([22,13,2], center=true);
}
 

module lower_shell() {
    difference() {
        sphere(d=50);
        translate([0,0,25]) cube([50,50,50], center=true);
        translate([0,0,-33]) cube([50,50,50], center=true);
        translate([0,22,-4]) rotate([90,0,0]) cylinder(d=18, h=20, center=true);
        translate([0,-22,-4]) rotate([90,0,0]) cylinder(d=18, h=20, center=true);
        cube([35,35,3], center=true);
        cube([33,33,10], center=true);
        translate([12,0,0]) cylinder(d=4, h=20, center=true);
        translate([12,5,0]) cylinder(d=4, h=20, center=true);
        translate([12,-5,0]) cylinder(d=4, h=20, center=true);
        
        translate([19,0,-8.5]) cylinder(d=6, h=2, center=true);
        translate([-19,0,-8.5]) cylinder(d=6, h=2, center=true);
    }
}

module upper_shell() {
    difference() {
        sphere(d=50);
        intersection() {
            sphere(d=46);
            cube([33,33,50], center=true);
        }
        cube([35,35,3], center=true);
        
        translate([0, 0, -25]) cube(size=50, center=true);
        translate([50,0,5]) rotate([0,90,0]) cylinder(d=9, h=100, center=true);
        translate([0,0,-4]) rotate([90,0,0]) cylinder(d=18, h=100, center=true);
    }
}

main_board();
translate([0,0,-20]) lower_shell();
translate([0,0,20]) upper_shell();


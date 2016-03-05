// Totally phoney model with made up numbers.
// OpenSCAD rocks, though.

sphere_dia = 50;
sphere_thi = 4;
board_siz = 32;
board_thi = 1;

motor_dia = 6;
motor_len = 12;
axle_dia = 2;
axle_len = 18;
wheel_dia = 16;
wheel_wid = 5;
wheel_clr = 2;
ground_clr = 2;

motor_off = sphere_dia - (axle_len * 2);

// PCB and components

module motor_model () {
    color("blue") translate([0,0,motor_len/2-axle_len/2]) cylinder(d=motor_dia, h=motor_len, center=true);
    color("silver") translate([0,0,0]) cylinder(d=axle_dia, h=axle_len, center=true);
    translate([0,0,axle_len/2-wheel_wid/2]) {
        color("white") cylinder(d=wheel_dia/2, h=wheel_wid-1, center=true);
        color("black") difference() {
            cylinder(d=wheel_dia, h=wheel_wid, center=true);
            cylinder(d=wheel_dia/2, h=wheel_wid+1, center=true);
        }
    }
}

module motor_clear() {
    cylinder(d=motor_dia, h=axle_len+2, center=true);
    translate([-motor_dia/2,0,motor_len/2-axle_len/2]) cube([motor_dia, motor_dia, motor_len+2], center=true);
    translate([0,0,motor_len/2-axle_len/2]) cube([motor_dia+5, motor_dia+5, motor_len-5], center=true);
    translate([wheel_dia/4+wheel_clr/2,0,axle_len/2-1]) cube([wheel_dia/2+wheel_clr, wheel_dia+wheel_clr*2, wheel_wid*2], center=true);
    translate([0,0,axle_len/2-1]) cylinder(d=wheel_dia+wheel_clr*2, h=wheel_wid*2, center=true);
}

module motors_model() {
    translate([0,motor_off,-motor_dia/2-1]) rotate([90,90,180]) motor_model();
    translate([0,-motor_off,-motor_dia/2-1]) rotate([90,90,0]) motor_model();
}

module motors_clear() {
    translate([0,motor_off,-motor_dia/2-1]) rotate([90,90,180]) motor_clear();
    translate([0,-motor_off,-motor_dia/2-1]) rotate([90,90,0]) motor_clear();
}

module screw_model() {
    color("silver") translate([6,0,5]) cylinder(d=1.5, h=30, center=true);
    translate([6,0,-9.5]) cylinder(d=4, h=1, center=true);
}

module screw_clear() {
    translate([6,0,0]) cylinder(d=2, h=sphere_dia/2, center=true);
    translate([6,0,-10]) cylinder(d=5,h=1,center=true);
}

module board_model() {
    difference() {
        color("red") cube([board_siz,board_siz,board_thi], center=true);
        screw_clear();
    }
    color("silver") translate([21,0,5]) rotate([0,90,0]) cylinder(d=8, h=8, center=true);
    color("gold") translate([-10,0,2]) cube([22,13,2], center=true);
}
 
module board_clear() {
    cube([board_siz+2,board_siz+2,board_thi+1], center=true);
    cube([board_siz-4,board_siz-5,board_thi+4], center=true);
    translate([21,0,5]) rotate([0,90,0]) cylinder(d=10,h=12,center=true);
    translate([-10,0,2]) cube([24,15,5], center=true);    
}

module lower_shell() {
    difference() {
        sphere(d=sphere_dia);
        translate([0,0,25]) cube([50,50,50], center=true);
        translate([0,0,-35]) cube([50,50,50], center=true);
        board_clear();
        motors_clear();
        screw_clear();
        translate([12,0,0]) cylinder(d=4, h=25, center=true);
        translate([12,5,0]) cylinder(d=4, h=25, center=true);
        translate([12,-5,0]) cylinder(d=4, h=25, center=true);
        
        translate([-19,0,-10.5]) cylinder(d=6, h=2, center=true);
        translate([19,0,-10.5]) cylinder(d=6, h=2, center=true);
    }
}

module upper_shell() {
    difference() {
        sphere(d=sphere_dia);
        intersection() {
            sphere(d=sphere_dia-sphere_thi*2);
            cube([32,32,50], center=true);
             
        }
        translate([0, 0, -sphere_dia/2]) cube(size=sphere_dia, center=true);
        motors_clear();
        board_clear();
    }
}

motors_model();
board_model();
screw_model();
upper_shell();
lower_shell();
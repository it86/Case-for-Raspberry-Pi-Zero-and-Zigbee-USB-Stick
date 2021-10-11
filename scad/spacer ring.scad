eps = 0.001;

difference() {
    cylinder(d=10, h=2.5, $fn=50);
    translate([0, 0, -eps]) {
        cylinder(d=6.7, h=2.5 + 2*eps, $fn=50);
    }
}
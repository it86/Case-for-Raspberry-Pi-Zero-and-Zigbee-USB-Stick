eps = 0.001;

difference() {
    // Grundform des Deckels
    translate([0,0,7]) {
        difference() {
            minkowski() {
              cube([58, 50, 22]);
              sphere(r=7, $fn=50);
            }
            
            minkowski() {
              cube([58, 50, 22]);
              sphere(r=5, $fn=50);
            }
            
            translate([-10, -10, 2]) {
                cube([80, 80, 30]);
            }
            
            translate([0, 0, 1]) {
                minkowski() {
                    cube([58, 50, 2]);
                    cylinder(r=6.1, h=2, $fn=50);
                }
                
                translate([-7 - eps, 40, 0]) {
                    cube([1 + 2*eps, 6, 1 + eps]);
                }
                
                translate([64 - eps, 40, 0]) {
                    cube([1 + 2*eps, 6, 1 + eps]);
                }
            }
        }
    }

    // Luftschlitze über den Raspberry Pi Zero
    translate([5,2,0]) {
        for ( a = [0:3:20] ) {
            translate([0, a, 0]) {
                minkowski() {
                    cube([48, eps, 2]);
                    cylinder(d=1, h=1, $fn=50);
                }
            }
        }
    }
}
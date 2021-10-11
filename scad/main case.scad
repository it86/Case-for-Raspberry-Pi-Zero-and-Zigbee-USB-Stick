eps = 0.001;

difference() {
    union() {
        // unterer Teil
        difference() {
            union() {
                minkowski() {
                  cube([58, 50, 23]);
                  cylinder(r=7, h=2, $fn=50);
                }
                
                // Umrandung
                difference() {
                    minkowski() {
                        cube([58, 50, 3.8]);
                        cylinder(r=8.6, h=1, $fn=50);
                    }
                    
                    translate([-9 - eps, -9 - eps, -eps]) {
                        cube([76 + 2*eps, 2*9 + eps, 5 + 2*eps]);
                    }
                }
            }
            
            // RJ45 Anschluss
            translate([40, 23 + 4.98, 8]) 
               cube([14, 2.02, 13]); 
            
            translate([37, 30 - eps, -eps]) {
               cube([20, 100, 23]);  
            }
        }
        
        // oberer Teil
        translate([0,0,25]) {
            difference() {
                minkowski() {
                  cube([58, 50, 13]);
                  cylinder(r=7, h=2, $fn=50);
                }
                
                translate([0,0,-eps]) {
                    minkowski() {
                      cube([58, 50, 13+2*eps]);
                      cylinder(r=5, h=2, $fn=50);
                    }
                }
                
                // Falz für den Deckel
                translate([0, 0, 14]) {
                    difference() {
                        minkowski() {
                            cube([58, 50, 1]);
                            cylinder(r=7 + eps, h=2, $fn=50);
                        }
                        
                        minkowski() {
                            cube([58, 50, 1]);
                            cylinder(r=5.9, h=2, $fn=50);
                        }
                    }
                    
                    translate([-7, 40, 0]) {
                        cube([2 + eps, 6, 1 + eps]);
                    }
                    
                    translate([58 + 5 - eps, 40, 0]) {
                        cube([2 + eps, 6, 1 + eps]);
                    }
                }
                
                // Ausschnitt SD-Karte
                translate([63 - eps, 2.6, 11]) {
                    cube([2 + 2* eps, 14, 4 + eps]);
                }
                
                // Ausschnitt Antenne
                translate([-7 - eps, 43, 3.5 + 1.5]) {
                    rotate([0,90,0]) {
                        cylinder(d=7,h=2+2*eps, $fn=50);
                    }
                    translate([+1+2*eps, -3.5, -3.5]) {
                        cube([1+2*eps, 7, 7]);
                    }
                }
            }
        
            // Halterung USB-Anschluss
            translate([52, 43, 0]) {
                difference() {
                    translate([0, -11, 0]) {
                        union() {
                            translate([0,-10,0]) {
                            cube([10, 32, 8.5]);
                            }
                            
                            translate([10,-10,0]) {
                                cube([1.1, 31, 8.5]);
                            }
                            
                            translate([0,22,0]) {
                                cube([9, 1, 8.5]);
                            }
                        }
                    }
                    
                    translate([-eps, -6.4, 3.5]) {
                        cube([9, 12.8, 20]);
                    }
                }
            }
        }
    }
    
    // Raspberry Pi Zero
    translate([0, 0, 3]) {
        minkowski() {
          cube([58, 23, 50]);
          cylinder(r=5, h=2, $fn=50);
        }
    }
        
    // Bohrungen für die Schrauben des Raspberry Pi Zero
    for(i=[0,58]) {
        for(j=[0,23]) {
            translate([i,j,-eps]) {
                cylinder(d=3, h=3 + 2 * eps, $fn=50);
                cylinder(d=6, h=1.8 + eps, $fn=50);
            }
        }
    }
}
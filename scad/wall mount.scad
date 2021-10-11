eps = 0.001;

case_width = 72.2;
case_depth = 64.2;
case_radius = 7.1;

bottom_height = 5;

border_height = 12;
border_thickness = 5;


difference() {
    translate([case_radius - case_width / 2,
               case_radius - case_depth / 2,
               0]) {
        difference() {
            Case(case_width + 2 * border_thickness,
                 case_depth + 2 * border_thickness,
                 border_height + bottom_height,
                 case_radius + border_thickness);
            
            // Innere ausschneiden
            translate([0, 0, bottom_height]) {
                Case(case_width,
                     case_depth,
                     border_height + eps,
                     case_radius);
            }
            
            // Führungsschine
            translate([0, 0, bottom_height]) {
                Case(case_width + 2 * 2,
                     case_depth + 2 * 2,
                     5,
                     case_radius + 2);
            }
            
            // Ausschnitt Netzwerkkabel
            translate([1.1, -case_radius - border_thickness - eps, bottom_height]) {
                cube([20, 2*border_thickness, border_height + eps]);
            }
            
            // oberen Rand abschneiden
            translate([0, 0, bottom_height]) {
                translate([-border_thickness - case_radius - eps,
                           case_depth - (2 + 1) *case_radius, 0]) {
                    cube([case_width + 2 * border_thickness + 2 * eps,
                          case_depth,
                          border_height + eps]);
                }
            }
        }
    }
    
    // Schraubenlöcher
    for(a = [-22.5, 22.5]) {
        translate([a, 0, -eps]) {
            cylinder(d=3.5, h=bottom_height + 2*eps, $fn=50);
        }
        
        translate([a, 0, bottom_height + eps]) {
            rotate([180,0,0]) {
                cylinder(d1=7, d2=3.5, h=3, $fn=50);
            }
        }
    }
}

module Case(width, depth, height, radius) {
    cube_width  = width - 2 * radius;
    cube_depth  = depth - 2 * radius;
    cube_height = height - 1;
    
    difference() {
        minkowski() {
            cube([cube_width, cube_depth, cube_height]);
            cylinder(r=radius, h=1, $fn=50);
        }
    }    
}
include <screw_holes.scad>

// original device dimensions: 63w x 105l x24h mm
// new device 6.5 x 3.1 x 0.79 inches = 79w x 166l x 21h

// deviceDimensions = [79, 166, 21];
// [width, length, height]
deviceDimensions = [79, 166, 21];

// Draw a cube to replicate the device we're making this for
testFit = false;

// we don't want it too tight
tolerance = 1.5;

// Thickness of side walls
wallThickness = 2;

// Thickness of the bottom
baseThickness = 3;

// Thickness of interior bottom spacer
spacerThickness = 2;

innerX = deviceDimensions[0] + tolerance;
outerX = innerX + 2*wallThickness;

innerY = deviceDimensions[1] + tolerance;
outerY = innerY + 2*wallThickness;

innerZ = deviceDimensions[2] * 1.0;
outerZ = innerZ + baseThickness + spacerThickness + tolerance;

// Number of holes on each long side
sideHoles = 5;
holeY =(innerY / sideHoles) * 0.25;

// How many bottom slots?
slots = 5;

// Add a screw hole in the bottom center?
addHole = true;

module shell() {
    difference() {
        color("gray")
        cube([outerX, outerY, outerZ]);

        // hollow out the shape
        color("white")
        translate([wallThickness, wallThickness, baseThickness])
        cube([innerX, innerY, innerZ * 2]);

        // remove front wall, except for small lip to hold in place
        lip = 1;
        translate([wallThickness + lip, 0, baseThickness])
        cube([innerX - 2*lip, wallThickness, outerZ]);
    }
}

module side_holes() {
    for (h=[0:sideHoles-1]) {
        translate([0, 2*holeY + (4* holeY * h), (innerZ * 0.125) + baseThickness ])
        cube([wallThickness, holeY, innerZ * 0.75]);

        translate([wallThickness + innerX, 2*holeY + (4* holeY * h), (innerZ * 0.125) + baseThickness ])
        cube([wallThickness, holeY, innerZ * 0.75]);
    }
}

module back_holes() {
    // 2 is probably good
    translate([outerX / 4, innerY + wallThickness, (innerZ * 0.125) + baseThickness])
    cube([holeY, wallThickness, innerZ * 0.75]);

    translate([outerX - (outerX / 4) - holeY, innerY + wallThickness, (innerZ * 0.125) + baseThickness])
    cube([holeY, wallThickness, innerZ * 0.75]);
}

module bottom_slots() {
    slotWidth = 0.75 * innerX;
    slotDepth = 5;
    startX = (outerX - slotWidth) / 2;
    ySep = 13;

    for (slots=[1:slots])
    {
        translate([startX, outerY/2 - (slots * ySep  ), 0])
        cube([slotWidth, slotDepth, baseThickness]);

        translate([startX, outerY/2 + (slots * ySep ) - slotDepth, 0])
        cube([slotWidth, slotDepth, baseThickness]);
    }
}

module add_inner_feet() {
    footWidth = 2;

    color("purple")
    {
        // left
        translate([2*wallThickness, wallThickness, baseThickness - 0.001])
        cube([footWidth, innerY, spacerThickness]);

        // right
        translate([outerX - 2*wallThickness - footWidth, wallThickness, baseThickness - 0.001])
        cube([footWidth, innerY, spacerThickness]);
    }
}

module attachmentHole() {
    // raise up bit more so our countersink isn't so deep
    translate([outerX/2, outerY/2, baseThickness + 0.5])
    rotate([180,0,0])
    screw_hole([8, 1.7, 90], M4, 30);
}

difference() 
{
    shell();
    side_holes();
    back_holes();
    bottom_slots();
    if (addHole) {
        attachmentHole();
    }
}

// add feet inside to lift off bottom
add_inner_feet();

// Draw our center lines for reference
if (false) {
    color("red")
    translate([outerX/2, outerY/2, baseThickness])
    cube([outerX, 1, 2], center=true);

    color("red")
    translate([outerX/2, outerY/2, baseThickness])
    cube([1, outerY, 2], center=true);
}

// test device to visualize
if (testFit) {
    translate([wallThickness + tolerance/2, wallThickness + tolerance/2, baseThickness + spacerThickness])
    color("ivory")
    cube(deviceDimensions, center=false);
}

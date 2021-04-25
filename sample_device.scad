// creates a shape to approximate the device to hold
// not solid, just outline of rectangle with 1 inner
// support to keep it square

// device dimensions
// width
w = 63;
// length
l = 105;
// height
h = 24;

// How thick to make the walls
wallThickness = 1;

difference() {
    cube([w, l, h], center=false);
    translate([wallThickness, wallThickness, 0])
    cube([ (w-2*wallThickness), (l-2*wallThickness), h]);
}

// draw center line for strength
color("red")
translate([0, l/2, 0])
cube([w, wallThickness, h/2]);
// set full-on red color color to the var 'red'
color red = color(255, 0, 0);
// set full-on green color to the var 'green'
color green = color(0, 255, 0);

void setup(){
  // we don't need much here just the size
  size(400, 400);
}

void draw(){
  // the first half of the gradient is between the left edge and the mouseX position
  // so we start at 0 and count to the mouseX
  for(int i = 0; i < mouseX; i++){
    // since this is the first half, we map the 'i' value to the range from 0 to 0.5
    color thisColor = lerpColor(red, green, map(i, 0, mouseX, 0, 0.5));
    // make a horizontal line of this color
    stroke(thisColor);
    line(i, 100, i, 300);
  }
  
  // the second half of our gradient is between the mouseX position and the right edge
  // so we start at the mouseX position and count to the full width
  for(int i = mouseX; i < width; i++){
    // since this is the second half, we map the 'i' value to the range from 0.5 to 1
    color thisColor = lerpColor(red, green, map(i, mouseX, width, 0.5, 1));
    // make a horizontal line of this color
    stroke(thisColor);
    line(i, 100, i, 300);
  }
}
//the number of vertical sections on the screen
int verticalLines = 10;
//the number of the horizontal sections on the screen
int horizontalLines = 8;
// starting point fot the rotation angle - in radians
float angle = 0.0;

void setup(){
  size(800, 600);
}

void draw(){
  // push the current default matrix onto the memory stack
  pushMatrix();
  // move the zero point to the upper left corner
  translate(width/3, height/3);
  //update the rotation angle. Use fractions of PI for the set patterns and decimal points for shifting patterns
  angle = angle - PI/3;
  // print the radian value of the rotation angle
  println(angle);
  // perform the rotation
  rotate(angle);
  // draw a grid on the moved and rotated matrix
  picklesAndSteroids(color(255, 0, 0), color(0, 255, 0));
  // pop the default matrix back from the top of the memory stack to the window
  popMatrix();
  // move the matrix again - this time to the center of the screen
  translate(width/2, height/2);
  // rotate to the new radian value again
  rotate(angle);
  // draw another grid - this time with different colors
  picklesAndSteroids(color(0, 0, 255), color(255, 0, 255));

}

// make a new function to draw a grid of lines
// it can be called anything, like picklesAndSteroids
// but it's much better to use meaningful name like drawAGrid()
// like a lot of functions it accepts values, called arguments
// they can also be called anything, but should have meaningful names
// instead of love the first one could be horizontalColor and
// the second one could be verticalColor
// when a function is called in the code the first value will be
// applied as the first argument, the second - as the second argument and so on
void picklesAndSteroids(color love, color peace){
  for(int x = 0; x < width/2; x+=width/2/horizontalLines ){
    stroke(love);
    line(x, 0, x, height/2);
  }
  
  for(int y = 0; y < height/2; y+=height/2/verticalLines ){
    stroke(peace);
    line(0, y, width/2, y);
  }
}
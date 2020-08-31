//set up the variables for the number of lines in the rotating grids
int verticalLines = 10;
int horizontalLines = 8;
//set up the initial angle of rotation
float angle = 0.0;

void setup(){
  //set up the size of the window
  size(800, 600);
}

void draw(){
  //start with the first rotation:
  //push out the coordinate matrix to separate it from the main sketch coordinates
  pushMatrix();
  //move it over to the top left 3rd of the window
  translate(width/3, height/3);
  //rotate the matrix by the angle (in radians)
  rotate(angle);
  // draw a grid using the "for" loop
  // making the grid be half the size of the window
  // start with vertical lines along the X axis
  for(int x = 0; x < width/2; x+=width/2/verticalLines ){
    stroke(255, 0, 0); //make them red
    line( x, 0, x, height/2 );
  }
  // then the horizontal lines along the Y axis
  for(int y = 0; y < height/2; y+=height/2/horizontalLines ){
    stroke(0, 255, 0);//make them green
    line( 0, y, width/2, y );
  }
  //done with grid - pop the coordinate matrix back to 0, 0 point
  popMatrix();
  
  //move on to the second rotation:
  //push out the coordinate matrix to separate it from the main sketch coordinates
  pushMatrix();
  //move it over to the bottom right 3rd of the window (2/3 width, 2/3 height)
  translate(2*width/3, 2*height/3);
  //rotate it in the opposite direction by the same angle
  rotate(-angle);
  // draw another grid using the "for" loop
  // making the grid be half the size of the window
  // start with vertical lines along the X axis
  for(int x = 0; x < width/2; x+=width/2/verticalLines ){
    stroke(0, 0, 255);//make them blue
    line( x, 0, x, height/2 );
  }
  // then the horizontal lines along the Y axis
  for(int y = 0; y < height/2; y+=height/2/horizontalLines ){
    stroke(255, 0, 255);//make them purple
    line( 0, y, width/2, y );
  }
  //done with this grid as well - pop the coordinate matrix back to 0, 0 point
  popMatrix();
  
  // increase the angle of rotation
  angle += 0.1;
}

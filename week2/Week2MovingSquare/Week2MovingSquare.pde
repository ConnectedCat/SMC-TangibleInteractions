//position can change, so we'll make it a variable with a decimal point
//it will be empty in the beginning
float posX;
//so can the speed
float speedX = 6.0;

//We're only dealing with the left-to-right motion, so we only
//need the variable to the X position and X speed
// Up-to-down motion would need the Y axis

//same for width and height
int rectangleHeight = 150;
int rectangleWidth = 150;

//this is a checkbox - a boolean variable that is either true or false, on or off.
//it determines wether the rectangle should move to the right or not
boolean shouldMoveRight = true;

void setup(){
  //you can change the size of your app's window here:
  size(840, 360);
  // now that we know the width of the window let's put the starting point
  // at the horisontal center:
  posX = width/2;
}

void draw(){
  //one way to erase previous frames is to draw a rectangle in the beginning of each frame
  //starting from 0 X and 0 Y point, and extending the whole width and height:
  //rect(0, 0, width, height);
  //but there is also a special function we could use:
  //set the background using 3 color values: Red, Green and Blue
  //plugged into the special function relacing the need for the rectangle
  background(234, 98, 87);
  //the position of the rectanle (caltulated from its top left corner) 
  //plus its width gives us the right border of the rectangle
  //if it's at the width of the app window, its rightmost edge, 
  //or has somehow gone over that point - reverse the value of the boolean to the opposite
  //so during the next loop the 'if' statement on line 41 returns false
  if(posX + rectangleWidth >= width){
    shouldMoveRight = false;
  }
  //since the rectangle is drawn from the left we only need to compare its position X
  //agaisnt 0 to find out if it has reached or passed the left edge
  //if so - we'll start moving it to the right again
  if(posX <= 0){
    shouldMoveRight = true;
  }
  
  
  // if the boolean hold the 'true' value - we'll make the rectangle move to the right
  if( shouldMoveRight ){
    //add one pixel to the position X value, so that during the next loop the rectangle is drawn one pixel to the right
    posX = posX+speedX;
  }
  else {
    // if the boolean hold the 'false' value - subtract horizontal speed amount from the rectangle's position to make it move to the left
    posX = posX-speedX;
  }
  
  //draw the rectangle at the calculated position X and right below the
  // vertical center calculated by dividing the height of the window by 2
  rect(posX, height/2, rectangleWidth, rectangleHeight);
}

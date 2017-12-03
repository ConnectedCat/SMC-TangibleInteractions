//position can change, so we'll make it a variable integer
int posX = 20;
//same for width and height
int rectangleHeight = 150;
int rectangleWidth = 150;

//this is a checkbox - a boolean variable that is either true or false, on or off.
//it determines wether the rectangle should move to the right or not
boolean shouldMoveRight = true;

void setup(){
  //you can change the size of your app's window here:
  size(840, 360);
}

void draw(){
  //set the background
  background(234, 98, 87);
  //draw a rectangle
  rect(posX, 20, 150, 150);
  // if the boolean hold the 'true' value - we'll make the rectangle move to the right
  if( shouldMoveRight ){
    //add one pixel to the position X value, so that during the next loop the rectangle is drawn one pixel to the right
    posX = posX+1;
    //the position of the rectanle (which is caltulated from its top left corner) plus its width gives us the right border of the rectangle
    //if it's at the width of the app window, its rightmost edge, or has somehow gone over that point - reverse the value of the boolean checkbox to the opposite
    //so during the next loop the 'if' statement on line 22 returns false
    if(posX + rectangleWidth >= width){
      shouldMoveRight = !shouldMoveRight;
    }
  }
  else {
    // if the boolean hold the 'false' value - subtract 1 pixel from the rectangle's position to make it move to the left
    posX = posX-1;
  }
}
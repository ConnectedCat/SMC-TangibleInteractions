//int velocityX, velocityY;
//int posX, posY;

// instead of declaring separate values for x and y position and x and y velocity
// we can create vectors that will track both x and y at once

PVector position, velocity;
int ballSize = 100;

void setup(){
  size(1023, 1023);
  
  //posX = height/2;
  //posY = width/2;
  //velocityX = 4;
  //velocityY = 5;
  
  // setting up the values will only take 2 lines
  // see https://processing.org/reference/PVector.html for details
  position = new PVector(width/2, height/2);
  velocity = new PVector(4, 5);
}

void draw(){
  fill(125, 100);
  rectMode(CORNER);
  rect(0, 0, width, height);
  
  // this detects a collision or overlap of the ball and the left and the right edges of the screen
  //if(posX - 50 <= 0 || posX + 50 >= width) {
  //  reverse the direction of the horizontal movement
  //  velocityX = -velocityX;
  //}
  
  // you can access x and y values through dot notation: PVector.x and PVector.y
  
  if(position.x - ballSize/2 <= 0 || position.x + ballSize/2 >= width){
    // this is just another way to flip the number from positive to nevative and vice verca
    // thus changing the direction of movement
    velocity.x *= -1;
  }
  
  // this detects a collision or overlap of the ball and the top and the bottom edges of the screen
  //if(posY - 50 <= 0 || posY + 50 >= height) {
  //  reverse the direction of the vertical movement
  //  velocityY = -velocityY;
  //}
  
  if(position.y - ballSize/2 <= 0 || position.y + ballSize/2 >= height){
    velocity.y *= -1;
  }
  
  //posX = posX + velocityX;
  //posY = posY + velocityY;
  
  // adding two vectors is possible with a simple function
  // see https://processing.org/reference/PVector_add_.html for details
  position.add(velocity);
  
  fill(255, 0, 125);
  ellipseMode(CENTER);
  //ellipse(posX, posY, ballSize, ballSize);
  ellipse(position.x, position.y, ballSize, ballSize);
}
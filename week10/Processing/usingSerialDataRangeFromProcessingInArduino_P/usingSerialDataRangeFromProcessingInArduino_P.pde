import processing.serial.*;

Serial myPort;
PVector position, velocity;
int ballSize = 100;

void setup(){
  size(1023, 1023);

  position = new PVector(height/2, width/2);
  velocity = new PVector(4.0, 6.0);
  
  myPort = new Serial(this, Serial.list()[1], 9600);
}

void draw() {
  fill(125, 100);
  rectMode(CORNER);
  rect(0, 0, width, height);
  
  // grab the x position of the ball and map it from the range representing possible positions of the horizontal axis (0 - width)
  // to a range repserenting brightness values for an LED (0, 255)
  // then create an integer out of the resulting value
  int sendingVal = int(map(position.x, 0, width, 0, 255));
  // send that value down the serial port every loop
  myPort.write(sendingVal);
  
  // this detects a collision or overlap of the ball and the left and the right edges of the screen
  if(position.x - ballSize/2 <= 0 || position.x + ballSize/2 >= width){
    // reverse the direction of the horizontal movement
    velocity.x *= -1;
  }
  
  // this detects a collision or overlap of the ball and the top and the bottom edges of the screen
  if(position.y - ballSize/2 <= 0 || position.y + ballSize/2 >= height){
    // reverse the direction of the vertical movement
    velocity.y *= -1;
  }
  
  position.add(velocity);
  
  fill(255, 0, 125);
  ellipseMode(CENTER);
  ellipse(position.x, position.y, ballSize, ballSize);
}
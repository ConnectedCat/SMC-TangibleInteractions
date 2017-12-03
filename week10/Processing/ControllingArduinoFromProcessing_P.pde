import processing.serial.*;

Serial myPort;
PVector position, velocity;
int ballSize = 100;

void setup(){
  size(1023, 1023);
  
  position = new PVector(width/2, height/2);
  velocity = new PVector(4, 5);
  // String portName = Serial.list()[1];
  // myPort = new Serial(this, portName, 9600);
  
  // the two lines above can be simplified into a single line
  
  myPort = new Serial(this, Serial.list()[1], 9600);
}

void draw() {
  fill(125, 100);
  rectMode(CORNER);
  rect(0, 0, width, height);
  
  // write a character for '0' into a serial communication port with every loop
  myPort.write('0');
  
  // this detects a collision or overlap of the ball and the left and the right edges of the screen
  if(position.x - ballSize/2 <= 0 || position.x + ballSize/2 >= width){
    // reverse the direction of the horizontal movement
    velocity.x *= -1;
    // write a character for '1' into a serial communication port
    myPort.write('1');
  }
  // this detects a collision or overlap of the ball and the top and the bottom edges of the screen
  if(position.y - ballSize/2 <= 0 || position.y + ballSize/2 >= height){
    // reverse the direction of the vertical movement
    velocity.y *= -1;
    // write a character for '1' into a serial communication port
    myPort.write('1');
  }
  // this way a character for '1' is sent down the serial port every time there is a collision with a border
  
  position.add(velocity);
  
  fill(255, 0, 125);
  ellipseMode(CENTER);
  ellipse(position.x, position.y, ballSize, ballSize);  
}
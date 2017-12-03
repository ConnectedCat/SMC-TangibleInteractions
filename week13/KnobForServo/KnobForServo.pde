//import a Serial library into the sketch
import processing.serial.*;
// create a new Serial object
Serial myPort;

// we're starting with an empty string
String serialValue = "";

void setup(){
  size(400, 400);
  
  // get the right port name - ADJUST IT TO YOUR SYSTEM!!!
  String portName = Serial.list()[1];
  // instantiate your serial object
  myPort = new Serial(this, portName, 9600);
}

void draw(){
  background(255);
  
  float rotationAngle = map(mouseX, width, 0, 0, PI);
  
  int degrs = int(degrees(rotationAngle));
  // move the matrix to the center
  translate(width/2, height/2);
  // rotate it according to the mapped value for rotation angle
  // but in the opposite direction, because that's how a potentiometer rotates
  rotate(-rotationAngle);
  
  println(degrs);
  
  //make an ellipse
  fill(255, 0 , 255);
  ellipse(0, 0, 100, 100);
  // draw a line corresponding to the potentiometer position
  stroke(255, 0, 0);
  line(0, 0, 60, 0);
  myPort.write(degrs); 
}
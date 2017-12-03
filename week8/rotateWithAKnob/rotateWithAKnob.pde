//import a Serial library into the sketch
import processing.serial.*;
// create a new Serial object
Serial myPort;
// this will be a numeric value from the serial port
float val = 0.0;
// this will be a text String coming from the port
// we're starting with an empty string
String serialValue = "";

void setup(){
  size(800, 600);
  //printArray(Serial.list());
  // get the right port name - ADJUST IT TO YOUR SYSTEM!!!
  String portName = Serial.list()[1];
  // instantiate your serial object
  myPort = new Serial(this, portName, 9600);
  // read the serial data into a memory buffer until we reach
  // a specified character - in our case EOL or \n
  // and then trigger the serialEvent function
  myPort.bufferUntil('\n'); 
}

void draw(){
  background(255);
  
  println(serialValue);
  val = float(serialValue);
  // map the potentiometer values to 3/4 of a circle circumference or PI*1.5
  float rotationAngle = map(val, 0.0, 1023.0, 0.0, PI*1.5);
  
  // move the matrix to the center
  translate(width/2, height/2);
  // rotate it according to the mapped value for rotation angle
  // but in the opposite direction, because that's how a potentiometer rotates
  rotate(-rotationAngle);
  
  println(-rotationAngle);
  
  //make an ellipse
  fill(255, 0 , 255);
  ellipse(0, 0, 100, 100);
  // draw a line corresponding to the potentiometer position
  stroke(255, 0, 0);
  line(0, 0, 40, 40);
  
  // the translation of a metrix resets automatically at the end of draw()
}
// a function explicitly called serialEvent
// will be triggered when Serial.bufferUntil() function
// encounters a pre-determined character
// This functions requests a Serial object as an argument
void serialEvent(Serial p) { 
  // read the string from the serial port and pass it to our variable
  serialValue = p.readString(); 
} 
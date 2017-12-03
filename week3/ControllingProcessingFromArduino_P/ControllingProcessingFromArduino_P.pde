// import a serial library giving us access to all the serial port functionality
// https://processing.org/reference/libraries/serial/index.html
import processing.serial.*;

// make a new Serial object called myPort
Serial myPort;
// make a String container called 'value'
String value;
// this will be the radius of our rectangle
int rectSide = 100;


void setup(){
  // make a window of 1023px by 1023px
  size(1023, 1023);
  // print a list of all the serial ports in the system as an array
  // just to check which one we need to connect to
  printArray(Serial.list());
  // grab the right name from that list and make it our port name
  String portName = Serial.list()[1];
  // set up our Serial object to belong to our sketch (this), to connect to the right port
  // and to communicate at baud 9600
  myPort = new Serial(this, portName, 9600);
}

void draw(){
  //background rectangle with a bit of transparency
  fill(255, 255, 0, 60);
  rect(0, 0, width, height);
  
  // if serial data on our port is available
  if ( myPort.available() > 0) {
    // read a chunk of it until we get to the EOL character (see the Arduino sketch)
    // and store it in the 'value' container
    value = myPort.readStringUntil('\n');         
  }
  
  // here is some cleanup:
  // let's make sure the value is not null
  // it can happen if there is a communication error - we can disregard those errors
  if( value != null ){
    // trim some possible white space junk
    // just in case
    value = value.trim();
    // print the value as a separate line for us to see
    println(value);
    // set the radius of our rectangle to be half of the value we're recieving
    rectSide = int(value)/2;
  }
  // draw our rectangle with a bit of opacity
  fill(0, 255, 255, 40);
  // make sure it's in the RADIUS mode,
  // so drawing from the center and using half its side as a measurement:
  rectMode(RADIUS);
  rect(width/2, height/2, rectSide, rectSide);
}
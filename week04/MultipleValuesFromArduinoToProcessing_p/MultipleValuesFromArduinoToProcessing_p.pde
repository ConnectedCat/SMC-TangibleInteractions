// import a serial library giving us access to all the serial port functionality
// https://processing.org/reference/libraries/serial/index.html
import processing.serial.*;

// make a new Serial object called myPort
Serial myPort;
// make a String container that we'll use to store the data from the Serial connection
String incomingData;
// this will be the radius of our rectangle
int rectSide = 100;
// preparte 3 integer variables and set them all to 0 for starters.
float temperature, soundlevel, potlevel = 0;
// prepare a variable that will set the blue component of the rectangle color
float blueColorComponent;

void setup(){
  // make a window of 1023px by 1023px
  size(1023, 1023);
  // print a list of all the serial ports in the system as an array
  // just to check which one we need to connect to
  printArray(Serial.list());
  // grab the right name from that list and make it our port name
  // it should match the name of the post that you Arduino board is connected to
  // you can find it in Tools -> Port menu in Arduino IDE
  String portName = Serial.list()[2];
  // set up our Serial object to connect our sketch (this) to the right port
  // and to communicate at baud 9600
  myPort = new Serial(this, portName, 9600);
  // we will be collecting all the incoming data from the serial connection into a buffer
  // until we encounter the End of Line character, which signifies the end of the transmission (see the Arduino sketch)
  // once we encouter it a serialEvent function will be triggered
  myPort.bufferUntil('\n');
}

void draw(){
  //background rectangle with a bit of transparency
  fill(255, 255, 0, 60);
  rectMode(CORNER);
  rect(0, 0, width, height);
  
  // draw our rectangle with a bit of opacity using re-mapped temperature value for the blue component
  fill(0, 255, blueColorComponent, 40);
  // make sure it's in the RADIUS mode,
  // so drawing from the center and using half its side as a measurement:
  rectMode(RADIUS);
  // potentiometer will move the rectangle left and right
  // sound levels will determine the size
  rect(potlevel, height/2, soundlevel, soundlevel);
}

void serialEvent(Serial p) {
  // we'll read the data we've been buffering and store it in a variable
  // the data comes in as a string of characters
  incomingData = p.readString(); 
  
  // here is some cleanup:
  // let's make sure the value is not null
  // it can happen if there is a communication error - we can disregard those errors
  if( incomingData != null ){
    // trim some possible white space junk, just in case
    incomingData = incomingData.trim();
    // make an array of 'float' numbers; split the String we received from the serial port
    // into chunks at the ',' characters - we used them as separators, see Arduino sketch
    // convert the resulting chunks into numbers and store in the array
    float mysensors[] = float(split(incomingData, ','));
    // print the resulting array into a console to verify
    printArray(mysensors);
    //make sure we have all 3 values from our three sensors
    if(mysensors.length == 3){
      //assign those values to the corrresponding variables
      temperature = mysensors[0];
      potlevel = mysensors[1];
      soundlevel = mysensors[2];
      
      // map the temperature value from the range of -40...125 to a range of 0...255
      // to be used as a color value
      // see https://processing.org/reference/map_.html for details
      blueColorComponent = map(temperature, -40, 125, 0, 255);
    }
  }
  
}

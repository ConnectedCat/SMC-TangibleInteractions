// import a serial library giving us access to all the serial port functionality
// https://processing.org/reference/libraries/serial/index.html
import processing.serial.*;

// make a new Serial object called myPort
Serial myPort;
// make a String container called 'value'
String value;
// this will be the radius of our rectangle
int rectSide = 100;
// preparte 3 integer variables and set them all to 0 for starters.
int temperature, soundlevel, potlevel = 0;

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
  rectMode(CORNER);
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
    // make an array of integers; split the String we received from the serial port ('value')
    // into chunks at the "TAB" symbols; convert the resulting chunks into integers
    int mysensors[] = int(split(value, '\t'));
    
    //make sure we have all 3 values
    if(mysensors.length == 3){
      //assign those values to the corrresponding variables
      temperature = mysensors[0];
      potlevel = mysensors[1];
      soundlevel = mysensors[2];
    }
  }
  
  // map the temperature value from the range of -40...125 to a range of 0...255
  // to be used as a color value
  // see https://processing.org/reference/map_.html for details
  float processedColor = map(temperature, -40, 125, 0, 255);
  // draw our rectangle with a bit of opacity using re-mapped temperature value for the blue component
  fill(0, 255, processedColor, 40);
  // make sure it's in the RADIUS mode,
  // so drawing from the center and using half its side as a measurement:
  rectMode(RADIUS);
  // potentiometer will move the rectangle left and right
  // sound levels will determine the size
  rect(potlevel, height/2, soundlevel, soundlevel);
}
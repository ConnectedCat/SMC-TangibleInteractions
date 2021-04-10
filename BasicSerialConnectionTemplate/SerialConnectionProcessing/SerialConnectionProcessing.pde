import processing.serial.*; //import the serial library

//create a variable for the connection
Serial myConnection; 

// make a String container that we'll use to store the data from the Serial connection
String incomingData;

// make a variable that will store the number we recieve from the Serial connection
// and apply it somewhere in the sketch
float numberFromData;

void setup(){
  //change window size as needed
  size(200, 200);
  //this prints out the list of all Serial ports on your computer
  printArray( Serial.list() );
  
  // grab the right name from that list and make it our port name
  // it should match the name of the post that you Arduino board is connected to
  // you can find it in Tools -> Port menu in Arduino IDE
  String portName = Serial.list()[0];
  
  // set up our Serial object to connect our sketch (this) to the right port
  // and to communicate at baud 9600
  myConnection = new Serial(this, portName, 9600);
}

void draw(){
  // this shows how the number from data could be used to control the background color
  background(numberFromData);
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
    //convered the cleaned up data from a string of characters into a number
    numberFromData = float(incomingData);
  }
}

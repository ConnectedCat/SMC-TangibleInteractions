import processing.serial.*; //import the serial library

Serial myConnection; //create a variable for the connection

void setup(){
  //change window size as needed
  size(200, 200);
  //this prints out the list of all Serial ports on your computer
  printArray( Serial.list() );
  
  //find the port on your computer
  //and put in the correct number here:
  String portName = Serial.list()[0];
  
  //create a serial connection and store it in the prepared variable
  myConnection = new Serial(this, portName, 9600);
}

void draw(){
  //start by checking if connection is available
  if(myConnection.available() > 0){
    //read out the string of characters coming from the connection
    //until the end of the line character is encountered
    //store this string in the "value" variable
    String value = myConnection.readStringUntil('\n');
    
    //check if there are characters in the "value"
    if(value != null){
      //convert the characters to a floating point number
      //and store in "numValue" valiable
      float numValue = float(value);
      // use as needed below
    }
  }
}

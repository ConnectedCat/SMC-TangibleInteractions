import processing.serial.*;

Serial myConnection;

void setup(){
  //change as needed
  size(200, 200);
  //this prints out the list of all Serial ports on your computer
  printArray( Serial.list() );
  
  //find the port on your computer and put in the correct
  //number here:
  String portName = Serial.list()[0];
  myConnection = new Serial(this, portName, 9600);
}

void draw(){
  if(myConnection.available() > 0){
    String value = myConnection.readStringUntil('\n');
    
    if(value != null){
      float numValue = float(value);
      // use as needed
    }
  }
}

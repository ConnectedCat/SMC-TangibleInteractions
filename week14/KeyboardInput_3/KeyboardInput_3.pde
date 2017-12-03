import processing.serial.*;

int boxHeight = 40;
int boxWidth = 300;

PFont myFont;
Serial myPort;

String inputText = "";

void setup(){
  size(400, 200);
  myFont = createFont("Georgia", 32);
  printArray(Serial.list());
  
  myPort = new Serial(this, Serial.list()[2], 9600);
}

void draw(){
  background(240, 45, 78);
  
  fill(255);
  rect(width/2 - boxWidth/2, height/2 - boxHeight/2, boxWidth, boxHeight);
  
  fill(240, 45, 78);
  textFont(myFont);
  textAlign(LEFT, TOP);
  text(inputText, width/2 - boxWidth/2, height/2 - boxHeight/2);
}

void keyReleased(){
  if(key == BACKSPACE){
    inputText = inputText.substring(0, inputText.length() - 1);
  }
  else if(key == ENTER || key == RETURN){
    myPort.write(inputText);
  }
  else {
    inputText += key;
  }
}
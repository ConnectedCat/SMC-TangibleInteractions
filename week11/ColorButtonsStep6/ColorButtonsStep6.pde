import processing.serial.*;
Serial myPort;

int numberOfButtons = 8;

PVector [] buttonPositions = new PVector[numberOfButtons];
color [] buttonColors = new color[numberOfButtons];
boolean [] buttonStates = new boolean[numberOfButtons];

int buttonRadius = 50;

void setup(){
  size(200, 900);
  colorMode(HSB, 360, 100, 255);
  myPort = new Serial(this, Serial.list()[1], 9600);
  
  for(int i = 0; i < numberOfButtons; i++){
    buttonPositions[i] = new PVector(100, 100*(i+1));
    buttonColors[i] = color(0, 100, 255 - (255/numberOfButtons)*i);
    buttonStates[i] = false;
  }
}

void draw(){
  background(125);
  for(int i = 0; i < numberOfButtons; i++){
    fill(buttonColors[i]);
    if(buttonStates[i]) {
      strokeWeight(3);
      ellipse(buttonPositions[i].x + 2, buttonPositions[i].y + 2, buttonRadius, buttonRadius);
      strokeWeight(1);
    }
    else {
      ellipse(buttonPositions[i].x, buttonPositions[i].y, buttonRadius, buttonRadius);
    }
    
  }
}

void mouseClicked(){
  for(int i = 0; i < numberOfButtons; i++){
    if(dist(buttonPositions[i].x, buttonPositions[i].y, mouseX, mouseY) < buttonRadius){
      if(!buttonStates[i]){
        int valToSend = int(brightness(buttonColors[i]));
        println(valToSend);
        myPort.write(valToSend);
      }
      buttonStates[i] = !buttonStates[i];
    }
    else {
      buttonStates[i] = false;
    }
  }
}
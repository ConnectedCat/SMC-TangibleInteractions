import processing.serial.*;

float angle = HALF_PI;

Serial myConnection;

void setup(){
  size(400, 400);
  
  myConnection = new Serial(this, Serial.list()[0], 9600);
}

void draw(){
  background(255);
  noFill();
  strokeWeight(5);
  stroke(0);
  arc(width/2, height*0.75, width/2, height/2, PI, TWO_PI);
  
  pushMatrix();
  translate(width/2, height*0.75);
  rotate(-angle);
  strokeWeight(2);
  line(0, 0, 0, width/4);
  fill(255, 0, 0);
  noStroke();
  rect(-5, width/4 - 15, 10, 30);
  popMatrix();
}

void mouseDragged(){
  if(mouseX > 0 && mouseX < width){
    angle = map(mouseX, 0, width, (HALF_PI+PI), HALF_PI);
    
    int sending = int(degrees(angle)) - 90;
    println(sending);
    myConnection.write(sending);
  }
}

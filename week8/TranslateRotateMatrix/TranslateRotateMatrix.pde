
int verticalLines = 10;
int horizontalLines = 8;

float angle = 0.0;

void setup(){
  size(800, 600);
}

void draw(){
  // translate(width/2, height/2);
  angle += 0.1;
  // angle += PI/32;
  pushMatrix();
  translate(width/3, height/3);
  rotate(angle);
  // translate(200, 200);
  for(int x = 0; x < width/2; x+=width/2/horizontalLines ){
    stroke(255, 0, 0);
    line( x, 0, x, height/2 );
  }
  // translate(width/2, height/2);
  for(int y = 0; y < height/2; y+=height/2/verticalLines ){
    stroke(0, 255, 0);
    line( 0, y, width/2, y );
  }
  popMatrix();
  translate(2*width/3, 2*height/3);
  rotate(angle);
  for(int x = 0; x < width/2; x+=width/2/horizontalLines ){
    stroke(0, 0, 255);
    line( x, 0, x, height/2 );
  }
  // translate(width/2, height/2);
  for(int y = 0; y < height/2; y+=height/2/verticalLines ){
    stroke(255, 0, 255);
    line( 0, y, width/2, y );
  }
  // delay(1000);
}
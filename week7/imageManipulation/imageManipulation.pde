PImage myImg;

int numberOfXSteps, numberOfYSteps;

void setup(){
  size(800, 600);
  myImg = loadImage("images/pickle-rick.png");
  numberOfXSteps = 40;
  numberOfYSteps = 40;
  myImg.loadPixels();
}

void draw(){
  //for(int x = 0; x < myImg.width*myImg.height; x = x+90){
  //  myImg.pixels[x] = color(random(255), random(255), random(255));
  //}
  
  myImg = loadImage("images/pickle-rick.png");
  myImg.loadPixels();
  numberOfXSteps = mouseX+1;
  numberOfYSteps = mouseY+1;
  for(int y = 0; y < myImg.height; y=y+numberOfYSteps){//every 40th row
    for(int x = 0; x < myImg.width; x++){//every pixel
      myImg.pixels[y*myImg.width+x] = color(0, 255, 0);
    }
  }
  
  
  for(int y = 0; y < myImg.height; y++){//every row
    for(int x = 0; x < myImg.width; x=x+numberOfXSteps){//every 40th pixel
      myImg.pixels[y*myImg.width+x] = color(0, 255, 0);
    }
  }
  myImg.updatePixels();
  image(myImg, 0, 0, width, height);
}

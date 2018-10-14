// make a new special object to contain your image
PImage myImg;
// create variables for the number of pixels between the horizontal(Y) and the vertical(X) lines
int numberOfXSteps, numberOfYSteps;

void setup(){
  size(800, 600);
  // load the image from the file into our special object
  myImg = loadImage("images/pickle-rick.png");
  // define the number of pixels between the horizontal(Y) and the vertical(X) lines
  numberOfXSteps = 40;
  numberOfYSteps = 40;
  // load every pixel of that image into a .pixels array
  myImg.loadPixels();
}

void draw(){
  // set a random color to every 90th pixel
  // starting from the top left corner and going horizontally through every pixel in a row,
  // all rows from top to bottom
  //for(int x = 0; x < myImg.width*myImg.height; x = x+90){
  //  myImg.pixels[x] = color(random(255), random(255), random(255));
  //}
  
  
  // update the loaded image every loop  
  myImg = loadImage("images/pickle-rick.png");
  // load every pixel of that image into a .pixels array from scratch
  myImg.loadPixels();
  // set the number of pixels between to the mouse position plus one pixel (to avoid 0 pixel errors)
  numberOfXSteps = mouseX+1;
  numberOfYSteps = mouseY+1;
  for(int y = 0; y < myImg.height; y=y+numberOfYSteps){// for every row plus the number of vertical steps
    for(int x = 0; x < myImg.width; x++){//every pixel in that row
      myImg.pixels[y*myImg.width+x] = color(0, 255, 0); //make the color of that pixel primary green
    }
  }
  
  
  for(int y = 0; y < myImg.height; y++){//every row
    for(int x = 0; x < myImg.width; x=x+numberOfXSteps){//every pixel in that row plus the number of horizontal steps
      myImg.pixels[y*myImg.width+x] = color(0, 255, 0);//make the color of that pixel primary green
    }
  }
  //update pixels in the image
  myImg.updatePixels();
  //draw the updated image on canvas
  image(myImg, 0, 0, width, height);
}

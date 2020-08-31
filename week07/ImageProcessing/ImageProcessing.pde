// make a new special object to contain your image
PImage myImg;
// define the number of pixels between the horizontal and the vertical lines
int numberOfSteps = 40;

void setup(){
  size(800, 600);
  // load the image from the file into our special object
  myImg = loadImage("images/img800x600.jpg");
  // load every pixel of that image into a .pixels array
  myImg.loadPixels();
}

void draw(){
  background(125);
  // MAKE VERTICAL LINES
  // go through the array of pixels skipping a pre-defined number of steps
  // and change the color of each of those pixels to green
  // if the width of the image is divisible by the number of steps without remainder
  // we'll get vertical lines
  // otherwise the lines will be slanted
  for(int i = 0; i < myImg.width*myImg.height; i+=numberOfSteps){
    myImg.pixels[i] = color(0, 255, 0);
  }
  //MAKE HORIZONTAL LINES
  // go through the array of pixels skipping whole rows of pixels a certain number of times
  for(int i = 0; i < myImg.width*myImg.height; i+=myImg.width*numberOfSteps){
    // in the selected row gow through every pixel until the end of that row
    for(int j = 0; j < myImg.width; j++){
      // the address of the pixel in that row will be 'i' (the zeroth pixel in that row)
      // plus 'j' (the number of pixels in that row)
      // set that pixel to green color
      myImg.pixels[i+j] = color(0, 255, 0);
    }
  }
  
  // update the pixels in the image with the new values from the .pixels array
  myImg.updatePixels();
  // display the image in the window
  image(myImg, 0, 0, width, height);
}
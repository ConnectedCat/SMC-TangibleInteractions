// set up a variable for your font
PFont myFont;
// set up an array to hold all the fonts available to you
String[] myFontNames;
//Set up a variable for your image
PImage myImage;
// this iterator will allow us to use the draw() loop as a for() loop
int i = 0;

void setup(){
  size(800, 600);
  //you could use this function to control the rate at which draw loops:
  frameRate(2);
  // PFont.list() function returns the array of the names of all of the fonts available to you
  // you'll populate our pre-made array with those names
  myFontNames = PFont.list();
  // and use printArray() function to display them in the terminal
  printArray(myFontNames);
  //you could load a font you made and placed in the 'data' folder into your PFont variable
  //myFont = loadFont("Copperplate-48.vlw");
  //load the image from the 'data' folder into your PImage variable
  myImage = loadImage("puppy.jpg");
}

void draw(){
  background(125);
  //display the image on the page:
  image(myImage, 0, 0, width, height);
  //as long as the iterator is within the bounds of our array or font names
  if(i < myFontNames.length){
    //print the number of the current frame
    println("New Frame: " + frameCount);
    //print the name of the font located in the array at position corresponding to the current number in the iterator
    println(myFontNames[i]);
    // make a new font using the name of the font in our array
    // which sits at the address corresponding to the value of our iterator
    myFont = createFont(myFontNames[i], 48, true);
    // since here the iterator is still within the bounds of our array of fonts
    // increase it by one
    i = i+1;
  }
  else {
    println("Done!");
    // since here the iterator is still within the bounds of our array of fonts
    // set it back to 0
    i = 0;
  }
  // assign the font from line 37 to be the currently active one
  textFont(myFont);
  // set the alignment to center
  textAlign(CENTER);
  // create text at the center of the window
  text("Hello, World!", width/2, height/2);
}

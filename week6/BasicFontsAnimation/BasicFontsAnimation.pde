// set up a variable for your font
PFont myFont;
// set up an array to hold all the fonts available to you
String[] myFonts;
// this iterator will allow us to use the draw() loop as a for() loop
int iterator = 0;

void setup(){
  size(800, 600);
  // PFont.list() function returns the array of the names of all of the fonts available to you
  // you'll populate our pre-made array with those names
  myFonts = PFont.list();
  // and use printArray() function to display them in the terminal
  printArray(myFonts);
}

void draw(){
  background(125);
  // make a new font using the name of the font in our array
  // which sits at the address corresponding to the value of our iterator
  myFont = createFont(myFonts[iterator], 48, true);
  // assign this font to be the currently active one
  textFont(myFont);
  // set the alignment to center
  textAlign(CENTER);
  // create text at the center of the window
  text("Hello World!", width/2, height/2);
  // the iterator is still within the bounds of our array of fonts
  // increase it by one
  if(iterator < myFonts.length-1){
    iterator++;
  }
  // otherwise - set it back to 0
  else {
    iterator = 0;
  }
}
// import all functions from the serial library
import processing.serial.*;
// set up a variable for the port
Serial myPort;
// create a variable representing a number of buttons on the screen
// having this number in one place makes it easy to introduce later changes
int numberOfButtons = 8;
// create an array of vectors to contain the positions of buttons
PVector [] buttonPositions = new PVector[numberOfButtons];
// create an array of colors to contain different color values for each button
color [] buttonColors = new color[numberOfButtons];
// add another array to save the states of the buttons as true/false values
boolean [] buttonStates = new boolean[numberOfButtons];
// set the radius of a button to be 50 pixels
int buttonRadius = 50;

void setup(){
  // create a tall and narrow window
  size(200, 900);
  // well be changing the brightness of the button colors
  // it would be a lot more straightforward if we change the way we create and change colors
  // from the default red-green-blue to hue-saturation-brightness
  // wth the max brightness set to 255
  colorMode(HSB, 360, 100, 255);
  // create a new serail connection and store it in our variable for serial port
  myPort = new Serial(this, Serial.list()[1], 9600);
  
  for(int i = 0; i < numberOfButtons; i++){
    // add a new vector into every slot of the positions array
    // the x position of the vectors will remain the same
    // the y position will increase for every new vector in increments of 100
    buttonPositions[i] = new PVector(100, 100*(i+1));
    // add a new color into every slot of the colors array
    // the hue and the saturation will remain the same for all
    // but the brightness will decrease by a number corresponding to the number of buttons we have
    buttonColors[i] = color(0, 100, 255 - (255/numberOfButtons)*i);
    // set each button state to be false (unclicked) in the beginning
    buttonStates[i] = false;
  }
}

void draw(){
  //add the background to cover up the previous frames
  background(125);
  // loop though a number of steps corresponding to the number of button in our arrays
  for(int i = 0; i < numberOfButtons; i++){
    // set the fill to the corresponding color from the color array
    fill(buttonColors[i]);
    // if the button state is true (clicked)
    if(buttonStates[i]) {
      // increase the stroke weight
      strokeWeight(3);
      // draw an ellipse in a corresponding, but slightly offset position using the radius values
      ellipse(buttonPositions[i].x + 2, buttonPositions[i].y + 2, buttonRadius, buttonRadius);
      // set the stroke weight back
      strokeWeight(1);
    }
    // if the button state is not true (unclicked) - with is the only other option
    else {
      // draw an ellipse in a corresponding position using the radius values
      ellipse(buttonPositions[i].x, buttonPositions[i].y, buttonRadius, buttonRadius);
    }
    
  }
}

// add a functon that will respond to 'mouse clicked' events
// the code inside will be executed every time a mouse is clicked inside our sketch window
void mouseClicked(){
  // loop though a number of steps corresponding to the number of button in our arrays
  for(int i = 0; i < numberOfButtons; i++){
    // if the distance between the mouse position at this point and the center position of this button
    // is less than the radius of the button - 
    // meaning the click happened inside this button's radius
    if(dist(buttonPositions[i].x, buttonPositions[i].y, mouseX, mouseY) < buttonRadius){
      // the button state is NOT true, if it is unclicked
      if(!buttonStates[i]){
        // read the brightness of the color of this button, convert the resulting value to an integer and send it down the serial port
        myPort.write(int(brightness(buttonColors[i])));
      }
      // change the state state of the button to the opposite regardless of whether it's been clicked or not
      buttonStates[i] = !buttonStates[i];
    }
  }
}
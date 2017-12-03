// create an array of vectors with 8 members in it
// they will contain x and y values for the button positions
PVector [] buttons = new PVector[8];
// set the radius of a button to be 50 pixels
int buttonRadius = 50;

void setup(){
  // create a tall and narrow window
  size(200, 900);
  // add a new vector into every slot in our array
  // the x position of the vectors will remain the same
  // the y position will increase for every new vector in increments of 100
  for(int i = 0; i < buttons.length; i++){
    buttons[i] = new PVector(100, 100*(i+1));
  }
}

void draw(){
  // set the fill to be red, corresponding to the LED color
  fill(255, 0, 0);
  // for every memeber of the array 'buttons' represented as 'button'
  for(PVector button : buttons){
    // draw an ellipse in a corresponding position using the radius values
    ellipse(button.x, button.y, buttonRadius, buttonRadius);
  }
}
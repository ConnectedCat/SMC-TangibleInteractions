import processing.serial.*;

int boxHeight = 40;
int boxWidth = 300;

PFont myFont;
Serial myPort;

// we'll need a string of characters to hold the text we're going to type
// we'll start with an empty one
String inputText = "";
// limit its length to the number of charcters in the LCD display
int inputTextLimit = 16;

void setup(){
  size(400, 200);
  
  myFont = createFont("Georgia", 32);
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[2], 9600);
}

void draw(){
  background(240, 45, 78);
  
  fill(255);
  // center the text input diplay box to the window horizontally and vertically
  rect(width/2 - boxWidth/2, height/2 - boxHeight/2, boxWidth, boxHeight);
  
  fill(240, 45, 78);
  textFont(myFont);
  textAlign(LEFT, TOP);
  text(inputText, width/2 - boxWidth/2, height/2 - boxHeight/2);
  
}
// this function gets triggered every time a key on the computer keyboard is pressed and then released
// it gives you access to a special value 'key' which contains a character of the key that has just been pressed
void keyReleased(){
  if(key == BACKSPACE){
    if(inputText.length() > 0 ){ // if there are still characters in the string
      inputText = inputText.substring(0, inputText.length() - 1); // keep all the characters except the last one
    } 
  }
  else if(key == DELETE){
    inputText = ""; // empty the string
  }
  else if(key == RETURN || key == ENTER){
    if(inputText.length() == 0){ // if the text is empty
      myPort.write('\t'); // send TAB down the serial port
    }
    else { // otherwise - if there is something to write
      myPort.write(inputText);
    }
  }
  else {
    if(inputText.length() <= inputTextLimit){ // limit the max number of characters in the string
      inputText += key;
    }
  } // end of key options
}// end of key released function
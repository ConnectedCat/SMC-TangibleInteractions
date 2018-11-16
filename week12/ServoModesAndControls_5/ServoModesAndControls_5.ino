#include <Servo.h>

Servo myServo;
int servoPin = 5;
int ledPin = 3;
int touchPin = 4;
int buttonPin = 2;

int pos = 0; 
bool direction_up = true;
bool manual_mode = true;

void setup() {
  pinMode(touchPin, INPUT);
  pinMode(buttonPin, INPUT);
  pinMode(ledPin, OUTPUT);
  myServo.attach(servoPin);
  Serial.begin(9600);
}

void loop() {
  if(digitalRead(buttonPin)){
    manual_mode = !manual_mode;
    delay(50);
    pos = 90;
    myServo.write(pos);
    
    direction_up = true;
  }

  if(manual_mode){
  
  // put your main code here, to run repeatedly:
    if(digitalRead(touchPin)){
      digitalWrite(ledPin, HIGH);
      Serial.println(pos);
      moveServo();
    }// if the touch is on
    else {
      digitalWrite(ledPin, LOW);
    }
  }//end of manual mode
  else {
    moveServo();
  }//end of automatic mode
}//end of loop


void moveServo(){
  myServo.write(pos);
  delay(500);
  switch(pos){
    case 0:
      direction_up = !direction_up;
      pos += 10;
      break;
    case 180:
      direction_up = !direction_up;
      pos -= 10;
      break;
    default:
      if(direction_up){
        pos += 10;
      }
      else {
        pos -= 10;
      }
      break;
  } // end of switch
}// end of moveServo

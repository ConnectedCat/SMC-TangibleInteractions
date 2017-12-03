#include <Servo.h>

Servo myServo;
int touchPin = 4;
int defaultPos = 0;
int workingPos = 0;

int ledPin = 3;
int buttonPin = 2;
bool mode = false; //true is manual, false is automatic
bool servo_direction = true; // true is up, flase is down;

void setup() {
  pinMode(buttonPin, INPUT);
  pinMode(touchPin, INPUT);
  pinMode(ledPin, OUTPUT);
  myServo.attach(5);
  Serial.begin(9600);
}

void loop() {
  if(digitalRead(buttonPin)){
    mode = !mode;
    delay(500);
    myServo.write(defaultPos);
    workingPos = defaultPos;
    servo_direction = false;
  }

  if(mode){
    if(digitalRead(touchPin)){
      digitalWrite(ledPin, HIGH);
      myServo.write(workingPos);
      delay(500);

      switch(workingPos){
        case 0:
          servo_direction = !servo_direction;
          workingPos += 10;
          break;
        case 180:
          servo_direction = !servo_direction;
          workingPos -= 10;
          break;
        default:
          if(servo_direction) {
            workingPos += 10;
          }
          else {
            workingPos -= 10;
          }
          break;
      }
    }
    else{
      digitalWrite(ledPin, LOW);
    }
  } // end of if mode
  else {
    switch(workingPos){
        case 0:
          servo_direction = !servo_direction;
          workingPos += 1;
          break;
        case 180:
          servo_direction = !servo_direction;
          workingPos -= 1;
          break;
        default:
          myServo.write(workingPos);              // tell servo to go to position in variable 'pos'
          delay(15);
          if(servo_direction){
            workingPos += 1;
          }
          else {
            workingPos -= 1;
          }
          break;
      }
  }
}


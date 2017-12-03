#include <Servo.h>

Servo myServo;
int touchPin = 4;
int defaultPos = 0;
int workingPos = 0;

int buttonPin = 2;
bool mode = false; //true is manual, false is automatic
bool servo_direction = true; // true is up, flase is down;

void setup() {
  pinMode(buttonPin, INPUT);
  pinMode(touchPin, INPUT);
  myServo.attach(5);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(digitalRead(buttonPin)){
    mode = !mode;
    delay(500);
    myServo.write(defaultPos);
    workingPos = defaultPos;
  }
  Serial.print("Mode: ");
  Serial.println(mode);
  Serial.print("Position: ");
  Serial.println(workingPos);
  if(mode){
    if(digitalRead(touchPin)){
      myServo.write(workingPos);
      
      delay(500);
      workingPos += 10;
    }
  }
  else{
    if(workingPos < 180 && workingPos > 0) {
      myServo.write(workingPos);              // tell servo to go to position in variable 'pos'
      delay(15);
      if(servo_direction){
        workingPos += 1;
      }
      else {
        workingPos -= 1;
      }
    }
    if(workingPos == 180) {
      servo_direction = !servo_direction;
      workingPos -= 1;
    }
    if(workingPos == 0){
      servo_direction = !servo_direction;
      workingPos += 1;
    }
  }
}

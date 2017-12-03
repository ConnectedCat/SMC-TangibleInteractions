#include <Servo.h>

Servo myServo;
int touchPin = 4;
int pos = 0;

void setup() {
  pinMode(touchPin, INPUT);
  myServo.attach(5);
  Serial.begin(9600);
}

void loop() {
  if(digitalRead(touchPin)){
    myServo.write(pos);
    
    delay(500);
    workingPos += 10;
  }
}


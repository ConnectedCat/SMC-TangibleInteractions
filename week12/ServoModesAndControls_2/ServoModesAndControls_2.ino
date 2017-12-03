#include <Servo.h>

Servo myServo;
int touchPin = 4;
int pos = 0;

bool servo_direction = false; // true is up, flase is down;

void setup() {
  pinMode(touchPin, INPUT);
  myServo.attach(5);
  Serial.begin(9600);
}

void loop() {
  if(digitalRead(touchPin)){
    myServo.write(pos);
    delay(500);
    
    if(pos > 0 && pos < 180){
      if(servo_direction) {
        pos += 10;
      }
      else {
        pos -= 10;
      }
    }
    
    if(pos >= 180) {
      servo_direction = !servo_direction;
      pos -= 10;
    }
    if(pos <= 0){
      servo_direction = !servo_direction;
      pos += 10;
    }
  }
  Serial.println(pos);
}


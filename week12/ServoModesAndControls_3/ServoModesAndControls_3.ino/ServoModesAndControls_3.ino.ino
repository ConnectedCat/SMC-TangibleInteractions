#include <Servo.h>

Servo myServo;
int touchPin = 4;
int ledPin = 3;
int pos = 0;

bool servo_direction = false; // true is up, flase is down;

void setup() {
  pinMode(touchPin, INPUT);
  pinMode(ledPin, OUTPUT);
  
  myServo.attach(5);
  Serial.begin(9600);
}

void loop() {
  if(digitalRead(touchPin)){
    digitalWrite(ledPin, HIGH);
    myServo.write(pos);
    delay(500);

    switch(pos){
      case 0:
        servo_direction = !servo_direction;
        pos += 10;
        break;
      case 180:
        servo_direction = !servo_direction;
        pos -= 10;
        break;
      default:
        if(servo_direction) {
          pos += 10;
        }
        else {
          pos -= 10;
        }
        break;
    }
  }
  else{
    digitalWrite(ledPin, LOW);
  }

  Serial.println(pos);
}


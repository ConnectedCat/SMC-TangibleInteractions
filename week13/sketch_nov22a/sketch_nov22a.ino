#include <Servo.h>

String whateverWeGetFromProcessing;

Servo myServo;
int default_pos = 0;
// this will help us debug
int ledPin = 3;

void setup() {
  myServo.attach(5);
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available()){
    // we're getting something from serial, so light up the LED
    digitalWrite(ledPin, HIGH);

    whateverWeGetFromProcessing = Serial.read();
    // send the value to the servo
    myServo.write(whateverWeGetFromProcessing.toInt());
  }
  else {
    // we're not getting anything from serial, so shut down the LED
    digitalWrite(ledPin, LOW);
  }
  
}

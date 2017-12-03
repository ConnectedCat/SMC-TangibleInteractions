#include <Servo.h>

// prepare a varaible for the values we'll receive from Processing
String whateverWeGetFromProcessing;

Servo myServo;
int defaultPos = 0;

int ledPin = 3;

void setup() {
  myServo.attach(5);
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  if(Serial.available()){
    // read it and store it in our variable
    whateverWeGetFromProcessing = Serial.read();
    
    myServo.write(whateverWeGetFromProcessing.toInt());              // tell servo to go to position in variable 'pos'
    delay(15);
  }
}

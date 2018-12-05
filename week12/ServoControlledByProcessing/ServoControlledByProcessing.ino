#include <Servo.h>

// prepare a varaible for the values we'll receive from Processing
String whateverWeGetFromProcessing;

Servo myServo;
int defaultPos = 0;

int ledPin = 3;
int servoPin = 5;

void setup() {
  myServo.attach(servoPin);
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  if(Serial.available()){
    // read it and store it in our variable
    digitalWrite(ledPin, HIGH);
    whateverWeGetFromProcessing = Serial.read();
    
    myServo.write(whateverWeGetFromProcessing.toInt());              // tell servo to go to position in variable 'pos'
    delay(15);
  }
  else {
    digitalWrite(ledPin, LOW);
  }
}

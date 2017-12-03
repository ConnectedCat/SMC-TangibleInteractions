// plug the LED into pin 3
int ledPin = 3;

void setup() {
  // set the LED pin to be an output
  pinMode(ledPin, OUTPUT);
  // start serial communication
  Serial.begin(9600);
}

void loop() {
  // if there is any data coming through on the serial port
  if(Serial.available()){
    // write the value what's been read from the serial to the LED pin
    // this will result in the LED getting brighter or dimmer depending on the value read
    analogWrite(ledPin, Serial.read());
  }
}

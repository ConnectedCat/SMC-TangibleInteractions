// create a variable container to catch whater might come in through the serial port
char serialReadout;
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
  if (Serial.available()) {
    // read the data and store it in serialReadout
    serialReadout = Serial.read(); 

    if (serialReadout == '1') { // If 1 was received
      digitalWrite(ledPin, HIGH); // turn the LED on
    }
    else {
      digitalWrite(ledPin, LOW); // otherwise turn it off
    }
    delay(10); // Wait 10 milliseconds for next reading
  } // end of serial available
}

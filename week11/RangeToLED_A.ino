// prepare a varaible for the values we'll receive from Processing
String whateverWeGetFromProcessing;
// set the LED pin variable to be 3
int PWM_LEDpin = 3;


void setup() {
  // set the pin to be an output
  pinMode(PWM_LEDpin, OUTPUT);
  // start the serial communication
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  if (Serial.available()) { // If data is available to read,
    // read it and store it in our variable
    whateverWeGetFromProcessing = Serial.read();
    // convert the read value to the integer and write it to the LED pin
    analogWrite(PWM_LEDpin, whateverWeGetFromProcessing.toInt());
  }
}

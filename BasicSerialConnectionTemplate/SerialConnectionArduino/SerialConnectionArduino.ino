// let's use a variable to hold the name of our input channel
// in this case analogue input 0
int in = A0;

void setup() {
  // Start a serial connection with a baud rate of 9600
  Serial.begin(9600);
  // Set the mode of the Analog pin to be an input
  pinMode(in, INPUT);
}

void loop() {
  // Read the value from the input and assign it to a variable called 'value'
  int value = analogRead(in);
  // Send this value to the serial output as a separate line
  // closing it with the 'EOL' or end-of-line character
  Serial.println(value);
  // Take a breather for 10 milliseconds
  delay(10);
}

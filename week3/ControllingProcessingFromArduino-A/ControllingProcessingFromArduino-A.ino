// Declare potentiometer on Analog pin A0
int pot = A0;

void setup() {
  // Start a serial connection with a baud rate of 9600
  Serial.begin(9600);
  // Set the mode of the Analog pin connected to our potentiometer to be an input
  pinMode(pot, INPUT);
}

void loop() {
  // Read the value of the potentiometer and assign it to a variable called 'value'
  int value = analogRead(pot);
  // Send this value to the serial out as a separate line, therefore containing
  // the 'EOL' or end-of-line character
  Serial.println(value);
  // Take a breather for 100 milliseconds
  delay(100);
}

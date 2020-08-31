// Declare potentiometer on Analog pin A0
int potentiometer = A0;
// Declare sound sensor on Analog pin A1
int sound_sensor = A1;
// Declare temperature sensor on Analog pin A2
int temperature_sensor = A2;

// We'll need this variables to calculate the temperature in Celcius
float temperature;
int B=3975;// B value of the thermistor - we got this from the documentation
float resistance;


void setup() {
  // put your setup code here, to run once:
  // Start a serial connection with a baud rate of 9600
  Serial.begin(9600);

  // Set the sensor pins to be inputs
  pinMode(potentiometer, INPUT);
  pinMode(sound_sensor, INPUT);
  pinMode(temperature_sensor, INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:

  // This chunk we've just lifted off the Grove_Temperature_Sensor example
  // Read the value of the temperaure sensor and assign it to a variable called 'val'
  int val = analogRead(temperature_sensor);                    // get analog value
  // No need trying to figure this out on your own, they already did the work :)
  resistance = (float)(1023-val)*10000/val;                      // get resistance
  temperature = 1/(log(resistance/10000)/B+1/298.15)-273.15;     // calc temperature

  // Convert the temperature value to integer and send it via a serial port
  Serial.print(temperature);
  // Send a TAB symbol for separation
  Serial.print("\t");
  
  // Read the value of the potentiometer and assign it to a variable called 'val'  
  val = analogRead(potentiometer);
  // Send the 'val' and the TAB symbol down the serial port
  Serial.print(val);
  Serial.print("\t");

  // Read the value of the sound sensor and assign it to a variable called 'val'
  val = analogRead(sound_sensor);
  // Send the 'val' and the TAB symbol down the serial port
  Serial.print(val);
  Serial.print("\t");
  // We'll read those values in Processing in the same order in which we sent them

  // Send an empty line to the the End-Of-Line character to signify the end of transmission
  Serial.println();
  // Take a breather for 100 milliseconds
  delay(100);
}

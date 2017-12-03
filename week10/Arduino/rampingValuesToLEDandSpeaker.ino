// plug the LED into pin 3
int ledPin = 3;
// plug the button into pin 2
int buttonPin = 2;
// plug the speaker into pin 5
int speakerPin = 5;
/*
Pins 3 and 5 have the capability that is missing on pin 2: PWM, pulse width modulation.
This allows us to write analog - or a range of values - to them
For more on PWM see https://www.arduino.cc/en/Tutorial/PWM and https://www.arduino.cc/en/Reference/AnalogWrite
*/
// start the tone at 31 Hz - the lowest note avaliable on Arduino
// see https://www.arduino.cc/en/Reference/Tone for more details
int toneVal = 31;

void setup() {
  // set the LED and speaker pins to be outputs and the button pin to be an input
  pinMode(ledPin, OUTPUT);
  pinMode(speakerPin, OUTPUT);
  pinMode(buttonPin, INPUT);
}

void loop() {
  // if the readout from the button is not (!) true, meaning it's not pressed
  if( !digitalRead(buttonPin) ){
    //stop any tone from the speaker
    noTone(speakerPin);
    // run through a ramp up of values from 0 to 255
    for( int i = 0; i < 256; i++ ){
      // write each of those values to the LED pin one by one causing to the get gradually brighter
      analogWrite(ledPin, i);
      delay(5);
    }
    delay(200);
    // run through a ramp down of values from 254 to 0
    for( int i = 254; i >= 0; i-- ){
      // write each of those values to the LED pin one by one causing to the get gradually dimmer
      analogWrite(ledPin, i);
      delay(5);
    }
    delay(200);
   }
   // if the readout from the button is true - the opposite of what we're cheking for on line 25 - meaning it is pressed
   else {
    // play a tone of the frequency currently contained in toneVal through speakerPin, or in our case pin 5
    tone(speakerPin, toneVal);
    delay(40);
   }

   // increase the frequency contained in toneVal by 25 Hz every loop
   toneVal += 25;
   // if it reached or exceeded 3000 Hz - reset it back to 31 Hz
   if(toneVal >= 3000){
    toneVal = 31;
    }
}

// add a library of servo functions
#include <Servo.h>

// create a servo varaible
Servo myServo;
// assign pins
int buttonPin = 2;
int ledPin = 3;
int touchPin = 4;
int servoPin = 5;// this needs to be a PWM pin

// set positions
int defaultPos = 90;// servo position to reset to
int pos = 0; //this is position in degrees

// track states
bool direction_up = true; // true is up, false is down
bool manual_mode = true; // true is manual mode, false is automatic

void setup() {
  pinMode(buttonPin, INPUT);
  pinMode(ledPin, INPUT);
  pinMode(touchPin, INPUT);
  
  myServo.attach(servoPin);

  Serial.begin(9600);
}

void loop() {
  if (digitalRead(buttonPin) == HIGH) { // if we're detecting a button press
    manual_mode = !manual_mode; // change the mode to the opposite
    delay(300); // add a delay to give us time to lift a figer off the button
    // reset things to the way they were in the beginning of the sketch
    pos = defaultPos;
    myServo.write(pos);
    direction_up = true;
  }

  if(manual_mode){ // if the mode is manual - see line 18
    // every time you touch the sensor - move the servo
    if (digitalRead(touchPin) == HIGH) { // if we're detecting a touch sensor press
      moveServo();
    } // end of read touch pin
  }
  else { // if the mode is NOT manual, hence automatic - see line 18
    moveServo();
  } // end of else for read touch pin
  Serial.println(pos); // print the value stored in `pos` at this point
} // end of loop


// this function groups a set of actions that we need to take
// several times under different circumstances
// it allows us to refernce the whole group of actions as a whole
// simple by calling the function's name in the code - see lines 43 and 47
void moveServo(){
  myServo.write(pos); // set servo to the degrees stored in the `pos` variable
  delay(500); // add a delay to give us time to lift a figer off the touch sensor

  // switch through serveral possible values stored in `pos` variable
  switch (pos) {
    case 0: // in case the value is 0
      servo_direction = !servo_direction; // switch to the opposite value of direction - see line 14
      pos = pos + 10; // add ten degrees to the value of `pos`
      break; // done switching
    case 180: // in case the value is 180
      servo_direction = !servo_direction; // switch to the opposite value of direction - see line 14
      pos = pos - 10; // subtract ten degrees from the value of `pos`
      break; // done switching
    default: // in all other cases
      if (servo_direction == true) { // if we're going up - see line 14
        pos = pos + 10; // adding 10 degrees to the position
      }
      else { // otherwise (if we're going down)
        pos = pos - 10; // subtracting 10 degrees from position
      }
      break; // done switching
  } // end of switch
}

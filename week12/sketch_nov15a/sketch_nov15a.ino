// add a library of servo functions
#include <Servo.h>

// create a servo varaible
Servo myServo;

int touchPin = 4;
int servoPin = 5;// this needs to be a PWM pin
int buttonPin = 2;

int defaultPos = 0;// servo position to reset to
int pos = 0; //this is position in degrees

bool servo_direction = false; // true is up, false is down
bool mode = false; // true is manual mode, false is automatic

void setup() {
  pinMode(touchPin, INPUT);
  pinMode(buttonPin, INPUT);
  myServo.attach(servoPin);

  Serial.begin(9600);
}

void loop() {
  if (digitalRead(buttonPin) == HIGH) { // if we're detecting a button press
    mode = !mode; // change the mode to the opposite
    delay(500); // add a delay to give us time to lift a figer off the button

    // reset things to the way they were in the beginning of the sketch
    myServo.write(defaultPos);
    pos = defaultPos;
    servo_direction = false;
  }

  if(mode == true){ // if the mode is manual - see line 15
    // every time you touch the sensor
    // move the servo and increment its position by 10 degrees
    if (digitalRead(touchPin) == HIGH) { // if we're detecting a touch sensor press
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
    } // end of read touch pin
  }
  else { // if the mode is NOT manual, or automatic - see line 15
    switch(pos){
      case 0: // in case the value is 0
        servo_direction = !servo_direction; // switch to the opposite value of direction - see line 14
        pos = pos + 10; // add ten degrees to the value of `pos`
        break; // done switching
      case 180: // in case the value is 180
        servo_direction = !servo_direction; // switch to the opposite value of direction - see line 14
        pos = pos - 10; // subtract ten degrees from the value of `pos`
        break; // done switching
      default: // in all other cases
        myServo.write(pos); // set servo to the degrees stored in the `pos` variable
        delay(15); // add a small delay to let things settle down
        if(servo_direction == true) { // if we're going up - see line 14
          pos = pos + 10; // adding 10 degrees to the position
        }
        else { // otherwise (if we're going down)
          pos = pos - 10; // subtracting 10 degrees from position
        }
        break; // done switching
    } // end of switch
  } // end of else for read touch pin
  Serial.println(pos); // print the value stored in `pos` at this point
} // end of loop

int buttonPin = 2;
int speakerPin = 3;
int toneVal = 31;

void setup() {
  // put your setup code here, to run once:
  pinMode(buttonPin, INPUT);
  pinMode(speakerPin, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(digitalRead(buttonPin)){
    tone(speakerPin, toneVal);
    delay(40);
  }
  else {
    noTone(speakerPin);
  }
  toneVal += 25;
  if(toneVal >= 3000){
    toneVal = 31;
  }

  Serial.println(toneVal);
}

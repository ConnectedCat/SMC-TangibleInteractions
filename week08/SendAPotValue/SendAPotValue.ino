int pot = A0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(pot, INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  Serial.println( analogRead(pot) );

  delay(10);
}

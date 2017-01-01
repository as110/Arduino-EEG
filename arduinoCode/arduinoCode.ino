void setup() {
  // put your setup code here, to run once:
  Serial.begin(28800);
//  char a = 'b';
//  while (a !='a')
//  {
//    a = Serial.read();
//  }
}

void loop() {
  // put your main code here, to run repeatedly:
  int sensorValue = analogRead(A4);
  // Convert the analog reading (which goes from 0 - 1023) to a voltage (0 - 5V):
  float voltage = sensorValue * (5.0 / 1023.0);
  Serial.println(voltage);
}

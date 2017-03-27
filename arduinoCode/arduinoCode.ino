void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
//  char a = 'b';
//  while (a !='a')m
//  {
//    a = Serial.read();
//  }
}

void loop() {
  // put your main code here, to run repeatedly:
  int sensorvalue = analogRead(A4);
  // Convert the analog reading (which goes from 0 - 1023) to a voltage (0 - 5V):
//  float voltage = sensorValue * (5.0 / 1023.0);
  Serial.println(sensorvalue);
}

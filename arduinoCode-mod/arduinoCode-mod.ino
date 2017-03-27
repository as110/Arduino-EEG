#define sensorPin A2

void setup ()
{ 
  Serial.begin(230400); // or 3456000 or 500000
}

void loop()
{
  int val = analogRead(sensorPin);  // about 8K samples per second
  Serial.println(val);
}

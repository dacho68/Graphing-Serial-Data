void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
}

int8_t x;
int8_t y = 75;
int8_t z = 150;
void loop() {
  // put your main code here, to run repeatedly:
  x++;
  y++;
  z++;
  Serial.print(x);
  Serial.print(",");
  Serial.print(y);
  Serial.print(",");
  Serial.print(z);
  Serial.print("\n");
  delay(50);
}

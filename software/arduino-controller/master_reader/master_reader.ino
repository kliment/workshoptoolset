#include <Wire.h>


void setparams(int targettemp=250, int maxpower=60, int defaulttemp=320, int idlesecs=120, int offmins=5, int tempoffset=0){
  Wire.beginTransmission(0x33);
  Wire.write(0);//ignored
  uint8_t ttemp=constrain(targettemp,0,500)/2;
  Wire.write(ttemp);//setpoint
  uint8_t mp=constrain(maxpower,0,90);
  Wire.write(mp);//max power
  uint8_t dt=constrain(defaulttemp,0,500)/2;
  Wire.write(dt);//default temp
  uint8_t is=constrain(idlesecs,0,255);
  Wire.write(0);//idle after seconds, 0 to disable
  uint8_t om=constrain(offmins,0,255);
  Wire.write(0);//off after minutes, 0 to disable
  uint8_t os=127+constrain(tempoffset,-126,126);
  Wire.write(os);//temp sensor offset
  Wire.endTransmission();
}

void setup() {
  Wire.begin();        // join i2c bus (address optional for master)
  Serial.begin(115200);  // start serial for output
  Serial.println("starting up");
  setparams(0); //set iron target temperature to 0, set all other parameters to defaults
  
}


void loop() {
  Serial.println("Starting read");
  Wire.beginTransmission(0x33);
  Wire.write(0);
  Wire.endTransmission();
  Wire.requestFrom(0x33, 9);    // request 9 bytes from slave device #8

  while (Wire.available()) { // slave may send less than requested
    int c = Wire.read(); // receive a byte as character
    Serial.print(c);         // print the character
    Serial.print(',');
  }
  Serial.println(" read");
  
  delay(500);
}

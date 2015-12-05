
/*
 Servo Sweep example for Educational BoosterPack MK II
 http://boosterpackdepot.info/wiki/index.php?title=Educational_BoosterPack_MK_II
 
 based on Sweep example by Barragan created on Wiring
 
// Sweep
// by BARRAGAN <http://barraganstudio.com> 

The circuit:
* servo connected to pin 19

Modified 03 Dec 2013
by Dung Dang

This example code is in the public domain.
*/

#include <Servo.h> 
 
Servo myservo1,myservo2; 
 
void setup() 
{ 
  myservo1.attach(18);  
  myservo2.attach(19);
  Serial.begin(115200);
} 
 
 
void loop() 
{ 
  int pos1 = 0, pos2 = 0, flag = 0;
  char temp;
  while(!Serial.available());
  delayMicroseconds(500);
  while(Serial.available())    
      pos1 = pos1*10 + (Serial.read() - '0');
  while(!Serial.available());
  delayMicroseconds(500);
  while(Serial.available())    
      pos2 = pos2*10 + (Serial.read() - '0');
  myservo1.writeMicroseconds(pos1);;
  myservo2.writeMicroseconds(pos2);
} 

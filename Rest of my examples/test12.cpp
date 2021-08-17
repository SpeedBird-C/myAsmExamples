#include<iostream>
struct Package {
     long originZip; //4
     long destinationZip; //4
     float shippingPrice; //4
};
int main() {
     char myChar;
     bool myBool;
     short myShort;
     int myInt;
     long myLong;
     float myFloat;
     double myDouble;
     Package myPackage;
     
     long double myLongDouble;
     long myLongArray[10];
     myInt=5;

    /* __asm {
          mov eax, myPackage.destinationZip
          mov eax, LENGTH myInt
          mov eax, LENGTH myLongArray
          mov eax, TYPE myChar
          mov eax, TYPE myBool
          mov eax, TYPE myShort
          mov eax, TYPE myInt
          mov eax, TYPE myLong
          mov eax, TYPE myFloat
          mov eax, TYPE myDouble
          mov eax, TYPE myPackage
          mov eax, TYPE myLongDouble
          mov eax, TYPE myLongArray
          mov eax, SIZE myLong
          mov eax, SIZE myPackage
          mov eax, SIZE myLongArray
     }*/
}
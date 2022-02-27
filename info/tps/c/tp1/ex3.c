/**
  * TP1 EX3
  * Hugo SALOU
  * 16/09/2021
  * V1.0.0
  * Depassement de capacité des types
  */

#include<stdio.h>
#include<stdint.h>

void main() {

  uint8_t int1 = 255;
  uint8_t int2 = 259;
  uint8_t int3 = 0;
  uint8_t int4;
  uint8_t int5 = -5;

  printf("Premier entier %d stocke sur %ld octet\n", int1, sizeof(int1));
  printf("Second entier %d stocke sur %ld octet\n", int2, sizeof(int2));
  printf("Cinquieme entier %d stocke sur %ld octet\n", int5, sizeof(int5));

  int4 = int1 + int2;
  printf("Somme de deux entiers : int1 + int2 = %d stocke sur %ld octet \n", int4, sizeof(int4));

  printf("\n\n");
}
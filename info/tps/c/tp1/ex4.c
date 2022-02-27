/**
  * TP1 EX4
  * Hugo SALOU
  * 16/09/2021
  * V1.0.0
  * Conversion de type d'entiers
  */

#include<stdio.h>

void main(){
  unsigned short int1 = 10;
  unsigned short int2 = 32767;
  unsigned int int3 = 100;
  unsigned int int4 = 69755;
  float float1 = 15.0;
  float float2 = 6;
  unsigned short resultShort;
  unsigned int resultInt;
  float resultFloat;

  printf("Etat inital des variables\n");
  printf("-------------------------\n");
  printf("Short int1: %d de taille %ld \n", int1, sizeof(int1));
  printf("Short int2: %d de taille %ld \n", int2, sizeof(int2));
  printf("Int int3: %d de taille %ld \n", int3, sizeof(int3));
  printf("Int int4: %d de taille %ld \n", int4, sizeof(int4));
  printf("Float float1: %f de taille %ld \n", float1, sizeof(float1));
  printf("Float float2: %f de taille %ld \n", float2, sizeof(float2));

  printf("\n\n");

  printf("Resultat d'opération et de conversions\n");
  printf("--------------------------------------\n");

  resultShort = int1 / int2;
  printf("Short <- int1 / int2 soit %d / %d = %d \n", int1, int2, resultShort);
  resultFloat = int1 / int2;
  printf("Float <- int1 / int2 soit %d / %d = %f \n", int1, int2, resultFloat);
  resultFloat = int1 / (float)int2;
  printf("Float <- int1 / float(int2) soit %d / %d = %f \n", int1, int2, resultFloat);

  printf("\n");

  resultShort = int3 / float1;
  printf("Short <- int3 / float1 soit %d / %f = %d \n", int3, float1, resultShort);
  resultFloat = int3 / float1;
  printf("Float <- int3 / float1 soit %d / %f = %f \n", int3, float1, resultFloat);

  printf("\n");
  resultShort = (short)int4;
  printf("Conversion de int4 = %d en short %d \n", int4, resultShort);
  
  printf("\n");
  resultInt = int4 % int3;
  printf("Int <- int4 mod int3 soit %d mod %d = %d de taille %d", int4, int3, resultInt);
  printf("\n");
}
/**
  * TD1 EX2
  * Hugo SALOU
  * 09/09/2021
  * V1.0.0
  * Connaitre la taille mémoire de differents nombres avec différents types
  */

#include<stdio.h>
#include<stdint.h>


void main() {
  printf("Pour les int8_t: \n");
  printf("\t int8_t : valeur de -8 \t\t\t stocke sur %ld octet\n", sizeof((int8_t) -8));
  printf("\tuint8_t : valeur de  8 \t\t\t stocke sur %ld octet\n", sizeof((uint8_t) 8));
  printf("\n");


  printf("Pour les int32_t: \n");
  printf("\t int32_t : valeur de -32 \t\t stocke sur %ld octet\n", sizeof((int32_t) -32));
  printf("\tuint32_t : valeur de  32 \t\t stocke sur %ld octet\n", sizeof((uint32_t) 32));
  printf("\n");


  printf("Pour les int64_t: \n");
  printf("\t int64_t : valeur de -64 \t\t stocke sur %ld octet\n", sizeof((int64_t) -64));
  printf("\tuint64_t : valeur de  64 \t\t stocke sur %ld octet\n", sizeof((uint64_t) 64));
  printf("\n");
}
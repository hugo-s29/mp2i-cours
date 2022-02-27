/**
  * TD1 EX1
  * Hugo SALOU
  * 09/09/2021
  * V1.0.0
  * Affiche l'age dans différentes bases
  */


#include<stdio.h>

void main() {
  printf("Bonjour, quel age avez vous ? ");

  int age;
  scanf("%d", &age);

  printf("Vous avez %d ans \n", age);
  printf("En octal, cela vous fait %o ans \n", age);
  printf("En hexadecimal, cela vous fait %x ans \n", age);

  printf("\n");

  printf("Vous en paraissez %d...\n", age - 5);
}

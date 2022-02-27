/**
  * TP2 Exercice 0
  * Hugo SALOU
  * 23/09/2021
  * V1.O.0
  * Ecrire les multiples de 9
  */

#include<stdio.h>

void main() {
  for(int i = 0; i < 20; i++) {
    printf("%d x 9 = %d\n", i + 1, (i + 1) * 9);
  }
}
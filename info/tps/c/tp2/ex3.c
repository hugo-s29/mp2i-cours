/**
  * TP2 Exercice 3
  * Hugo SALOU
  * 23/09/2021
  * V1.O.0
  * Tri de nombres
  */

#include<stdio.h>

void main() {
  int a, b, c;
  int temp;

  printf("Nombres a trier ? ");
  scanf("%d %d %d", &a, &b, &c);
  printf("\n");

  while(a < b || b < c) {
    if (b < c) {
      temp = b;
      b = c;
      c = temp;
    }
    if (a < b) {
      temp = a;
      a = b;
      b = temp;
    }
  }

  printf("Nombres tries: %d %d %d", c, b, a);
}
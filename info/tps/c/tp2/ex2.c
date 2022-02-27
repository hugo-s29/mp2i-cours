/**
  * TP2 Exercice 2
  * Hugo SALOU
  * 23/09/2021
  * V1.O.0
  * Termes de la serie harmonique
  */

#include<stdio.h>

void main() {
  unsigned int n;
  
  printf("Nombre de termes ? ");
  scanf("%u", &n);
  printf("\n");

  if(n == 0) {
    printf("Erreur: au moins 1 terme \n");
    return;
  }

  double harmonique = 0;

  for(int i = 1; i <= n; i++) {
    harmonique += 1. / i;
  }

  printf("Somme de la serie harmonique: %f\n", harmonique);
}
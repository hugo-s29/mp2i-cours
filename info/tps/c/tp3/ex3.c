/**
  * TP3 Exercice 3
  * Hugo SALOU
  * 08/10/2021
  * V1.0.0
  * Manipulation de tableaux
  */


#include<stdio.h>
#include<time.h>

void main() {
  int tableau[5] = {17, 97, 14, 74, 92};

  for (int i = 0; i < 5; i++) {
    int aux = tableau[i];
    int j = i;

    while(j > 0 && tableau[j - 1] > aux) {
      tableau[j] = tableau[j - 1];
      j--;
    }

    tableau[j] = aux;

    printf("Iteration %d\n", i + 1);
    for(int k = 0; k < 5; k++) {
      printf("\t%d", tableau[k]);
    }

    printf("\n\n");
  }
}
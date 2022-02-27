/**
  * TP4 Ex2
  * Hugo SALOU
  * 14/10/2021
  * V1.0.0
  * Météo de la semaine
  */

#include <stdio.h>

enum Jour {
  LUNDI,
  MARDI,
  MERCREDI,
  JEUDI,
  VENDREDI,
  SAMEDI,
  DIMANCHE,
};

void main() {
  float temperatures[7];
  char noms[7][10] = {"lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi", "dimanche"};

  // Entree des valeurs
  for(int j = LUNDI; j <= DIMANCHE; j++) {
    printf("Quelle est la temperature du %s ? \n", noms[j]);
    scanf("%f", &temperatures[j]);
    printf("\n");
  }

  // Minimum, Maximum
  int min = 0, max = 0;
  for(int j = LUNDI; j <= DIMANCHE; j++) {
    float temp = temperatures[j];

    if(temp <= temperatures[min]) {
      min = j;
    }

    if(temp >= temperatures[max]) {
      max = j;
    }
  }

  printf("La tempeture minimale de la semaine : %.1f, le %s\n", temperatures[min], noms[min]);
  printf("La tempeture maximale de la semaine : %.1f, le %s\n", temperatures[max], noms[max]);
}
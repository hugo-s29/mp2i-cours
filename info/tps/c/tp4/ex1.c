/**
  * TP4 Ex1
  * Hugo SALOU
  * 14 Octobre 2021
  * V1.0.0
  * Escalade aux JO
  */

#include<stdio.h>

typedef struct Athlete {
  char nom[20];
  char prenom[20];
  char nationalite[5];
  int vitesse, bloc, difficulte;
  int total;
} Grimpeur;


void main() {
  Grimpeur escalade[5] = {
    { "Narasaki", "Tomoa    ", "jpn", 2, 3, 6 },
    { "Mawem   ", "Mickael  ",  "fr", 3, 2, 7 },
    { "Coleman ", "Nathaniel", "usa", 6, 1, 5 },
    { "Schubert", "Jakob    ", "aut", 7, 5, 1 },
    { "Lopez   ", "Alberto  ", "esp", 1, 7, 4 },
  };

  // Calcul du total
  for(int i = 0; i < 5; i++) {
    Grimpeur g = escalade[i];
    escalade[i].total = g.difficulte * g.bloc * g.vitesse;
  }

  // Tri
  int n = 5;
  for (int i = 0; i < n; i++) {
    Grimpeur aux = escalade[i];
    int j = i;

    while(j > 0 && escalade[j - 1].total > aux.total) {
      escalade[j] = escalade[j - 1];
      j--;
    }

    escalade[j] = aux;
  }

  // Affichage
  printf("SCORES ESCALADE\n");
  printf("---------------\n");

  printf("Nom\t\tPrenom\t\tNat\tBloc\tVit\tDif\tTotal\n");
  
  for(int i = 0; i < 5; i++) {
    Grimpeur g = escalade[i];

    printf(
      "%s\t%s\t%s\t%d\t%d\t%d\t%d\n",
      g.nom, g.prenom, g.nationalite, 
      g.bloc, g.vitesse, g.difficulte,
      g.total
    );
  }



}
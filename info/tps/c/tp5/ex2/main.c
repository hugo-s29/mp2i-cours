/**
  * TP5 Exercice 2
  * Hugo SALOU
  * 21/10/2021
  * V1.0.0
  * Volume de formes geometriques
  */

#include <stdio.h>
#include <stdbool.h>

#include "surface.h"
#include "volume.h"

int afficheMenu();
double getValue(char text[]);

void main() {
  int choix = afficheMenu();

  switch (choix) {
    case 1:{
      printf(
        "La surface du rectangle est %f",
        rectangle(getValue("Largeur"), getValue("Longueur"))
      );
      break;
    }

    case 2:{
      printf(
        "La surface du disque est %f",
        disque(getValue("Rayon"))
      );
      break;
    }

    case 4:{
      printf(
        "La surface laterale du cylindre est %f",
        enveloppeCylindre(getValue("Rayon"), getValue("Hauteur"))
      );
      break;
    }
    

    case 5:{
      printf(
        "La volume du prisme droit est %f",
        prisme(getValue("Largeur"), getValue("Hauteur"), getValue("Longueur"))
      );
      break;
    }
    
    case 6:{
      printf(
        "La volume du cylindre est %f",
        cylindre(getValue("Rayon"), getValue("Hauteur"))
      );
      break;
    }

    case 7:{
      printf(
        "La volume du cone est %f",
        cone(getValue("Rayon"), getValue("Hauteur"))
      );
      break;
    }

    case 8:{
      printf(
        "La volume de la sphere est %f",
        sphere(getValue("Rayon"))
      );
      break;
    }
  }

  printf("\n\n");
}


int afficheMenu() {
  int choix;
  bool ok = false;

  while(!ok) {
    printf("Choix du calcul a effectuer: \n");
    printf("\t1 - Surface rectangle\n");
    printf("\t2 - Surface disque\n");
    printf("\t3 - Surface sphere\n");
    printf("\t4 - Surface laterale cylindre\n");
    printf("\t5 - Volume prisme droit\n");
    printf("\t6 - Volume cylindre\n");
    printf("\t7 - Volume cone\n");
    printf("\t8 - Volume sphere\n");
    
    printf("Votre choix : ");
    scanf("%d", &choix);

    if (choix >= 0 && choix < 8) {
      ok = true;
    } else {
      printf("Choix invalide \n");
    }
  }

  return choix;
}

double getValue(char text[]) {
  printf("%s : ", text);
  
  double val;
  scanf("%lf", &val);
  return val;
} 
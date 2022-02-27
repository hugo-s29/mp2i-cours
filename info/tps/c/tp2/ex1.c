/**
  * TP2 Exercice 1
  * Hugo SALOU
  * 23/09/2021
  * V1.O.0
  * Calculatrice
  */

#include<stdio.h>
#include<stdint.h>
#include<stdbool.h>

void main() {
  uint8_t op;
  int a, b;

  int result;
  char op_char;

  while(true) {
    printf("Quelle operation souhaitez-vous realiser ? \n");
    printf("\t\t\t - 1 pour l'addition \n");
    printf("\t\t\t - 2 pour la soustraction \n");
    printf("\t\t\t - 3 pour la multiplication \n");
    printf("\t\t\t - 4 pour la division \n");

    printf("calc>");
    scanf("%hhd", &op);

    printf("\nPremier nombre ?\n>");
    scanf("%d", &a);

    printf("\nSecond nombre ?\n>");
    scanf("%d", &b);

    switch(op) {
      case 1: {
        op_char = '+';
        result = a + b;
        
        printf("Le resultat est : %d %c %d = %d \n", a, op_char, b, result);
        break;
      }
      
      case 2: {
        op_char = '-';
        result = a - b;
        
        printf("Le resultat est : %d %c %d = %d \n", a, op_char, b, result);
        break;
      }
      
      case 3: {
        op_char = '*';
        result = a * b;
        
        printf("Le resultat est : %d %c %d = %d \n", a, op_char, b, result);
        break;
      }

      case 4: {
        if(b == 0) {
          printf("\nErreur: Division par 0\n");
          return;
        }

        double result = (double)a / b;
        
        printf("Le resultat est : %d / %d = %f \n", a, b, result);
        break;
      }
    }

    fflush(stdin);
    int next_int;
    printf("Continuer ? (1/0) ");
    scanf("%d", &next_int );
    printf("\n");

    if(next_int  == 0) {
      break;
    }

  }
}

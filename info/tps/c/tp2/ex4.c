/**
  * TP2 Exercice 4
  * Hugo SALOU
  * 23/09/2021
  * V1.O.0
  * Plus ou moins
  */

#include<stdio.h>
#include<stdbool.h>
#include<time.h>

void main() {
  srand(time(NULL));

  int num, num2, next;

  while(true){
    num = rand() % 100;
    printf("PST, %d \n", num);

    int i;
    for(i = 0; i < 10; i++) {
      printf("Essai %d\nChoix entre 0 et 100 ? ", i + 1);
      scanf("%d", &num2);
      printf("\n");

      if(num == num2) {
        break;
      } else {
        printf("Mauvaise reponse\nLe nombre est ");
        
        if (num < num2)
          printf("plus petit\n");
        else
          printf("plus grand\n");
      }
    }

    if (i == 9) {
      printf("Perdu, le nombre etait %d\n", num);
    } else {
      printf("Felicitation, trouve avec %d essais\n", i + 1);
    }

    printf("Nouvelle partie ? (1 / 0)");
    scanf("%d", &next);

    if(next == 0) {
      break;
    } else {
      continue;
    }
  }
}
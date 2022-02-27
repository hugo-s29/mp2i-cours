/**
  * TP5 EX1
  * Hugo SALOU
  * 21/10/2021
  * V1.0.0
  * Conversion °F-°C
  */

#include<stdio.h>

float convertToFahrenheit(float celsius);
float convertToCelsius(float fahrenheit);

void main() {
  int cmd;
  float temp;

  printf("Quelle conversion souhaitez-vous faire ?\n");
  printf("\t1 - Conversion Celsius vers Fahrenheit\n");
  printf("\t2 - Conversion Fahrenheit vers Celsius\n");

  scanf("%d", &cmd);

  switch(cmd) {
    case 1: {
      printf("Temperature en degres Celsius à convertir : ");
      scanf("%f", &temp);

      printf(
        "Une temprerature de %.2f degres C correspond a %.2f degres F",
        temp, convertToFahrenheit(temp)
      );

      break;
    }

    case 2: {
      printf("Temperature en degres Fahrenheit à convertir : ");
      scanf("%f", &temp);

      printf(
        "Une temprerature de %.2f degres F correspond a %.2f degres C",
        temp, convertToCelsius(temp)
      );

      break;
    }
  
    default: {
      printf("Mauvaise commande");
      break;
    }
  }

  printf("\n\n");
}




float convertToFahrenheit(float celsius) {
  return (9. / 5.) * celsius + 32; 
}

float convertToCelsius(float fahrenheit) {
  return (fahrenheit - 32) * (5. / 9.);
}
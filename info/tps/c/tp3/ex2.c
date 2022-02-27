/**
  * TP3 Ex2
  * Hugo SALOU
  * 30/09/2021
  * V1.0.0
  * Operations de matrices
  */

#include<stdio.h>
#include<time.h>


void main() {
  srand(time(NULL));

  int mat1[2][3];
  int mat2[2][3];

  for(int i = 0; i < 2; i++){ 
    for(int j = 0; j < 3; j++) {
      mat1[i][j] = rand() % 100;
      mat2[i][j] = rand() % 100;
    }
  }

  printf("Matrice 1: \n");
  printf("---------- \n");
  printf("\n");
  
  printf("\t[\t%d\t%d\t%d\t]\n", mat1[0][0], mat1[0][1], mat1[0][2]);
  printf("\t[\t%d\t%d\t%d\t]\n", mat1[1][0], mat1[1][1], mat1[1][2]);

  printf("\n");
  printf("Matrice 2: \n");
  printf("---------- \n");
  printf("\n");

  printf("\t[\t%d\t%d\t%d\t]\n", mat2[0][0], mat2[0][1], mat2[0][2]);
  printf("\t[\t%d\t%d\t%d\t]\n", mat2[1][0], mat2[1][1], mat2[1][2]);
  
  int mat_linearisee[6];

  for(int i = 0; i < 2; i++) {
    for(int j = 0; j < 3; j++) {
      int k = i * 3 + j;
      mat_linearisee[k] = mat1[i][j];
    }
  }

  printf("\n");
  printf("Matrice 2 linearisee: \n");
  printf("--------------------- \n");
  printf("\n");

  printf(
    "\t[\t%d\t%d\t%d\t%d\t%d\t%d\t]\n",
    mat_linearisee[0],
    mat_linearisee[1],
    mat_linearisee[2],
    mat_linearisee[3],
    mat_linearisee[4],
    mat_linearisee[5]
  );

  int mat_add[2][3];
  int mat_mult[2][3];

  for (int i = 0; i < 2; i ++) {
    for(int j = 0; j < 3; j++) {
      mat_add[i][j]  = mat1[i][j] + mat2[i][j];
      mat_mult[i][j] = mat1[i][j] * mat2[i][j];
    }
  }


  printf("\n");
  printf("Somme termes a termes: \n");
  printf("---------------------- \n");
  printf("\n");

  printf("\t[\t%d\t%d\t%d\t]\n", mat_add[0][0], mat_add[0][1], mat_add[0][2]);
  printf("\t[\t%d\t%d\t%d\t]\n", mat_add[1][0], mat_add[1][1], mat_add[1][2]);



  printf("\n");
  printf("Produit terme a terme: \n");
  printf("---------------------- \n");
  printf("\n");

  printf("\t[\t%d\t%d\t%d\t]\n", mat_mult[0][0], mat_mult[0][1], mat_mult[0][2]);
  printf("\t[\t%d\t%d\t%d\t]\n", mat_mult[1][0], mat_mult[1][1], mat_mult[1][2]);



}


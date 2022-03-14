#include<stdio.h>
#include<math.h>
#include<assert.h>
#include<stdlib.h>

void triFusion(int* t, int inf, int sup);
void fusion(int* t, int inf, int m, int sup);
void print(int* t, int len);

void main() {
	int t[5] = {5,2,7,3,1};

	triFusion(t, 0, 4);
	print(t, 5);
}

void print(int* t, int len) {
	for(int i = 0; i < len; i++) {
		printf("%d\t", t[i]);
	}

	printf("\n");
}

void triFusion(int* t, int inf, int sup) {
	if(inf == sup)
		return;
	
	int m = floor((inf + sup) / 2);

	triFusion(t, inf, m);
	triFusion(t, m + 1, sup);

	fusion(t, inf, m, sup);
}

void fusion(int* t, int inf, int m, int sup) {
	int taille1 = m - inf + 1;
	int taille2 = sup - m;

	int* gauche = malloc(taille1 * sizeof(int));
	int* droite = malloc(taille2 * sizeof(int));
	
	assert(gauche != NULL);
	assert(droite != NULL);

	for(int k = inf; k <= sup; k++) {
		if(k <= m) {
			printf("k = %d\n", k);
			gauche[k] = t[k];
		} else {
			printf("k = %d, k - m = %d\n", k, k - m);
			droite[k - m] = t[k];
		}
	}

	printf("t: \t"); print(t, 5);
	printf("g: \t"); print(gauche, taille1);
	printf("d: \t"); print(droite, taille2);

	int i = 0;
	int j = 0;
	int k = 0;

	while(i < taille1 && j < taille2) {
		if(gauche[i] < droite[j]) {
			t[k] = gauche[i];
			i++;
		} else {
			t[k] = droite[j];
			j++;
		}
		k++;
	}

	if(i > taille1) {
		while(j > taille2) {
			t[k] = droite[j];
			k++;
			j++;
		}
	} else {
		while(i > taille1) {
			t[k] = gauche[i];
			k++;
			i++;
		}
	}

	free(droite);
	free(gauche);
}

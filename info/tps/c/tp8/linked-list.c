#include<stdio.h>
#include<stdlib.h>
#include<assert.h>
#include<stdbool.h>

#include "linked-list.h"


noeud* creer_element(int info) {
	noeud* elem = malloc(sizeof(noeud));
	assert(elem != NULL);

	elem->info = info;
	elem->suivant = NULL;

	return elem;
}

liste_chainee* creer_liste_chainee(int premiere_valeur) {
	liste_chainee* liste = malloc(sizeof(liste_chainee));
	assert(liste != NULL);

	noeud* premier_elem = creer_element(premiere_valeur);
	liste->premier_element = premier_elem;

	return liste;
}


void affiche_liste_chainee(liste_chainee* liste) {
	noeud* elem = liste->premier_element;
	bool premier = true;

	printf("[ ");

	while (elem != NULL) {
		if (premier) {
			printf("%d", elem->info);
			premier = false;
		} else {
			printf(", %d", elem->info);
		}


		elem = elem->suivant;
	}

	printf(" ]\n");
}

noeud* acceder_element_liste_chainee(liste_chainee* liste, int index) {
	noeud* elem = liste->premier_element;

	for (int i = 0; i < index; i++){
		if (elem == NULL) return NULL;

		elem = elem->suivant;
	}

	return elem;
}

int inserer_noeud_liste_chainee(liste_chainee* liste, noeud* elem, int index) {
	if (index < 0) return -1;

	if (index == 0) {
		elem->suivant = liste->premier_element;
		liste->premier_element = elem;

		return 0;
	}

	noeud* elem_prec = acceder_element_liste_chainee(liste, index - 1);

	if (elem_prec == NULL) return -1;

	elem->suivant = elem_prec->suivant;
	elem_prec->suivant = elem;

	return 0;
}

int enlever_noeud_liste_chainee(liste_chainee* liste, int index) {
	noeud* elem, *suivant, *a_retirer;

	if (index < 0) return -1;

	if (index == 0) {
		elem = liste->premier_element;
		liste->premier_element = elem->suivant;

		free(elem);

		return 0;
	}

	elem = acceder_element_liste_chainee(liste, index - 1);
	a_retirer = acceder_element_liste_chainee(liste, index);
	suivant = acceder_element_liste_chainee(liste, index + 1);

	free(a_retirer);
	elem->suivant = suivant;
}


int longueur_liste_chainee(liste_chainee* liste) {
	noeud* elem = liste->premier_element;
	int i = 0;

	while (elem != NULL) {
		i++;
		elem = elem->suivant;
	}

	return i;
}
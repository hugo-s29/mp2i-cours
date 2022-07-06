#include<stdio.h>

#include "linked-list.h"

void main() {
	liste_chainee* liste = creer_liste_chainee(1);

	inserer_noeud_liste_chainee(liste, creer_element(10), 0);
	inserer_noeud_liste_chainee(liste, creer_element(50), 2);

	affiche_liste_chainee(liste);
	printf("%d\n", longueur_liste_chainee(liste));

	enlever_noeud_liste_chainee(liste, 1);

	printf("%d\n", longueur_liste_chainee(liste));
	affiche_liste_chainee(liste);

	scanf_s("%s", NULL);
}
/* Diviser pour régner
10 mars 2022
Bastien DUFOUR
Hugo SALOU
Aubin SIONVILLE
Charlotte SOUEDET*/

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <math.h>

// STRUCTURES ET TYPES UTILES

typedef struct s_point{
	float x; //coordonnee en x
	float y; //coordonnee en y
}point;

//typedef struct noeud;

typedef struct s_noeud{
	point* contenu; //points dans la case, il y en a 5 car on va tester un tableau de 5 valeurs
	struct s_noeud *fils_gauche;
	struct s_noeud *fils_droit;
	struct s_noeud *parent;
	int len;
} noeud;

int nb_points = 5;

// SIGNATURES DE FONCTIONS
// PAS DE CREER NOEUD CAR TROP CHINAT NIVEAU MALLOC

point creer_point(float abscisse, float ordonnee);
void inserer_noeud_a_gauche(noeud *arbre, noeud nouveau);
void inserer_noeud_a_droite(noeud *arbre, noeud nouveau);
noeud get_parent(noeud fils);
int est_gauche(noeud fils);
int est_droit(noeud fils);
float distance_carre(float x, float y, float z, float t);
noeud* trouver_voisin_droit(noeud* n);
noeud* trouver_voisin_gauche(noeud* n);
float min_dist(noeud* arbre);
void diviser(noeud* arbre, float x_min, float x_max);
void print_tree(noeud* node, int val);

// MAIN

void main()
{
	noeud arbre;
	arbre.len = 5;

	point tab[] = {{ 1.0, 2.0 }, { 2.0, 4.0 }, { 4.0, 8.0 }, { 8.0, 16.0 }, { 16.0, 32.0 }};
	arbre.contenu = tab;

	// les points les plus proches sont les deux premiers points de la liste 
	float distance;
	for (int i = 0; i < arbre.len - 1; i++)
	{
		distance = distance_carre(tab[i].x, tab[i].y, tab[i + 1].x, tab[i + 1].y);
		printf("%.3f ", distance);
		printf("\n");
	}

	diviser(&arbre, 0., 40.);
	printf("OK\n");

	print_tree(&arbre, (int)'a');

	float mini = min_dist(&arbre);
	printf("%f", mini);
	printf("%f", sqrt(mini));
}

void print_tree(noeud* node, int val) {
	if(node == NULL) return;

	printf("%c --> %c( (%f, %f) )\n", (char)val, (char)val++, node->contenu[0].x, node->contenu[0].y);
	print_tree(node->fils_gauche, val);
	print_tree(node->fils_droit, val);
}

void diviser(noeud* arbre, float x_min, float x_max)
{
	//Taille de la fenêtre par défaut : 40x40
	float milieu = (x_min + x_max) / 2.;

	noeud* gauche = malloc(sizeof(noeud));
	noeud* droit = malloc(sizeof(noeud));

	gauche->len = 0;
	droit->len = 0;

	int ig = 0, id = 0;

	printf("min=%f, max=%f, m=%f, ", x_min, x_max, milieu);

	for (int i = 0; i < arbre->len; i++) {
		point pt = arbre->contenu[i];
		printf("i=%d, ig=%d, id=%d\n", i, ig, id);

		if (pt.x >= x_min && pt.x <= milieu) {
			printf("\t ig++ %f %f %f", pt.x, x_min, milieu);
			gauche->contenu[ig++] = pt;
			gauche->len++;
		}

		if (pt.x > milieu && pt.x < x_max) {
			droit->contenu[id++] = pt;
			droit->len++;
		}
	}

	while(1 != 0) { exit(0); }


	arbre->fils_gauche = gauche;
	arbre->fils_droit = droit;
	printf("\tig=%d, id=%d\n", ig, id);

	// Cas de base
	if (ig > 1) {
		diviser(gauche, x_min, milieu);
	}

	if (id > 1) {
		diviser(droit, milieu, x_max);
	}
}

// FONCTIONS

point creer_point(float abscisse, float ordonnee)
{
	// fonction qui cree un point aux coordonnées passées en parametre

	point nouveau_point;
	nouveau_point.x = abscisse;
	nouveau_point.y = ordonnee;
	return nouveau_point;
}

void inserer_noeud_a_gauche(noeud *arbre, noeud nouveau)
{
	//insere le nouveau noeud à gauche de l'arbre

	noeud *courant = arbre;

	while (courant->fils_gauche != NULL)
	{
		courant = courant->fils_gauche;
	}

	courant->fils_gauche = &nouveau;
	nouveau.parent = courant;
}

void inserer_noeud_a_droite(noeud *arbre, noeud nouveau)
{
	// insere le nouveau noeud à doite de l'arbre

	noeud *courant = arbre;

	while (courant->fils_droit != NULL)
	{
		courant = courant->fils_droit;
	}

	courant->fils_gauche = &nouveau;
	nouveau.parent = courant;
}

noeud get_parent(noeud fils)
{
	// renvoie le noeud parent du noeau fourni en argument

	return *(fils.parent);
}

int est_gauche(noeud fils)
{
	//  renvoie 1 si le noeud est le fils gauche de son parent, renvoie 0 sinon

	noeud pere = *(fils.parent);
	if (pere.fils_gauche == &fils)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

int est_droit(noeud fils)
{
	// renvoie 1 si le noeud est le fils droit de son parent, renvoie 0 sinon

	noeud pere = *(fils.parent);
	if (pere.fils_droit == &fils)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

float distance_carre(float x, float y, float z, float t)
{// Fonctionnelle
	/*Entrées: x coordonnées en x du premier point
	y coordonnées en y du premier point
	z coordonnées en x du premier point
	t coordonnées en y du premier point
	Sortie: un flottant représentant la distance au CARRE entre les deux points */

	//déclaration des variables
	float dist;

	//calcul de la distance entre les points
	/*la formule de la distance entre deux points de coordonnées (x,y) et (z,t)est
	sqrt( (x-z)² + (y-t)²)  */

	dist = pow((x - z), 2) + pow((y - t), 2);
	return dist;
}

float min(float a, float b) { return a > b ? b : a; }

float min_dist(noeud* arbre) {
	if (arbre->fils_gauche == arbre->fils_droit) {
		// c'est une feuille
		noeud* voisin_gauche = trouver_voisin_gauche(arbre);
		noeud* voisin_droit = trouver_voisin_droit(arbre);

		point val_g = voisin_gauche->contenu[0];
		point val_d = voisin_droit->contenu[0];
		point val = arbre->contenu[0];

		float d_g = distance_carre(val_g.x, val_g.y, val.x, val.y);
		float d_d = distance_carre(val_d.x, val_d.y, val.x, val.y);

		return min(d_g, d_d);
	}

	float a = min_dist(arbre->fils_droit);
	float b = min_dist(arbre->fils_gauche);
	return min(a,b);
}

noeud* trouver_voisin_gauche(noeud* n) {
	noeud* n2 = n;
	while (est_droit(*n2)) {
		n2 = n2->parent;
	}

	while (n2->fils_droit != NULL) {
		n2 = n2->fils_droit;
	}

	return n2;
}

noeud* trouver_voisin_droit(noeud* n) {
	noeud* n2 = n;
	while (est_gauche(*n2)) {
		n2 = n2->parent;
	}

	while (n2->fils_gauche != NULL) {
		n2 = n2->fils_gauche;
	}

	return n2;
}

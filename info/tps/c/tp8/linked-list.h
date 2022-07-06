struct str_noeud {
	int info;
	struct str_noeud* suivant;
};

struct liste_simplement_chainee {
	struct str_noeud* premier_element;
};

typedef struct str_noeud noeud;
typedef struct liste_simplement_chainee liste_chainee;

noeud* creer_element(int info);
liste_chainee* creer_liste_chainee(int premiere_valeur);

void affiche_liste_chainee(liste_chainee* liste);
noeud* acceder_element_liste_chainee(liste_chainee* liste, int index);

int inserer_noeud_liste_chainee(liste_chainee* liste, noeud* elem, int index);
int enlever_noeud_liste_chainee(liste_chainee* liste, int index);

int longueur_liste_chainee(liste_chainee* liste);
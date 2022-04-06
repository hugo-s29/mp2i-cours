#include <stdio.h>
#include <stdlib.h>

/*
24/03/2022
Bastion DUFOUR, Hugo SALOU, Aubin SIONVILLE, Charlotte SOUEDET

Problème de la découpe d'une barre d'acier :
On considère une entreprise achète et revend de barres d’aciers. Elle doit décider de
découper ces barres de manière à optimiser les profits à la revente
Hypothèses :
    Découpe d’une barre en barres de i = 1, 2, .. cm
    Prix des tronçons de i cm à la revente connus
Les prix des différents tronçons sont les suivants :
Longueur (i cm) 1 2 3 4 5  6  7  8  9  10
Prix p          1 5 8 9 10 17 17 20 24 30

On cherche à maximiser le profit de la revente de la barre en découpant la barre en tronçons de i cm.
*/

// Prix des barres de metal
int tableau_prix[11] = {0, 1, 5, 8, 9, 10, 17, 17, 20, 24, 30};

// Structure qui représente une combinaison de barres de metal
// Agencement : nb_barres[0] = nombre de barres de taille 0, etc.
typedef struct struct_combinaison
{
    int agencement[11];
    int prix;
} combinaison;


// Signatures des fonctions
void afficher(combinaison *combi);
int calculer_prix(combinaison *combi);
combinaison *creer_combinaison_zero();
combinaison **creer_liste_combinaisons();
combinaison *version_force_brute_recursive(int longueur);
combinaison *version_dynamique_ascendante(int longueur);
combinaison *indices_coupures_vers_combinaison(int longueur, combinaison *combi_decoupe);

// Fonction qui affiche une combinaison
// Entrée : combinaison à afficher
// Sortie : rien
void afficher(combinaison *combi)
{
    // Liste de tuples (taille, nombre de barres de cette taille)
    int** affichage = malloc(sizeof(int*) * 11);
    // On récupère met les valeurs non nulles les uns à la suite des autres
    int position = 0;
    for (int i = 0; i < 11; i++)
    {
        if (combi->agencement[i] != 0)
        {
            affichage[position] = malloc(sizeof(int) * 2);
            affichage[position][0] = i;
            affichage[position][1] = combi->agencement[i];
            position++;
        }
    }
    
    // Combinaison : {k x l cm } où k est le nombre de barres de métal et l est la longueur de la barre
    // Prix : {prix de la combinaison}
    printf("Prix : %d\n", combi->prix);
    printf("Combinaison : ");
    // On va parcourir le tableau et afficher les éléments non nuls séparés par des +
    for (int i = 0; i < position; i++)
    {
        printf("%d x %d cm", affichage[i][1], affichage[i][0]);
        if (i != position - 1)
        {
            printf(" + ");
        }
    }
    printf("\n");
}

// Fonction qui crée une combinaison de 0
// Entrée : rien
// Sortie : combinaison de 0, avec un prix de 0
combinaison *creer_combinaison_zero()
{
    combinaison *combi = malloc(sizeof(combinaison));
    for (int i = 0; i < 11; i++)
    {
        combi->agencement[i] = 0;
    }
    combi->prix = 0;
    return combi;
}

// Fonction qui crée une liste de combinaisons
// Entrée : longueur de la liste
// Sortie : liste de combinaisons de longueur donnée
combinaison **creer_liste_combinaisons(int longueur)
{
    combinaison **liste = malloc(sizeof(combinaison *) * longueur);
    for (int i = 0; i < longueur; i++)
    {
        liste[i] = creer_combinaison_zero();
    }
    return liste;
}

// Fonction qui résout le problème en utilisant la version brute force en récursivité
// Entrée : longueur de la barre
// Sortie : combinaison de morceaux pour la barre de longueur donnée
// Complexité : O(exp(n))
combinaison *version_force_brute_recursive(int longueur)
{
    combinaison *combi_max = creer_combinaison_zero();
    combinaison *combi_tmp = creer_combinaison_zero();

    if (longueur == 0)
    {
        return combi_max;
    }

    if (longueur <= 11)
    {
        // Variant : longueur - i
        // Invariant : combi_max est la combinaison optimale de morceaux de la barre de longueur i
        for (int i = 0; i < longueur; i++)
        {
            combi_tmp = version_force_brute_recursive(longueur - (i + 1));
            combi_tmp->prix += tableau_prix[i + 1];
            combi_tmp->agencement[i + 1] += 1;

            if (combi_tmp->prix >= combi_max->prix)
            {
                combi_max = combi_tmp;
            }
        }
    }
    else
    {
        // Variant : 11 - i
        // Invariant : combi_max est la combinaison optimale de morceaux de la barre de longueur i
        for (int i = 0; i < 11; i++)
        {
            combi_tmp = version_force_brute_recursive(longueur - (i + 1));
            combi_tmp->prix += tableau_prix[i + 1];
            combi_tmp->agencement[i + 1] += 1;

            if (combi_tmp->prix >= combi_max->prix)
            {
                combi_max = combi_tmp;
            }
        }
    }
    return combi_max;
}

// Fonction qui résout le problème en utilisant la programmation dynamique bottom-up
// Entrée : longueur de la barre
// Sortie : combinaison contenant le prix et les indices de découpe
// Il faudra utiliser une fonction ultérieure pour générer la combinaison
combinaison *version_dynamique_ascendante(int longueur)
{
    
    int *liste_prix = malloc(sizeof(int) * (longueur + 1));
    int *liste_index = malloc(sizeof(int) * (longueur + 1));
    combinaison *resultat = creer_combinaison_zero();

    liste_prix[0] = 0;
    int prix_max;

    // Variant : longueur - taille_decoupe
    // Invariant : liste_prix[taille_decoupe] est le meilleur prix pour une barre de longueur taille_decoupe
    for (int taille_decoupe = 1; taille_decoupe <= longueur; taille_decoupe++)
    {
        prix_max = -1;

        // Variant : taille_decoupe - i_coupe
        // Invariant : liste_prix[i_coupe] est le prix de la combinaison de morceaux de la barre de longueur i_coupe
        for (int i_coupe = 1; i_coupe <= taille_decoupe; i_coupe++)
        {
            if (prix_max < tableau_prix[i_coupe] + liste_prix[taille_decoupe - i_coupe])
            {
                prix_max = tableau_prix[i_coupe] + liste_prix[taille_decoupe - i_coupe];
                liste_index[taille_decoupe] = i_coupe;

                // Attention, agencement contient ici les indices de découpe et non la combinaison des morceaux
                resultat->agencement[taille_decoupe] = i_coupe;
            }
        }

        liste_prix[taille_decoupe] = prix_max;
        resultat->prix = prix_max;
    }
    return resultat;
}

// Fonction qui génère une combinaison de morceaux à partir des indices de découpe
// Entrée : longueur de la barre, combinaison comprenant les indices de découpe
// Sortie : combinaison de morceaux pour la barre de longueur donnée
combinaison *indices_coupures_vers_combinaison(int longueur, combinaison *combi_decoupe)
{
    // On récupère les indices de découpe dans une liste pour éviter toute confusion plus tard
    int *combinaison = malloc(sizeof(int) * (longueur + 1));
    int prix = combi_decoupe->prix;

    for (int i = 0; i < longueur + 1; i++)
    {
        combinaison[i] = combi_decoupe->agencement[i];
        combi_decoupe->agencement[i] = 0;
    }

    // Pour éviter de modifier longueur
    int i = longueur;
    while (i > 0)
    {
        combi_decoupe->agencement[combinaison[i]] += 1;
        i -= combinaison[i];
    }

    combi_decoupe->prix = prix;

    free(combinaison); // Important
    return combi_decoupe;
}

void main()
{
    int taille_brute = 4;
    int taille_dynamique = 15;

    // Version brute force
    printf("Version brute force : Barre de %d cm \n", taille_brute);
    combinaison* combi_brute = version_force_brute_recursive(taille_brute);
    afficher(combi_brute);
    free(combi_brute);

    printf("-----------------------------------------------------\n");

    // Version dynamique
    printf("Version dynamique bottom-up : Barre de %d cm \n", taille_dynamique);
    combinaison *combi = version_dynamique_ascendante(taille_dynamique);
    combi = indices_coupures_vers_combinaison(taille_dynamique, combi);
    afficher(combi);
}

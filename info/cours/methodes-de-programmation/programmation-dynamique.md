$\Huge \text{Programmation dynamique}$

Objectifs du cours: 

 * Cadre pour les techniques de programmation
 * Programmation dynamique

# I. Introduction - Cadre pour l'algorithmique

```{.mermaid format=pdf}
graph TD;

r{{Méthodes de programmation}} --> p[Algorithmes probabiliste<br/>Algorithmes d'approximation]

r --> eex{{Exploration exhaustive}}
eex --> fb([force brute])
eex --> se[Séparation - évaluation]

r --> sp{{Décomposition en sous-problèmes}}
sp --> gl([Glouton])
sp --> dpr([Diviser pour régner])
sp --> dyn([Programmation dynamique])
```

Formulation d'un problème en algorithmique:

 * Soit $P$ un problème quelconque
 * Soit $I$ une instance de $P$
 * Soit $A$ un algorithme résolvant le problème $P$

Quelles sont les familles de problèmes $P$ ?

```{.mermaid format=pdf}
graph TD;
r(Type de problèmes algorithmiques) --> a(Problème de décision)
r --> b(Problème d'existence / Recherche de solutions)
b --> c(Dénombrement)
b --> d(Recherche)
b --> e(Fonction)
b --> f(Optimisation)
```

## Problème de décision (ou reconnaissance)

Objectif : validation de l'existence d'une solution

A chaque instance du problème $P$, la réponse apportée par l'algorithme est oui ou non (résultat binaire)

Problème de classification

```{.mermaid format=pdf}
graph TD;
p{{Problème P}}

i(Instance I) --> a[Algorithme A]
a --> o(oui)
a --> n(non)
```

Exemple: soit $n$ un entier naturel, déterminer si $n$ est un nombre premier

## Problème de recherche

Objectif:  trouver une solution lorsqu'un algorithme n'est pas écrit mais que la spécification de la solution est connue.

Trouver, si elle existe, une solution associée à une instance d'entrée grace à une relation figurant dans l'énoncé de la recherche.

Problème de décision : restriction d'un problème de recherche

```{.mermaid format=pdf}
graph TD;
p{{Problème P}}

i(Instance I) --> a[Algorithme A]
a --> o(Solution y<br/>Solution z)
a --> n(Rejet de I)
```

Exemple : trouver les facteurs premiers d'un entier naturel $n$


## Problème de dénombrement

Objectif : dénombrer les solutions

Déterniner le nombre de solutions à un problème de recherche

Sous-problème du problème de dénombrement et de décision : 

 - unicité d'une solution optimale
 - énumération des solutions

Exemple: soit $n$ un entier naturel, déterminer le nombre de facteurs premiers non triviaux de $n$


## Problème d'optimisation

Objectif : recherche de la meilleure solution parmi toutes les solutions possibles d'un problème $P$ sur une instance $I$

Détermination d'un jeu de paramètres en entrée d'une fonction donnant à cette fonction la valeur maximale ou minimale

Optimisation sous contrainte ou sans contrainte (méthode de descente, programmation linéaire, ...)

Exemple: recherche du plus grand facteur premier non trivial d'un entier naturel$~n$


## Problème de fonction

Objectif : engendrer les solution

Un seul résultat attendu pour chaque entrée

Plus complexe que le problème de décision car le résultat est une valeur plutot qu'un résultat binaire

Exemple: problème de régression $\to$ prévision de valeur


# II. Programmation dynamique: exemple

## Découpe de barres d'acier

Entreprise $\to$ achat et revent de barres d'acier

Coupe de barres d'acier pour optimiser les profits

Hypothèses:

 * Découpe d'une barre en barres de $i = 1,~2,~\ldots$ cm
 * Prix des tronçons de $i$ cm à la revente connus : 

+--------------------+---+---+---+---+----+----+----+----+----+----+
| Longueure $i$ (cm) | 1 | 2 | 3 | 4 |  5 |  6 |  7 |  8 |  9 | 10 |
+--------------------+---+---+---+---+----+----+----+----+----+----+
| Prix               | 1 | 5 | 8 | 9 | 10 | 17 | 17 | 20 | 24 | 30 |
+--------------------+---+---+---+---+----+----+----+----+----+----+






































$$
%# III. Principe de la programmation dynamique
%# IV. Exercices
$$

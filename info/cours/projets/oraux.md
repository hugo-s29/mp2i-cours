# I. $n$ reines -- backtracking

## Groupe A. Iba, Antoine R., Bastien D., Arthur

**Problème** : placer le nombre maximal de reines sur un échiquier de $n\times n$.

**Rappel** : la reine attaque la ligne, la colonne et les deux diagonales.

**Backtracking** : expiration exhaustive ; on part de la racine, et on descend dans l'arbre. Si on ne trouve pas de solution, on remonte.

**Algorithme** : On procède ligne par ligne. Une structure est créée contenant la position des reines déjà posées et le nombre de reines à poser.
On tente de poser un maximum de reines. Quand on ne peut plus poser de reines, on remonte dans l'arbre des possibilités et on essaie une nouvelle position pour la reine. La solution partielle est une liste $(r_1, \ldots,r_n)$ où $r_i$ est la position de la $i$-ème reine.

**Complexité** : l'algorithme a une complexité en $\mathcal{O}(n!)$.

**Exemples** :

$$
	\begin{array}{c|c}
		N&\#\,\text{Solutions}\\ \hline
		3&0\\ \hline
		4&2\\ \hline
		5&10\\ \hline
		6&4\\ \hline
		7&40\\ \hline
		8&92\\ \hline
		9&352 \\ \hline
		10&724\\
	\end{array}
$$

## Groupe B. Narada, Nicolas, Charlotte, Alan

Même sujet que le groupe précédent.

**Conjecture** : On peut placer une reine sur chaque ligne.

On n'essaie pas toutes les configurations car certaines sont impossibles ; on fixe les contraintes.

**Différence avec le groupe A.** : la structure contient tous les tableaux solutions. Le problème est que la complexité en mémoire est très importante et à partir de $n = 11$, il est impossible que le programme se termine sur `repl.it`.

**Complexité temporelle** : $\mathcal{O}(n!)$.

**Complexité mémorielle** : $\mathcal{O}(\text{beaucoup})$.

---

# II. Boyer-Moore -- Recherche d'un motif

## Groupe A. Ruben, Noémie, Alex, Juliette, Antoine V.

Algorithme de recherche de motif dans un texte $\to$ un des algorithme les plus populaire et efficace pour la recherche de motif.

**Approche naïve** : on tente de placer le motif sur chaque lettre $\implies$ complexité importante

On commence par la fin du motif et s'il n'y a pas une lettre du motif, on fait un “saut” de la taille du motif moins la position dans la table de saut du caractère qui a bloqué le motif.

Il est possible que l'on rate la solution si l'on ne fait pas attention (exemple : rechercher “AAA” dans “BBAAAZZ”).

Implémentation en OCaml plus adaptée que celle en C car utilisation de listes.

## Groupe B. Khadim, Iwan, Émile, Tibério

**Complexité de la méthode exhaustive** : $\mathcal{O}(\ell \times k)$ où $\ell$ est la longueur de la chaîne, $k$ est celle du motif.

**Méthode avec décalage** (Boyer-Moore) : meilleur des cas $\mathcal{O}\!\left( \frac{\ell}{k} \right)$ (approximatif).

**Méthode optimisée** : utilisation de liste chaînées et de plusieurs “curseurs” pour analyser le texte.

> \vspace{-2mm}$\longrightarrow$ Pas de problème pour la recherche de “AAA” dans “BBAAAZZ”

**Boyer-Moore II** (hors programme) : utilisation de deux tables de saut ; si on trouve une lettre mais pas la suivante, on regarde dans le motif si l'on ne peut pas avoir trouvé une autre partie du motif et on fait le “saut” nécessaire.

---

# III. Résolution de Sudoku -- Backtracking

## Groupe A. Bastien F., Thomas, Timothée S., Hugo

Bah, non. $\implies$ Complexité en $\mathcal{O}(\text{beaucoup})$.

## Groupe B. Aubin, Samy, Kyriann

On choisit *arbitrairement* une solution.

$\text{\color{red} Attention, ici $n$ est la taille de la grille entière.}$

Utilisation du backtracking mais avec des contraintes au lieu de possibilités.

Choix à faire à chaque cases réduisant les possibilités des autres, si aucune possibilité pour une case, on change la case précédente.

Utilisation du récursif d'où l'utilisation du OCaml. Deux structures utilisées : `case_contrainte` et `case_grille`.

Utilisation d'une seule boucle pour faire à la fois la vérification ligne et colonne $\implies$ $\mathcal{O}(n)$ où $n$ est la taille *totale* de la grille.

Construction de la file de priorité en $\mathcal{O}(n^3)$.

Résolution du Sudoku en $\mathcal{O}\big(n^{n^2}\big)$.

Mettre à jour la liste des cases à traiter permettrais de remplir la 20 % de la grille.

---

# IV. Compression Lempel-Ziv-Welch

## Groupe A. Dorian, Lucine, Benoît, Kilian, Nathan R.

Des variantes de l'algorithme sont utilisées pour le format `GIF` et `TIFF`.

Utilisation des redondances dans le texte pour diminuer la taille $\to$ dictionnaire.

Au lieu d'utiliser $8$ bits pour stocker un caractère, diminuer cette taille en fonction de la fréquence dans le texte.

Présence d'un caractère pour indiquer la fin du texte (`EOF`) $\to$ `\Z`.

Formation de séquences à partir des séquences déjà créées :  “TON” utilise la séquence “TO”.

Peut aller de 10 % à 50 % de compression. Pour $10\,000$ caractères de Harry Potter, on a 40 % de compression.

Spécificité du C : “méthode `append`”

> \vspace{-2mm} avec des tableaux $\to$ trop coûteux

> \vspace{-2mm} avec les liste chaînées

D'où l'utilisation de deux liste chaînées : pour le code et pour le dictionnaire.

Puis, transformation de la liste chaînée à un tableau pour la fin de la fonction principale.

Différence : ajout d'un champ `queue` à la liste chainée pour avoir une complexité d'ajout d'un élément en $\mathcal{O}(1)$.

(ajout de Khadim : on peut utiliser une fonction Hors-programme qui permettrai l'utilisation des tableaux au lieu des listes chaînées).

Utilisation du code `ASCII` pour représenter la séquence.

Autre possibilité : utilisation d'une fonction récursive ? $\implies$ OCaml

Pour le code en OCaml, utilisation d'un tableau pour représenter le dictionnaire.

Améliorations : deuxième passage pour détecter des motifs de motifs ($\leadsto$ mots communs) uniquement possible car on stocke le dictionnaire pour la décompression.
Possibilité d'un troisième passage, etc...

Décompression en $\mathcal{O}(n)$.

## Groupe B. Timothée N-L., Nathan S., Lilian, Loïc

Utilisation également dans le format `ZIP`.

Surtout efficace sur des textes longs car répétition de motifs.

Utilisation d'indices supérieurs à 255 $\implies$ plusieurs octets (contrairement au code `ASCII`).

Utilisation de tableaux pour représenter le dictionnaire (contrairement au groupe précédent).

$\leadsto$ retrouver le dictionnaire à partir du texte décodé.

Complexités :
- compression en $\mathcal{O}(n\times p)$ où la taille du code est $q$ et celle du dictionnaire est $n$ ;
- décompression en $\mathcal{O}(n^2\times p)$.

Économie en mémoire allant jusqu'à 50 %. Bien plus efficace sur les textes longs ou sur les images.

Sans avoir accès au dictionnaire, on ne peut pas compresser deux fois (ou plus).

---

# II. Rabin-Karp -- Recherche d'un motif

## Groupe A. Nathan F., Ywan, Damien, Corentin, Germain

Recherche de motifs : simple ($\to$ Boyer-Moore) et multiple ($\to$ Rabin-Karp)

**Force brute** : comparer les caractères uns à uns $\implies$ complexité très importante.
Complexité en $\mathcal{O}(n\,m)$ où $n$ est la taille du texte et $m$ est celle du motif.

Utilisation d'une structure `tableau` et de `realloc` (H.P.) pour diminuer l'empreinte mémoire.

**Principe de l'algorithme de Rabin-Karp** : 
Utilisation d'une fonction de *hashage* ($\to$ prétraitement; par exemple calcul décimal de Hörner). Attention aux potentiels faux positifs dûs à l'utilisation du modulo (notamment).

Équilibre à trouver pour la taille du *modulo* entre espace mémoire et taux de faux positifs.

**Prétraitement** (réalisé, dans ce cas, avec la méthode de calcul décimal de Hörner) : Calcul du hash initial en $\mathcal{O}(n)$ où $n$ est la taille du motif puis utilisation de la relation de récurrence pour un calcul en $\mathcal{O}(\ln n)$. Au final, le prétraitement est en $\mathcal{O}(n\ln n)$.

**Traitement** : calcul du hash, comparaison entre le hash du texte et celui du motif. Complexité entre $\mathcal{O}(n)$ et $\mathcal{O}(n\,m)$ en fonction du nombre de “faux positifs”.

**Complexité globale** entre $\mathcal{O}(n\ln n)$ et $\mathcal{O}(n\,m)$.

**Extensions** :

- Filtre de Bloom : tableau de plusieurs fonctions de hashage. Représenté en C avec deux structures : `hashFunctions` et `bloomFilter`. Permet de réduire le nombre de “faux positifs” mais ils restent possible.

- Tableau à deux dimensions : utilisable dans une image (recherche multiple de Smiley dans une image).

**Améliorations possibles** : utiliser une meilleur fonction de hashage, utiliser un meilleur “modulo”.

**Exemple** : utiliser Boyer-Moore pour trouver des patterns dans l'ADN est peu efficace car l'alphabet est petit (4 caractères) et donc les sauts ne sont pas de longueur importantes. L'utilisation, dans cet exemple, de Rabin-Karp est donc beaucoup plus efficace.

**Attention** : la complexité des fonctions dans C n'est pas forcément en $\mathcal{O}(1)$ ; par exemple, l'utilisation d'un `malloc` pour un grand espace peut prendre bien plus longtemps qu'un simple `malloc` pour peu de mémoire.

## Groupe B. Martin, Louis, Ilan, Valentin

**Différences avec le groupe précédent** :

- Prétraitement en $\mathcal{O}(n)$.
- Recherche en $\mathcal{O}(n\,m - m^2)$.

Implémentation en C car pas de récurrence, uniquement de l'itératif et utilisation de tableaux.

Importance de la fonction de hashage $\to$ équilibre.

Pour des textes courts, l'algorithme de Rabin-Karp n'avantage pas plus que la force brute.

Utilisation d'autres bases que la base *10* : pour le code `ASCII`, on utilise la base *256*.

Attention à la lisibilité des diapositives.



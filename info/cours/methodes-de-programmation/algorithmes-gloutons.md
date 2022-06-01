$\Huge \text{Algorithmes gloutons}$

*c.f. polycopié*

# II. Exemple : choix d'activités

Sous-structure optimale :

> Ajout de $a_k$ dans $A_{ij}$ $\to$ définition de deux sous-problèmes dans $S_{ij}$.

> On peut définir
\begin{align*}
	A_{jk} = A_{ij} \cap S_{ik}\\
	A_{kj} = A_{ij} \cap S_{kj}
\end{align*}
> On a donc $A_{ij} = A_{ik} \cup \{a_k\} \cup A_{kj}$ avec $A_{ik}$ avec $|A_{ij}| = |A_{ik}| + |A_{kj}| + 1$.


À démontrer : la solution optimale $A_{ij}$ doit-elle nécessairement inclure les solution optimales de $S_{ik}$ et $S_{ki}$ ?

> Hypothèse : On peut bâtir $A'_{ik}$, sous ensemble d'activités mutuellement compatibles dans $S_{ik}$ tel que $|A'_{ik}| > |A_{ik}|$.

> Alors, on peut trouver un sous-ensemble $A'_{ij}$ tel que $A'_{ij} = A'_{ik} \cup \{a_k\} \cup A_{kj}$. On a alors $|A'_{ij}| = |A'_{ik}| + |A_{kj}| + 1 > |A_{ij}| = |A_{ik}| + |A_{kj}| + 1$.

> Ce qui contredit l'hypothèse initiale affirmant que $A_{ij}$ est un sous-ensemble de plus grande taille d'activités mutuellement compatible de $S_{ij}$.

> Raisonnement similaire pour $A_{kj}$.

Conclusion: La solution optimale de $S_{ij}$ inclut les solutions optimales de $S_{ik}$ et $S_{kj}$.

Chevauchements de sous-problèmes :

> Taille d'une solution optimale pour $S_{ij}$ contenue dans le tableau à 2 dimensions : $|A_{ij}| = c[i,\, j]$.

> Soit $c[i,\,j] = c[i,\,k] + c[k,\,j] + 1$.

> En pratique, on ignore si la solution optimale du sous-problème $S_{ij}$ contient la solution $a_k$.

> Nouvelle formulation : examen de toute les activités de $S_{ij}$ pour déterminer $k$ :
$$
	c[i,\,j] = \begin{cases}
		0&\text{si } S_{ij} = \varnothing,\\
		\displaystyle\max_{a_k \in S_{ij}} \Big\{c[i,\,k] + c[k,\,j] + 1\Big\} &\text{si } S_{ij} \neq \varnothing.
	\end{cases}
$$

> D'où les chevauchements de sous-problèmes (résoudre $S_{i,m+1}$ nécessite de résoudre $S_{im}$).

Programmation dynamique envisageable mais lourde à mettre en œuvre.

*c.f. polycopié*

*Est-ce que le choix glouton fait toujours partie de la solution optimale ?*

**Théorème**:

> Soit un sous-problème $S_k$ non vide. Soit $a_m$ l'activité de $S_k$ ayant l'heure d'achèvement la plus précoce.

> Alors, $a_m$ est incluse dans un certain sous-ensemble de taille maximale d'activités mutuellement compatibles de $S_k$.

Démonstration: 

> Soit $A_k$ un sous-ensemble de taille maximale d'activités mutuellement compatibles de $S_k$. Soit $a_j$ la première activité de $A_k$.

> Si $a_j\, =\, a_m$, alors le théorème est démontré.

> Si $a_j \neq a_m$, soit $A'_k = \big(A_k \setminus \{a_j\}\big) \cup \{a_m\}$, $a_m$ ayant l'heure d'achèvement la plus précoce dans $S_k$ : $f_m \leqslant f_j$. $A'_k$ est aussi un sous-ensemble d'activités mutuellement compatibles de $S_k$. Par ailleurs, $|A'_k| = |A_k|$, donc $A_k'$ est un sous-ensemble de taille maximale d'activités mutuellement compatibles de $S_k$, contenant $a_m$.

> Le théorème est donc démontré.


Mise en œuvre des algorithmes :

 - Récursif:

    ```
    Fonction ChoixActivitesRecursif(d, f, k, n)
      Entrée: d, tableau des dates de début des activités;
              f, tableau des dates de fin des activités;
              k, indice de l'activité courante (entier);
              n, longeur du tableau d et f (entier).
      Sortie: A, combinaison d'activités.
      Précondition: f et d sont triés par date de fin croissantes.
      Post-condition: A est un sous-ensemble de taille maximale
                      d'activités mutuellement compatibles.
      Début
        m := k + 1

        Tant que m <= n et d[m] <= f[k] faire
          m := m + 1
        Fin Tant que

        Si m <= n alors
          Retourner Combiner({ m }, ChoixActivitesRecursif(d, f, m, n))
        Sinon
          Retourner ø
        Fin Si
      Fin
    ```

>> Complexité en $\Theta(n)$

  - Itératif:

    ```
    Fonction ChoixActivitesIteratif(d, f, k, n)
      Entrée: d, tableau des dates de début des activités;
              f, tableau des dates de fin des activités.
      Sortie: A, combinaison d'activités.
      Précondition: f et d sont triés par date de fin croissantes.
      Post-condition: A est un sous-ensemble de taille maximale
                      d'activités mutuellement compatibles.
      Début
        n := d.longueur
        A := { 1 }
        k := 1

        Pour m allant de 2 à n faire
          Si d[m] >= f[k] alors
            A := Combiner(A, { m })
            k := m
          Fin Si
        Fin Pour

        Retourner A
      Fin
    ```

>> Complexité en $\Theta(n)$

## Bilan
*c.f. polycopié*

1. Détermination de la sous-structure optimale : $$A_{ij} = A_{ik} + \{a_k\} + A_{kj}$$
2. Formulation de la récurrence (mais non exploité pour un algo. récursif)
   $$
	 	c[i,\,j] = \begin{cases}
				0&\text{si } S_{ij} = \varnothing,\\
				\displaystyle\max_{a_k \in S_{ij}} \Big\{c[i,\,k] + c[k,\,j] + 1\Big\} &\text{si } S_{ij} \neq \varnothing.
			\end{cases}
	 $$
3. Le choix glouton conduit à un unique sous-problème:
	$$ A_k = \{a_k\} +\, \text{solution optimale au sous-problème}\, S_k$$

4. Le choix glouton + théorème
5. Algorithme récursif
6. Algorithme itératif

# III. Codage Huffman

Objectif : Économiser l'espace mémoire; limité aux suites de caractères pour le cours MP2I.

Compression de données: RLE

> Code RLE déjà vu au premier semestre, en devoir : codage sans perte de données mais peu efficace sur les textes

Encodages au programme (sans perte de données):

- Lempel-Zil-Welch (LZW) $\to$ project de fin d'année
- Huffman

> $\to$ algorithme glouton

> $\to$ très efficace pour les textes (entre $20\%$ et $90\%$ d'économie)

> $\to$ utilisation d'une table de fréquences d'apparition pour l'encodage

> $\to$ encodage de chaque caractère par une chaîne binaire

> $\to$ utilisé pour les fichiers `zip`, pour la compression `JPEG` et `PNG`.

## Exemple :

> Texte de 100 000 caractères utilisant uniquement 6 caractères distincts: ‘a', ‘b', ‘c', ‘d', ‘e', et ‘f'.

> Fréquence d'apparition des différents caractères connus

> Encodage de longueur fixe *v.s.* encodage de longueur variable.

+------------------------------+-----+-----+-----+-----+------+------+
| Caractère                    |   a |   b |   c |   d |   e  |   f  |
+------------------------------+-----+-----+-----+-----+------+------+
| Fréquence ($\times 10^3$)    |  45 |  13 |  12 |  16 |   9  |   5  |
+------------------------------+-----+-----+-----+-----+------+------+
| Encodage (longueur fixe)     | 000 | 001 | 010 | 011 | 100  | 101  |
+------------------------------+-----+-----+-----+-----+------+------+
| Encodage (longueur variable) |  0  | 101 | 100 | 111 | 1101 | 1100 |
+------------------------------+-----+-----+-----+-----+------+------+

Tailles des fichiers ?

- Encodage de longueur fixe : $300\,000$ bits
- Encodage de longueur variable : $224\,000$ bits

> On a donc $25\%$ d'économie avec l'encodage de longueur variable.

Exemple : `0 111 101 101` $\to$ `a d b b`

Pourquoi n'y a-t-il pas d'ambigüité pour le décodage ?

> Codage préfixe : aucun mot code n'est le préfixe d'un autre mot code.

> Un codage préfixe peut toujours donner la compression maximale entre tous les codages de caractère.

Utilisation d'un arbre binaire :

> Feuilles $\to$ caractères et fréquences d'apparition des caractères

>\vspace{-2mm} Étiquettes des nœuds internes et racines $\to$ fréquences d'apparition

>\vspace{-2mm} Vers le fils gauche $\to$ 0

>\vspace{-2mm} Vers le fils droit $\to$ 1

Codage optimal $\to$ arbre binaire dont les nœuds sont d'arité 2.

Encodage de longueur fixe:

```{.mermaid format=pdf}
graph TD;

r((100)) --- a((86)) --- b((58)) --- c((45)) --> f1[a]
b --- d((13)) --> f2[b]
a --- e((28)) --- f((12)) --> f3[c]
e --- g((16)) --> f4[d]
r --- h((14)) --- i((14)) --- j((9)) --> f5[e]
i --- k((5)) --> f6[f]
h --- N(("Ø"))
```

Encodage de longueur variable:

```{.mermaid format=pdf}
graph TD;

r((100)) --- a((45)) --> f1[a]
r --- b((55)) --- c((25)) --- e((12)) --> f2[c]
c --- f((13)) --> f3[b]
b --- d((30)) --- g((14)) --- i((5)) --> f4[f]
g --- j((9)) --> f5[e]
d --- h((16)) --> f6[d]
```

## Construction du codage de Huffman

Coût de l'arbre : $\displaystyle\sum_{i=1}^n f_i \times p_i$ où $p_i$ est la profondeur du caractère $i$, $f_i$ la fréquence du caractère $i$.

Utilisation d'une file de priorité min $F$ contenant les arbres $\to$ forêt

Pour chaque arbre de la forêt :

> \vspace{-2mm} Chaque nœud interne contient une fréquence

> \vspace{-2mm} Chaque feuille contient un caractère et sa fréquence d'apparition

La forêt est ordonnée par ordre de fréquences croissantes.

État initial de la forêt $F_0$ :

> \vspace{-2mm} Chaque arbre ne contient qu'un seul nœud : un caractère et sa fréquence.

> \vspace{-2mm} Donc, $\mathrm{Card}(F_0) = n =$ nombre de caractères différents dans le texte à encoder.

Construction de l'arbre : 

* Extraire le minimum de la file
* Extraire le minimum de la file
* Fusionner les deux arbres extraits dans un nouvel arbre

> \vspace{-2mm}$\to$ structure de file min

* \vspace{-2mm}Insérer le nouvel arbre dans la file
* \vspace{-2mm}Rétablir la structure du file min

```
Fonction construitHuffman(F)
	Entrée : F, file de priorité min, forêt d'arbres (files min)
	Sortie : F, contenant un seul élément, l'abre d'encodage Huffman
	Pré-condition : F contient les caractères et leurs fréquences (ordre croissant)
	Post-condition : F, contenant un seul élément, l'abre d'encodage Huffman

	Début
		Si #F = 1 alors 
			Returner F
		Sinon
			A1 = F.définer // Extraire_min(F)
			A2 = F.définer // Extraire_min(F)
			A = A1 + A2 // construction de l'arbre tournoi
			freq[A] = freq[A1] + freq[A2] // Calcul de la fréquence de A
			Insérer(A, F) // Insertion à la bonne place de A dans F
			Retourner construitHuffman(F) // Appel récursif
		Fin Si
	Fin
```

## Démonstration du lemme 1

$a$ et $b$ deux feuilles sœurs de profondeur maximale pour l'arbre $T$.
$$a.\text{freq} \leqslant b.\text{freq} \quad \text{et} \quad x.\text{freq} \leqslant y.\text{freq}$$

Comme $x$ et $y$ sont de fréquences les plus basses :
$$x.\text{freq} \leqslant a.\text{freq} \quad \text{et} \quad y.\text{freq} \leqslant b.\text{freq}$$

Si $x.\text{freq}$ alors $x.\text{freq} = a.\text{freq} = y.\text{freq} = b.\text{freq}$ donc le lemme est démontré.

Si $x.\text{freq} \neq b.\text{freq}$, on a :

```{.mermaid format=pdf}
graph TD;

r(( )) --- n1(( )) --- y
n1 --- n2(( )) --- a
n2 --- b
r --- x
```

En permutant les feuilles $a$ et $x$, on obtient $T'$:

```{.mermaid format=pdf}
graph TD;

r(( )) --- n1(( )) --- y
n1 --- n2(( )) --- x
n2 --- b
r --- a
```

On cherche le signe de $c(T) - c(T')$.

\begin{align*}
	c(T) - c(T') &= x.\text{freq} \times p_x + a.\text{freq} \times p_a - x.\text{freq} \times p'_x - a.\text{freq} + p'_a\\
	&= x.\text{freq} \times p_x + a.\text{freq} \times p_a - x.\text{freq}\times p_a - a.\text{freq} \times p_x\\
	&= \underbrace{(a.\text{freq} - x.\text{freq})}_{\geqslant 0} \times \underbrace{(p_a - p_x)}_{\geqslant 0}
\end{align*}

\begin{align*}
	c(T') - c(T'') &= y.\text{freq} \times p_y' + b.\text{freq} \times p_b' - y.\text{freq} \times p''_y - b.\text{freq} + p''_y\\
	&= x.\text{freq} \times p'_y + b.\text{freq} \times p'_b - y.\text{freq}\times p'_b - b.\text{freq} \times p'_b\\
	&= \underbrace{(b.\text{freq} - y.\text{freq})}_{\geqslant 0} \times \underbrace{(p'_b - p'_y)}_{\geqslant 0}
\end{align*}

## Démonstration du lemme 2

Pour chaque caractère $c \in A \setminus \{x,y\}$ on a :
$$ c.\text{freq} \times p_c = c.\text{freq} \times p'_c$$
car $T$ est bâti à partir de $T'$.

Pour les caractères $x$, $y$ et $z$ :

> $z$ est le parent de $x$ et de $y$ donc $p_x = p_y = p'_z + 1$.

> D'où
\begin{align*}
	x.\text{freq} \times p_x + y.\text{freq} \times p_y &= (x.\text{freq} + y.\text{freq}) \times (p'_z + 1)\\
	&= z.\text{freq} \times p'_z + (x.\text{freq} + y.\text{freq})\\
\end{align*}

D'où

$$ C(T) = C(T') \times (x.\text{freq} + y.\text{freq}) $$
$$ C(T') = C(T) - x.\text{freq} - y.\text{freq} $$

Raisonnement par l'absurde : $T$ ne représente pas un codage préfixe optimal de $A$ de coût minimal. Il existe $T''$ tel que $C(T'') < C(T)$

> Dans $T''$, $x$ et $y$ sont frères

> Soit $T''$, l'arbre $T''$ pour lequel le parent commun à $x$ et $y$ a été remplacé par $z$, de fréquence $z.\text{freq} = x.\text{freq} + y.\text{freq}$.

> Donc $C(T'') - x.\text{freq} - y.\text{freq} < C(T) - x.\text{freq} - y.\text{freq}$.

> Soit $C(T''') < C(T')$, ce qui contredit l'hypothèse affirmant que $T'$ représente un codage préfixe optimal de coût minimal pour $A'$.

Donc $T$ représente bien un codage préfixe optimal de coût minimal pour $A$.




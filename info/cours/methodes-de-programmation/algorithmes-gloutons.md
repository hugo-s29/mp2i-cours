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

> D'où les chevauchements de sous-problèmes (résoudre $S_{i\,m+1}$ nécessite de résoudre $S_{im}$).

Programmation dynamique envisageable mais lourde à mettre en œuvre.

*c.f. polycopié*

*Est-ce que le choix glouton fait toujours partie de la solution optimale ?*

**Théorème**:

> Soit un sous-problème $S_k$ non vide. Soit $a_m$ l'activité de $S_k$ ayant l'heure d'achèvement la plus précoce.

> Alors, $a_m$ est incluse dans un certain sous-ensemble de taille maximale d'activités mutuellement compatibles de $S_k$.


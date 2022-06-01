# I. Introduction

Rappel: classification des structures de données
```{.mermaid format=pdf}
graph TD;
b(Structures de données) --> s(séquentielles)
b --> h(hierarchiques)
b --> r(relationnels)

s --> l1(listes<br/>piles<br/>files<br/>dictionnaires<br/>sérialisation)
h --> l2(arbres<br/>files de priorités)
r --> l3(graphes)
```

Exemples de domaines d'utilisation des graphes:

* Réseaux sociaux (liens “d'amitiés" entre deux membres)
* Réseau routier, internet, lignes aériennes, routes maritimes
* Interaction entre deux espèces (réseau trophique)
* Réseaux neuronaux
* Réseaux abstraits (modélisation de prédicats)

# II. Définitions

## Graphes non orientés

$G = (S, A)$ est un graphe non orienté si

* $S$ est un ensemble fini
* $A$ est une partie de $S$ ayant 1 ou 2 éléments.

Les éléments de $S$ sont appelés nœuds ou sommets de $G$ (*vertices*). Les éléments de $A$ sont appelés arêtes (*edges*).

Exemple :
$$
G_2 = \Big(\{a,b,c,d,e,f,g\},\big\{\{a,b\},\{b,c\},\{b,d\},\{c,d\},\{d\}, \{e,f\} \big\}\Big)
$$
```{.mermaid format=pdf}
graph TD;

a --- b --- d
b --- c
a --- c --- d
d --- d
e --- f
g
```

L'arête $\{s\}$ est une boucle.

Un graphe est dit simple s'il ne contient pas de boucles.

L'ordre du graphe est $|S|$ et la taille du graphe est $|S| + |A|$.

Un graphe discret est un graphe sans arêtes. Un graphe vide est un graphe ne contenant aucun sommet et aucune arête.

Le degré d'un sommet $d(s)$ est le nombre d'arêtes ayant $s$ pour extrémité.

Exemple : $d(a) = 2$; $d(g) = 0$; $d(d) = 4$ (on compte les boucles deux fois).

Lemme: *c.f. poly*

Soit $G = (S, A)$ un graphe orienté ou non. Le chemin d'un sommet $s$ à un sommet $t$ de $G$ est la suite finie $c = (s_0, s_1, \ldots, s_n)$ non vide de sommets tels que

* $s_0 = s$
* $s_n = t$
* $\forall i \in [\![ 0, n - 1 ]\!], \exists a\in A, a = \{s_i, s_{i+1}\}$ \vspace{5mm}

* $t$ est accessible depuis $s$ s'il existe un chemin joignant $s$ à $t$.
* L'entier $n$ est la longueur du chemin.
* La distance de $s$ à $t$, noté $d(s, t)$ est la longueur minimale d'un chemin joignant $s$ à $t$.
* Si $t$ est inaccessible depuis $s$, alors $d(s, t) = \infty$.

Un cycle, ou chemin fermé est un chemin joignant un sommet $s$ à lui-même. Dans un graphe non orienté, la longueur d'un chemin fermée est au moins égale à 1. Toutes les arêtes du chemin sont distinctes. Un chemin de longueur 1, $\{s\} \in A$ est une boucle. Un graphe acyclique est un graphe n'ayant pas de cycles.

Un graphe non orienté est dit connexe lorsque tous les sommets sont à une distance finie les uns des autres. Un graphe non connexe peut être décomposé en plusieurs composantes connexes, les sous graphes connexes maximaux.

Théorème : Un graphe connexe d'ordre $n$ possède $n-1$ arêtes.

Démonstration :

* Avec $n = 1$, on a un graphe contenant 1 nœud, il a donc aucune ou une arête, donc au moins 0.
* On a un graphe connexe ayant $n$ nœuds et au moins $n - 1$ arêtes. On ajoute un nœud. Pour avoir un graphe connexe d'ordre $n$, il faut relier ce nouveau nœud à au moins 1 sommet préexistant. On a donc au moins $n$ arêtes.

Théorème : Si, dans un graphe $G$ simple, tout sommet est de degré supérieur ou égal à 2, alors $G$ possède au moins un cycle.

Démonstration :
Partons d'un sommet arbitraire noté $V_1$. On peut construire une suite finie de sommets $v_1, v_2, \ldots, v_k$ telle que $v_i \not\in \{v_1, v_2, \ldots, v_{i-1}\}$ et $v_i$ est un voisin de $v_{i-1}$. Puisque les sommets de $G$ sont un nombre fini, cette construction se termine. Or, $v_k$ est au moins de degré $2$. Donc, il possède, outre $v_{k-1}$, un voisin $v_j$ dans la séquence. Alors $(v_j, v_{j+1},\ldots, v_k, v_j)$ est un cycle de $G$.

## Graphes orientés

Un graphe $G = (S, A)$ est orienté si

* $S$ est un ensemble fini
* $A$ est une partie de $S \times S$

Les éléments de $S$ sont appelés nœuds ou sommets de $G$, et un élément $(s, s') \in A$ est un arc, représenté par une flèche de $s$ à $s'$.

Un arc $(s, s)$ est une boucle. Un graphe est dit simple s'il ne contient pas de boucles.

Avec $z = (s, s')$, on dit que $s$ et $s'$ sont les extrémités de $z$, ou qu'il sont reliés par $z$. On dit que $s$ est l'extrémité initiale (de départ) de $z$, ou un prédécesseur $s$ (voisin entrant). On dit que $s'$ est l'extrémité finale (d'arrivée) de $z$. L'ordre du graphe est le nombre de sommets, $|S|$. La taille du graphe est $|S| + |A|$.

Un graphe discret est un graphe sans arc (ou arête). Un graphe vide $G = (\varnothing, \varnothing)$ est un graphe sans sommet ni arc.

Le degré sortant d'un sommet $s$, $d_+(s)$, est le nombre d'arcs partant de $s$.
Le degré entrant d'un sommet $s$, $d_-(s)$, est le nombre d'arcs arrivant en $s$.
Le degré d'un sommet $s$, $d(s)$ est la somme du degré sortant et du degré entrant.

$$
\begin{cases}
	d_+(s) = \#\big\{ s' \in E \mid (s, s') \in A \big\}\\
	d_-(s) = \#\big\{ s' \in E \mid (s', s) \in A \big\}\\
	d(s) = d_+(s) + d_-(s).
\end{cases}
$$
```{.mermaid format=pdf}
graph TD;

a --> b --> d
b --> c
d --> c --> a
c --> d
d --> d
e --> f
f --> e
g
```

Par exemple, le degré de $a$ est 2, le degré de $g$ est 0 et le degré de $d$ est 5.

Un cycle est un chemin joignant un sommet $s$ à lui-même.

## Graphes pondérés

On dit que $G = (S, A, f)$ est un graphe pondéré ou étiqueté si $(S, A)$ est un graphe orienté ou non, et $f$ est une application de $A$ dans un ensemble $E$.

Si $z \in A$, alors $f(z)$ est l'étiquette de $z$. On indique $f(z)$ à proximité de l'arête ou de l'arc sur le diagramme sagittal (cf ci-dessous).

Si $E = \mathbb{R}$, $f(z)$ est le coût ou poids de l'arête ou de l'arc.

Le poids ou le coût d'un chemin dans un graphe pondéré est la somme des poids des arêtes parcourus. On l'appelle parfois longueur du chemin (mais c'est en contradiction avec la définition de longueur dans un graphe non pondéré).

$E$ peut être autre chose qu'un nombre. Dans ce cas, on parle de graphe étiqueté (par exemple, les automates).

```{.mermaid format=pdf}
graph RL;

n1((" ")) --> n2((" "))
n2 --> n1

n1 --> n1
n2 --> n2
```

## Graphes bipartis

Soit $G = (S, A)$ un graphe orienté ou non. On dit que $G$ est biparti si l'on peut partitionner $S$ en deux parties $S_1$ et $S_2$ telles que deux sommets appartenant à la même partie ne sont pas adjacents (voisins).

Un problème complexe (par exemple un problème NP difficile) sur les graphes peut être simplifié si on a un graphe biparti (cf programme de spé).

Théorème : Un graphe est biparti si et seulement s'il ne contient pas de cycle de longueur impaire.

Démonstration :

* Soit $G$ un graphe biparti non pondéré de classe $S_1$ et $S_2$.

	Tout cycle de ce graphe peut se parcourir en partant d'un sommet $v$ de $S_1$ et doit revenir au sommet de départ en alternant des sommets de $S_2$ et de $S_1$.

	Pour revenir à un sommet de $S_1$, on est obligé de faire des allers retours, qui, par définition, sont de longueur 2.

	Chacun des cycles est de longueur paire.

* On suppose, pour simplifier, que $G$ est connexe (sinon, appliquer le raisonnement à chacune des composantes connexes), non biparti et simple.

	Soit $I$ l'ensemble des sommets à une distance impaire de $v$. Soit $P$ l'ensemble des sommets à une distance paire de $v$. On a $S = P \cup I$ et $P \cap I = \varnothing$. Soit $v \in P$.

	Comme $G$ n'est pas biparti, il existe deux sommets adjacents $x_1$ et $x_2$ appartenant à $P$ (où à $I$).

	Comme $G$ est connexe, il existe un chemin $c_1$ allant de $x_1$ à $v$ et un chemin $c_2$ allant de $v$ à $x_2$ de même parité que $c_1$.

	La somme des longueurs de $c_1$ et $c_2$ est donc paire. Pour former un cycle, il faut alors constituer le chemin $c_2 \cup \{ x_1, x_2 \} \cup c_1$ de longueur impaire.

Rappel : Un arbre est un graphe connexe acyclique non orienté.

Théorème : Si $a$ et $b$ sont deux sommets distincts d'un arbre $G$, il existe un unique chemin reliant $a$ et $b$.

Démonstration : $G$ est connexe, ce qui assure l'existence d'un chemin reliant $a$ et $b$. S'il existe un autre chemin, un cycle pourrait être construit en utilisant les deux chemins reliant $a$ et $b$. Or, $G$ est acyclique. On en déduit que le chemin reliant $a$ et $b$ est unique.

Conséquence : Soit un arbre représenté par un graphe $G$ connexe acyclique non orienté. On a la possibilité de choisir arbitrairement un sommet $r$ de $G$ et d'orienter les arêtes de $G$ pour créer les chemins reliant $r$ à chacun des sommets. On obtient un arbre enraciné en $r$.


```{.mermaid format=pdf}
graph LR;

a((1)) --- b((4)) --- c((5)) --- d((6)) --- e((7))
f((2)) --- b
g((3)) --- b
```

```{.mermaid format=pdf}
graph TD;

c((5)) --- d((6)) --- e((7))
c --- b((4)) --- a((1))
b --- f((2))
b --- g((3))
```


# III. Implémentation

## Listes d'adjacences

Une liste d'adjacence est la liste des sommets adjacents à un sommet donné. Dans le cas d'un graphe orienté, c'est la liste des successeurs (ou des prédécesseurs).

Attention : coïncidence entre le numéro de sommet et l'indice dans la liste.

Par exemple, la matrice d'adjacence du graphe suivant est

$$
\begin{pmatrix}
	0&0&0&0&1&0\\
	1&0&0&1&0&0\\
	0&0&0&0&0&1\\
	0&1&0&1&0&0\\
	0&1&0&1&0&0\\
	0&0&1&0&0&0\\
\end{pmatrix}
$$ et la liste d'adjacence est
$$
\big[[4],\;[0,\;3],\;[5],\;[1,\;3],\;[1,\;3],\;[2]\big].
$$

```{.mermaid format=pdf}
graph TD;

a((0)) --> b((4))

d((1)) --> a
b --> d
b --> c((3)) --> c --> d

e((2)) --> f((5))
f --> e
```


Enregistrements utilisés :

* `Sommet`: liste des sommets adjacents.
	1. identifiant nommé `id` de type `'a`
	2. liste des sommets adjacents, nommé `voisin` de type `'a list`
* `Graphe` : liste des sommets adjacents.

```{.mermaid format=pdf}
	graph TD;

	a((3)) --> d((4))
	b((2)) --> d
	d --> e((5))
	b --> e
	f((6)) --> b
	c((1)) --> d
	c --> d
	c --> f
```

1. Écrire les instructions définissant les deux types et créant le graphe ci dessus :

	```ocaml
	(* Sommet : identifiant et liste de voisins *)
	type 'a sommet = { id : 'a; voisins : 'a list};;

	(* Graphe : liste de sommets *)
	type 'a graphe = 'a sommet list;;

	let g = [
		{ id = 1; voisins = [2; 4; 6] };
		{ id = 2; voisins = [4; 5] };
		{ id = 3; voisins = [4] };
		{ id = 4; voisins = [5] };
		{ id = 5; voisins = [] };
		{ id = 6; voisins = [2] }
	];;
	```

2. Écrire un fonction récursive `ajoute_arete g a b` de type: `ajoute_arete : 'a sommet list -> 'a -> 'a -> 'a sommet list = <fun>`. Aide : `List.mem` indique si le premier argument est un élément de la liste passée (2nd argument).

	Pré-condition : les sommets passés en arguments sont des sommets du graphe.

	```ocaml
	(* pré-condition : a et b sont des sommets du graphe *)
	let rec ajoute_arete g a b = match g with
	  | [] -> failwith "Graphe vide"
	    (* impossible d'ajouter une arête *)
	  | s :: q when s.id = a && List.mem b s.voisins -> g
	    (* teste si a est en tête de liste : si oui (s.id = a) et que b est déjà
	       présent parmi les voisins de a (List.mem b s.voisins).
	       Dans ce cas, on retourne le graphe inchangé *)
	  | s :: q when s.id = a -> { id = a; voisins = b :: (s.voisins) } :: q
	  | s :: q -> s :: (ajoute_arete q a b);;
	```

3. Écrire une fonction recursive `supprime_arete g a b` de signature `supprime_arete : 'a sommet list -> 'a -> 'a -> 'a sommet list = <fun>` supprimant l'arête entre le sommet $a$ et le sommet $b$ contenu dans le graphe $g$.

	```ocaml
	let rec supprime_arete g a b = match g with
	  | [] -> []
	  | s :: q when s.id = a ->
	    let rec aux l = match l with
	      | [] -> []
	      | u :: q when u = b -> q
	      | u :: q -> u :: (aux q)
	    in { id = a; voisins = (aux s.voisins) } :: q
	  | s :: q -> s :: (supprime_arete q a b);;
	```

	ou

	```ocaml
	let rec supprime_arete g a b =
	  let rec aux = function
	    (* parcours de la liste des voisins de a *)
	    | [] -> failwith "sommet b absent des voisins de a"
	      (* pas de voisins *)
	    | t :: q when t = b -> q
	      (* b : premier voisin dans la liste *)
	    | t :: q -> t :: (aux q)
	      (* recherche de b parmi les voisins suivants *)
	  in match g with
	    | [] -> failwith "sommet a absent"
	    | s :: q when s.id = a -> { id = a; voisins = aux s.voisins } :: q
	      (* sommet a trouvé : appel de aux pour rechercher b parmi les voisins *)
	    | s :: q -> s :: (supprime_arete q a b);;
	      (* recherche de a parmi les sommets suivants dans le graphe *)
	```

4. Écrire une fonction récursive `ajoute_sommet` de signature `ajoute_sommet : 'a sommet list -> 'a -> 'a sommet list = <fun>` ajoutant un sommet.

	```ocaml
		let rec ajoute_sommet g a =
		  match g with
		    | [] -> [{ id = a; voisins = {} }]
		      (* graphe vide -> ajout du sommet *)
		    | x :: q when x.id = a -> g
		      (* a dans le graphe -> pas de modification de g *)
		    | x :: q -> x :: (ajoute_sommet q a);;
		      (* poursuite de la recherche de a dans le reste du graphe *)
	```

5. Écrire un fonction récursive `supprime_sommet g a` permettant de supprimer un sommet $a$ du graphe $g$ avec la signature `supprime_sommet : 'a sommet list -> 'a -> 'a sommet list = <fun>`.

	```ocaml
		let rec supprime_sommet g a =
		  (* exploration de la liste des voisins pour éliminer a *)
		  let rec aux = function
		    | [] -> []
		    | t :: q when t = a -> q
		    | t :: q -> t :: (aux q)
		  in match g with
		    | [] -> []
		    | s :: q when s.id = a -> supprime_sommet q a
		    | s :: q ->
		      let ns = { id = s.id; voisins = aux s.voisins }
		        in ns :: (supprime_sommet q a);;
	```

### Bilan :

En C : tableau de pointeurs sur liste chaînée d'enregistrements (voir chaînage externe)

Ordre des sommets arbitraire dans la liste des voisins

Remplacement du numéro du sommet par un doublet (sommet, poids) pour un graphe pondéré.

Avantages :

 - représentation assez souple : facilité pour ajouter ou supprimer des sommets ou des arêtes,
 - occupation mémoire en $n + p$ ($n$ sommets et $p$ arcs)

Inconvénient : pas d'accès rapide à un sommet ou à une arête particulière


## Matrices d'adjacence

```ocaml
let liste_to_matrice liste =
  let n = List.length liste in
  let matrice = Array.make_matrix n n 0 in

  for a = 0 to (n - 1) do
    let voisins = (List.nth liste a).voisins in

    for b = 0 to (List.length voisins - 1) do
      matrice.(a).(List.nth voisins b) <- 1;
    done;
  done;

  matrice;;

let matrice_to_liste matrice =
  let liste = ref [] in
  let n = Array.length matrice in
  for a = 0 to (n - 1) do
    let voisins = ref [] in
    for b = (n-1) downto 0 do
      if matice.(a).(b) <> 0 then
        voisins := b :: !voisins;
    done;

    let enr = { id = a; voisins = !voisins } in
    liste := enr :: !liste;
  done;
  liste;;
```

### Bilan

Remplacement du 1 par le poids de l'arc pour un graphe pondéré

Avantages :

- Facilité en coût constant aux informations (coût d'un accès tableau)
- Facilité pour ajouter ou supprimer des sommets ou des arêtes

Inconvénients :

- Ajout / Suppression de sommets
- Coût en mémoire : $n^2$ variables où $n$ est le nombre de sommets

# III. Parcours de graphe

## Définitions

Parcours de graphe : Énumération de l'ensemble des sommets accessibles par un chemin pour le appliquer un traitement

Objectif : Étude d'une propriété du graphe (biparti, connexité, ...)

Différentes possibilités mais nécessité de maintenir à jour deux listes :

- Liste des sommets déjà traités $\to$ déjà vus
- Liste des sommets en cours de traitement $\to$ à traiter

Différence entre parcours :

- Manière dont sont ajoutés et extraits les sommets
- Dépend de la structure de données utilisée

Principe :

```
à_traiter <-- [ s0 ]
déjà_vus <-- [ s0 ]

tant que à_traiter != [] faire
  extraire s de à_traiter
  appliquer le traitement à s
  ajouter s à déjà_vus

  pour tout les voisins t de s faire
    si t n'est pas déjà dans déjà_vus alors
      ajouter t à à_traiter
    fin si
  fin pour
fin tant que
```

## Parcours en largeur

Breadth First Search (BFS)

Structure utilisée : file d'attente (FIFO) pour stocker les sommets

Utilisé notamment pour les recherches de plus court chemin

Exemple : pour le graphe

```{.mermaid format=pdf}
	graph LR;

	A --> B
	A --> C --> B
	C --> E --> D --> C
	E --> F --> B
```

+-------------------+---------------+
| $\to$ à traiter   | déjà vus      |
+-------------------+---------------+
|    A              | $\varnothing$ |
+-------------------+---------------+
|   BC              |    A          |
+-------------------+---------------+
|    C              |   AB          |
+-------------------+---------------+
|    E              |   ABC         |
+-------------------+---------------+
|   DF              |   ABCE        |
+-------------------+---------------+
|    F              |  ABCED        |
+-------------------+---------------+
|   $\varnothing$   |  ABCEDF       |
+-------------------+---------------+


Pour gérer une file en OCamL, on utilise le module `Queue` et éventuellement la fonction `List.iter`. (les fonctions ne sont pas à connaître; si on en a besoin, elle seront rappelées)


```ocaml
let bfs_queue traitement g initial =
  (* Création d'un array de false : mémoire des sommets traités *)
  let deja_vus = Array.make (Array.length g) false in
  (* Creation d'une file pour ordre de traitement *)
  let a_traiter = Queue.create() in

  (* Fonction traitement d'un sommet et mise à jour des structures *)
  let ajoute x =
    if not deja_vus.(x) then
      begin
        (* Consultation de deja_traite : si le sommet n'a pas été traité *)
        traitement x;
        deja_vus.(x) <- true (* Mise à jours de la liste des sommets traités : true *)
        Queue.push x a_traiter (* Ajout du sommet de la file *)
      end
  in
    ajoute initial; (* Appel de ajout avec le sommet initial *)

  (* Tant que la file n'est pas vide *)
  while not (Queue.is_empty a_traiter) do
    let x = Queue.pop a_traiter in (* Extraction du sommet de la file *)

    (* Pour appeler ajoute à chacun des éléments de g.(x), donc les successeurs de x *)
    List.iter ajoute g.(x);
  done;;

let bfs_artisanal traitement g initial =
  let deja_vus = Array.make (Array.length g) false in
  deja_vus.(initial) <- true;
  
  let rec traite_sommet liste = match liste with
    | []     -> ()
    | x :: q -> traitement x;
                traite_sommet (q @ voisins g.(x))
  and voisins liste = match liste with
    | []                        -> []
    | y :: q when deja_vus.(y)  -> voisins q
    | y :: q                    -> deja_vus.(y) <- true;
                                   y :: voisins q
  in traite_sommet [ initial ];;
```

Complexité majorée par la taille de graphe donc $\mathcal{O}\big(|S| + |A|\big)$.

Départ du sommet $O$.

Quand la file `a_traiter` est vide, on identifie les composantes connexes.


# IV. Algorithmes des graphes

## Algorithmes du plus court chemin

### A. Dijkstra

#### 1. Définition et théorème

Plus court chemin dans un graphe pondéré : longueur / coût d'un chemin : somme des poids des arêtes

Objectif : déterminer le chemin de longueur minimale entre deux sommets $s$ et $s'$ 

Théorème : Soit $G = (S,A)$ un graphe orienté pondérés à poids positifs ou nuls. Soient $s$ et $s'$ deux sommets de $G$. Si $s$ et $s'$ sont reliés par un chemin, alors il existe un plus court chemin de $s$ à $s'$.

Démonstration : Soit $c$ un chemin joignant $s$ à $s'$. Si $c$ passe à deux reprises par le même sommet, un cycle est présent sur le chemin $c$. Ce cycle peut être supprimé du chemin $c$. Le processus peut être itéré jusqu'à la disparition des cycles du chemin. Le plus court chemin de $s$ à $s'$ est donc un chemin pour lequel tous les sommets $(s, s_1, \ldots, s')$ sont distincts. Le nombre de sommets étant fini, le nombre de chemins passant par des sommets distincts l'est aussi. Il existe donc un chemin de longueur minimale parmi ces chemins.

Algorithme de Dijkstra : plus court chemin depuis un sommet vers tous les autres sommets du graphe.

Soit $G = (S,A)$ un graphe pondéré et soit $M$ un ensemble de sommets. Un $M$-chemin est un chemin dont tous les sommets jusqu'à l'avant denier sont dans $M$ et le dernier sommet n'est pas dans $M$.

Théorème : Soit $c$ un $M$-chemin, de longueur minimale et $x$ sont dernier sommet (on fixe $c$ ${\color{red} \text{\sc puis}}$ on fixe $x$). Alors $c$ est le plus court chemin de $s$ à $x$.

Démonstration (par l'absurde):

> Supposons qu'il existe $c'$ un chemin de $s$ à $x$, de longueur strictement inférieure à la longueur de $c$ : $$\ell(c') < \ell(c)$$ où $\ell(c)$ est la longueur du chemin $c$.

> Soit $x'$, le premier sommet de $c'$ n'étant pas dans $M$.

> Le sous chemin $c''$ de $s$ à $x'$ est un $M$-chemin. Donc $\ell(c'') \leqslant \ell(c')$ car les poids sont positifs ou nuls.

> Et, $\ell(c'') < \ell(c)$, ce qui contredit l'hypothèse selon laquelle $c$ est un chemin de longueur minimale allant de $s$ à $x$.

#### 2. Principe de l'algorithme de Dijkstra

On définit:

- distance : ensemble des distances depuis $s$; distance[$i$] est la longueur du plus court chemin de $s$ à $i$. À l'initialisation, toutes les distances sont infinies. L'algorithme affine progressivement l'estimation du plus court chemin.
- prédécesseur : ensemble des prédécesseurs pour un chemin depuis $s$ où prédécesseur[$i$] est le prédécesseur du sommet $i$ sur le le plus court chemin provisoire depuis $s$.
* $M$ est l'ensemble des sommets déjà traités; on utilise le théorème des $M$-chemins pour bâtir progressivement les plus courts chemins depuis $s$.
* $E$ est l'ensemble des sommets en attente d'être traités. On a constamment $S = M \cup E$ : invariant de l'algorithme de Dijkstra.

Propriétés : cf poly

#### 3. Exemple

1. Indiquer l'état de `Distances`, `Prédécesseurs`, $M$ et $E$ après chaque itération.

> Pour l'initialisation, $$ \begin{cases}
		M = \varnothing,\\
		E = \{0, 1, 2, 3, 4\},\\
		\text{Distance} : [0, +\infty, +\infty, +\infty, +\infty],\\
		\text{Prédécesseur} : [\text{nil},\text{nil},\text{nil},\text{nil},\text{nil}].
	\end{cases}$$
> Après une itération, on a $$ \begin{cases}
		M = \{0\},\\
		E = \{1, 2, 3, 4\},\\
		\text{Distance} : [0, 10, +\infty, 5, +\infty],\\
		\text{Prédécesseur} : [\text{nil},0,\text{nil},0,\text{nil}].
	\end{cases}$$
> Après deux itérations, on a $$ \begin{cases}
		M = \{0, 3\},\\
		E = \{1, 2, 4\},\\
		\text{Distance} : [0, 8, 14, 5, 7],\\
		\text{Prédécesseur} : [\text{nil},3,3,0,3].
	\end{cases}$$
> Après trois itérations, on a $$ \begin{cases}
		M = \{0, 3, 4\},\\
		E = \{1, 2\},\\
		\text{Distance} : [0, 8, 13, 5, 7],\\
		\text{Prédécesseur} : [\text{nil},3,4,0,3].
	\end{cases}$$
> Après quatre itérations, on a $$ \begin{cases}
		M = \{0, 3, 4, 1\},\\
		E = \{2\},\\
		\text{Distance} : [0, 8, 9, 5, 7],\\
		\text{Prédécesseur} : [\text{nil},3,1,0,3].
	\end{cases}$$
> Après cinq itérations, on a $$ \begin{cases}
		M = \{0, 3, 4, 1, 2\},\\
		E = \varnothing,\\
		\text{Distance} : [0, 8, 9, 5, 7],\\
		\text{Prédécesseur} : [\text{nil},3,1,0,3].
	\end{cases}$$

2. Pour `distance`, `prédécesseur`, $M$ et $E$, on utilise des tableaux. Pour le graphe $G$, on utilise une matrice d'adjacence.

2. Pour le graphe, on utilise une liste d'adjacence car ça économise de la mémoire et l'accès aux voisins est plus simple. Pour `distance` et `prédécesseur`, on utilise deux tableaux d'entiers de dimension $\#S$. Pour $M$ et $E$, on utilise un tableau de bouléens de taille $\#S$ où $x \to$ `true` représente $x \in E$ et $x \not\in M$ et $x\to$ `false` représente $x \in M$ et $x \not\in E$.

3. On utilise la stratégie gloutonne.

```
Alorgithme Dijkstra(G, s):
	distances = créer_tableau(nb_sommets, +infini)
	prédécesseurs = créer_tableau(nv_sommets, nil)
	distances[s] = 0
	dist = créer_file(nb_sommets)
	E = créer_tableau(nb_sommets, true)

	Tant que dist n'est pas vide faire
		u <- extraire_min(dist)
		rétablire_propriété_file(dist) # O(|S| ln(|S|))
		E[u] = false

		Pour chaque voisin v de u présent tel que E[v] = true faire # O(|A|)
			Si distances[v] >= distances[u] + pondération(u,v) alors
				distances[v] = distances[u] + pondération(u,v) alors
				diminuer_clé(dist, v) # O(ln(|S|))
				prédécesseurs[v] = u
			Fin Si
		Fin Pour
	Fin Tant Que
```

La complexité de cet algorithme est donc $$
	\mathcal{O}\Big(\big(|A| + |S|\big) \times \ln\big(|S|\big)\Big).
$$

La terminaison et l'invariant sont sur le polycopié.

### B. Floyd-Warshall

Plus court chemin dans un graphe pondéré avec des pondérations positives ou négatives mais pas de cycle de poids strictement négatifs.

Plus courts chemins entre toutes les paires de sommets.

Utilisation de la programmation dynamique : sous structure optimale, chevauchement de sous-problèmes et mémorisation des résultats.

```{.mermaid format=pdf}
graph LR;
a((1)) --> |10| b((2)) --> |2| c((4)) --> |3| b --> |1| d((3)) --> |4| e((5)) --> |7| a
a --> |5| c --> |9| d
e --> |3| d
```

*Dans le graphe, quel est le plus court chemin de 5 à 2 ?*
$$ 5 \to 1 \to 4 \to 2\qquad\text{coût : 15}$$


Mise en place de deux matrices:

- une matrice contenant les chemins (prédécesseurs)
- une matrice contenant les distances

$$
\rotatebox{90}{~~\clap{\tiny sommet de départ}}
\overset{\text{sommet d'arrivée}}{
\begin{bmatrix}
\infty&8&9&5&7\\
11&\infty&1&2&4\\
11&19&\infty&16&4\\
9&3&4&\infty&2\\
7&15&6&12&\infty
\end{bmatrix}}
$$
$$
\begin{bmatrix}
1&4&2&1&4\\
5&2&2&2&4\\
5&4&3&1&3\\
5&4&2&4&4\\
5&4&5&1&5\\
\end{bmatrix}
$$



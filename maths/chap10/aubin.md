## 1 - Axiomatique de $\N$

#### Axiome : Axiomatique de Von Neumann

		$(\N, \leq)$ est un ensemble totalement ordonné vérifiant
				Toute partie non vide de $\N$ a un plus petit élément
				Toute partie non vide majorée de $\N$ a un plus grand élément
				$\N$ n’est pas majoré

#### Définition : $0$

		$0 = \text{min}(\N)$

#### Définition : $1$

		$1 = \text{min}(\N \text{\\} \{0\})$

#### Définition : $n+1$

		Soit $n \in \N$
		On pose $n+1 = \text{min}(\{k \in \N|k>n\})$
		On dit que $n+1$ est le successeur de $n$

#### Proposition : $+1-1$

		$\forall n \in \N, (n+1)-1 = n$
		$\forall n \in \N, (n-1)+1 = n$

#### Preuve

		Soient $n \in \N,\ p = n+1,\ q = p-1$ 

		$n < p$ et $q < p$
		Donc $n \leq q$ car $q = \text{max}(\{k \in \N|k<p\})$
		Si $q > n$, alors $q \ge p$ car $p = \text{min}(\{k \in \N|k >n\})$
		Donc $q = n$

#### Proposition : Ensemble Ouvert Vide

		$\forall n \in \N, ]n, n+1[ = \varnothing$

#### Preuve

		Soit $n \in \N$, on sait que $n+1>n$
		Soit $p>n$, on suppose $n < p < n+1$
		Comme $p >n, p \ge n+1$		Contradiction

#### Proposition : Théorème de Récurrence

		Soit $P$ un prédicat sur $\N$ et $n \in \N$
		Si $\left\{\begin{array}{l c r}P(n_0) \text{ est vrai} \\ \forall n \ge n_0n P(n) \Longrightarrow P(n+1) \end{array}\right.$
		Alors $ \forall n \ge n_0, P(n)$ est vrai

#### Preuve

		Soit $A = \{n \in \N|n \ge n_0 \}$ et $P(n)$ faux
		Supposons $A \neq \varnothing$
		$A$ a donc un plus petit élement, soit $N = \text{min}(A)$

		Cas 1 : $N = 0$
				Alors, comme $N \in A$, on a $n_0 \leq 0$ et $P(0)$ est faux
				Alors $n_0 = 0$		Contradiction avec “$P(n)$ est vrai”

		Cas 2 : $N \neq 0$
				Alors $N-1 \in \N$
				$N-1 \notin A$ car $N-1 < N$
				Donc $N-1 < n_0$ ou $P(n)$ vrai

				Supposons $N-1 < n_0$
				$N \in A$ donc $N \ge n_0$
				$N-1 < n_0 < N$
				Donc $N = n_0$
				Or, $N \in A$ donc $P(n)$ est faux alors que $P(n)$ est vrai

				Supposons $\left\{\begin{array}{l c r}P(n-1) \text{ vrai} \\ N-1 \ge n_0\end{array}\right.$		Comme $N-1 \ge n_0, P(N-1) \Longrightarrow P(N)$

				Donc $P(N)$ est vrai
				Or, $N \in A$ donc $P(N)$ est faux

				Donc $A = \varnothing$



## 2 - Récurrences

#### Proposition : Récurrence Double

		Soient $P$ un prédicat sur $\N$ et $n_0 \in N$
		Si $\left\{\begin{array}{l c r} P(n_0)\text{ est vrai} \\ P(n_0 + 1) \text{ est vrai} \\ \forall n > n_0, P(n)\text{ et } P(n+1) \Longrightarrow P(n+2) \end{array}\right.$
		Alors $\forall n \ge n_0, P(n)$ est vrai

#### Preuve

		On pose $\forall n \in \N, Q(n) :$ “$P(n)\text{ et } P(n+1) \text{ vrais}$ ”
		$Q(n_0)$ est vrai

		Soit $n \ge n_0$, on suppose $Q(n)$ vrai
		On sait alors que $P(n+2)$ est vrai
		On sait par hypothèse de récurrence que $P(n+1)$ est vrai
		Donc $Q(n+1)$ est vrai

#### Proposition : Récurrence Multiple

		Soient $P$ un prédicat sur $\N$ et $(p, n_0) \in \N^2$
		Si $\left\{\begin{array}{l c r} \forall k \in [\![0,p]\!], P(n_0-k)\text{ est vrai} \\ \forall n \ge n_0, (P(n) \text{ et ... } P(n+p-1)) \Longrightarrow P(n+p) \end{array}\right.$
		Alors $\forall n \ge n_0, P(n)$ est vrai

#### Proposition : Récurrence Forte

		Soient $P$ un prédicat sur $\N$ et $n_0 \in \N$
		Si $\left\{\begin{array}{l c r} P(n_0)\text{ est vrai} \\ \forall n \ge n_0, (P(n_0) \text{ et ... } P(n-1)) \Longrightarrow P(n) \end{array}\right.$
		Alors $\forall n \ge n_0, P(n)$ est vrai

#### Preuve

		On pose $\forall n \in N, Q(n) :$ “$\forall k \in [\![n_0,n]\!], P(k) \text{ vrai}$”
		$Q(n_0)$ est vrai car $P(n_0)$ est vrai

		Soit $n \ge n_0$, on suppose $Q(n)$ vrai
		On sait que $\forall k \in [\![n_0,n]\!], P(k)$ est vrai
		Alors $P(n+1)$ est vrai
		Donc $\forall k \in [\![n_0,n+1]\!], P(k)$ est vrai
		Donc $Q(n+1)$ est vrai



## 3 - Divisibilité

#### Définition : Divisibilité

		Soient $(a,b) \in \Z^2$
		On dit que $a$ divise $b$ si il existe $k \in \Z$ tel que $b = ka$
		On écrit $a|b$ et on dit que $\left\{\begin{array}{l c r}a \text{ est un diviseur de }b \\b \text{ est un multiple de }a\end{array}\right.$

#### Proposition : Caractéristiques de la Divisibilité

		$|$ est une relation d’ordre sur $\Z$
		Ce n’est pas une relation totale

#### Proposition : Ordonnancement et Divisibilité

		Soient $(a,b) \in \Z\cross \Z^*$
		Si $a|b, |a| \leq |b|  $

#### Proposition : Divisibilité et Combinaison Linéaire

		Soient $(a,b,c) \in (\Z^*)^3$
		$\left\{\begin{array}{l c r}a|b\\a|c\end{array}\right. \Longrightarrow \forall (k,l) \in \Z^2, a|(bk+cl)$

#### Preuve

		$\left\{\begin{array}{l c r}b=au \text{ avec }u \in \Z \\ c = av \text{ avec } v \in \Z \end{array}\right.$
		Soient $(k,l) \in \Z^2$
		$bk + cl = auk+avl = a(uk+vl)$
		Donc $a|(bk+cl)$

#### Définition : Nombres Associés

		Soient $(a,b) \in \Z^2$

		$a$ et $b$ sont associés si $a=b$ ou $a=-b$

#### Proposition : Nombres Associés et Divisibilité

		Soient $(a,b) \in \Z^2$
		$a|b \iff -a|b \iff a |-b \iff-a|-b$



## 4 - Division Euclidienne

#### Proposition : Division Euclidienne dans $\N$

		Soient $a \in \N$ et $b \in \N^*$
		$\exist!(q,r)\in \N^2, \left\{\begin{array}{l c r}a = bq+r \\r \in [0,b[\end{array}\right.$

#### Preuve

		Existence : On considère| $A = \{q \in \N|qb\leq a\}$ $A$ est non vide car $0 \in A$
				$A$ est majoré : $\forall q \in A, q \leq a$ car $a \ge qb \ge q$

				Soit $q = \text{max}(A)$, on pose $r = a-bq$
				Comme $a,b$ et $q \in \N, r \in \Z$
				$q \in A$ donc $qb \leq a$ donc $r \ge 0$
				$q+1 > \text{max}(A)$ donc $q+1 \notin A$ donc $(q+1)b > a$
				Donc $r < b$

		Unicité : Soit $(q',r') \in \N^2$ tel que $\left\{\begin{array}{l c r}a+bq'+r'\\0\leq r'<b\end{array}\right.$
				On sait aussi que $a = bq+r$
				Donc $0 = b(q'-q) + r'-r$
						$-r'+r=b(q'-q)$

				De plus, $\left\{\begin{array}{l c r}0\leq r < b \\ -b < -r \leq 0\end{array}\right.$
				Donc $-b < r'-r<b$

				Le seul multiple de $b$ dans $]\!]-b,b[\![$ est $0$
				Donc $r'-r=0$, donc $r=r'$
				et $b(q'-q)=0$
				Or, $b \neq 0$ donc $q'-q=0$ donc $q=q'$

#### Proposition : Division Euclidienne dans $\Z$

		Soient $a \in \Z$ et $b \in \Z^*$
		$\exist! (q,r) \in \Z^2, \left\{\begin{array}{l c r}a=bq+r \\ 0 \leq r < |b| \end{array}\right.$

#### Preuve

		Existence :
				Cas 1 : $a \in \N, b \in \N^*$
						D’après ce qui précède, $\exist!(q,r) \in \N^2, \left\{\begin{array}{l c r}a=bq+r \\ 0 \leq r <b\end{array}\right.$
						Comme $b \in \N^*$, on a bien $0 \leq r < |b| $
						$q \in \N \subset \Z$

				Cas 2 : $a \in \Z, b \in \N^*$
						Comme $-a \in \N, \exist! (q',r') \in \N^2, \left\{\begin{array}{l c r}-a=bq'+r' \\ 0 \leq r' < b\end{array}\right.$

						Donc $a = b(-q') - r'$
								$=b(-q'-1) - r'+b$

						On pose $q = \left\{\begin{array}{l c r}-q'-1 \text{ si } r \neq 0 \\-q' \text{ si }r = 0 \end{array}\right.$	et	$r = \left\{\begin{array}{l c r}-r'+b \text{ si }r' \neq 0 \\ r' \text{ si } r'= 0\end{array}\right.$
						On a bien $\left\{\begin{array}{l c r}a = bq+r \\q \in \Z \\ 0 \leq r < |b| \end{array}\right.$

				Cas 3 : $a \in \N, b \in \Z^*_-$
						$\exist! (q',r') \in \N^2, \left\{\begin{array}{l c r}a=(-b)q'+r' \\0 \leq r' < -b\end{array}\right.$

						On pose $\left\{\begin{array}{l c r}q=-q'\\r=r'\end{array}\right.$
						Et on a bien $\left\{\begin{array}{l c r}a = bq+r \\0 \leq r < |b| \end{array}\right.$

				Cas 4 : $a \in \Z^-, b \in \Z^*_-$
						$\exist! (q',r') \in \N^2, \left\{\begin{array}{l c r}-a=-bq'+r' \\ 0 \leq r' < -b\end{array}\right.$

						Donc $a = bq' - r'$
								$=b(q'+1) - r'-b$

						On pose $q = \left\{\begin{array}{l c r}q'+1 \text{ si } r \neq 0 \\q' \text{ si }r = 0 \end{array}\right.$	et	$r = \left\{\begin{array}{l c r}-r-b' \text{ si }r' \neq 0 \\ r' \text{ si } r'= 0\end{array}\right.$
						On a bien $\left\{\begin{array}{l c r}a = bq+r \\q \in \Z \\ 0 \leq r < |b| \end{array}\right.$

		Unicité :
				Soit $(q',r') \in \Z^2$ tel que $\left\{\begin{array}{l c r}a=bq'+r' \\ 0 \leq r' < |b| \end{array}\right.$ et $\left\{\begin{array}{l c r}a = bq+r \\0 \leq r < |b|  \end{array}\right.$

				D’où $\left\{\begin{array}{l c r}b(q'-q) = r'-r \\ -|b| < r -r' < |b|   \end{array}\right.$
				Donc $r-r'=0$

				Donc $r'=r$ et $q'=q$

#### Définition : Quotient et Reste

		Soient $a \in \Z$ et $b \in \Z^*$
		D’après le théorème précédent, $\exist! (q,r) \in \Z\cross \N, \left\{\begin{array}{l c r}a=bq+r \\ 0 \leq r < |b| \end{array}\right.$
		On dit que $q$ est le quotient et $r$ le reste dans la division (euclidienne) de $a$ par $b$

#### Proposition : Reste et Divisibilité

		Soient $a \in \Z, b \in \Z^*$
		On note $r$ le reste de la division de $a$ par $b$
		$r = 0 \iff b|a$

#### Preuve

		On pose $a = bq+r, q \in \Z$

		“$\Longrightarrow$” : Si $r = 0$, alors $\left\{\begin{array}{l c r}a = bq\\q \in \Z\end{array}\right.$	donc $b|a$

		“$\Longleftarrow$” : Si $b|a$, $\exist k \in \Z, a =bk$
				Donc $\left\{\begin{array}{l c r}a = bk+0\\0 \leq 0 < |b| \end{array}\right.$
				Par unicité du reste, $r=0$



## 5 - Arithmétique Modulaire

#### Définition : Congruences

		Soient $(a,b) \in \Z^2, c \in \N^*$
		On dit que $a$ et $b$ sont congrus modulo $c$ si $a$ et $b$ ont le même reste dans ma division par $c$
		On note $a = b[c]$

#### Proposition : Congruence et Relation D’Equivalence

		La relation de congruence modulo $c$ est une relation d’équivalence

#### Notation : Classes d’Equivalence Modulo $c$

		On note $\Z/c \Z$ l’ensemble des classes d’équivalence modulo $c$
		$\Z/5 \Z = \{\bar0, \bar1, \bar2, \bar3, \bar4\}$

#### Proposition : Modulo et Divisibilité

		Soient $(a,b) \in \Z^2$ et $c \in \N^*$
		$a \equiv b [c] \iff c | b-a$

#### Preuve

		“$\Longrightarrow$” : On pose $\left\{\begin{array}{l c r}a = cq+r, q \in \Z, 0\ \leq r < c \\ b = cq' + r, q' \in \Z\end{array}\right.$
				Donc $b-a = c(q'-q)$
				Donc $c|b-a$

		“$\Longleftarrow$” : On pose $\left\{\begin{array}{l c r}a = cq+r, q \in \Z, 0\ \leq r < c \\ b = cq' + r', q' \in \Z, 0\ \leq r' < c\end{array}\right.$
				$b-a = c(q'-q) + r'-r$
				$-c \leq r'-r \leq c$

				Si $r'-r \ge 0, r'-r$ est le reste de la division de $a-b$ par $c$
				Donc $r'=r$ donc $a \equiv b [c]$

				Si $r'-r < 0, r-r'$ est le reste de la division de $a-b$ par $c$
				Donc $r'=r$ donc $a \equiv b[c]$

#### Proposition : Addition et Multiplication de Congruences

		Soient $(a,b,x,y) \in \Z^4$ et $c \in \N^*$
		On suppose $\left\{\begin{array}{l c r}a \equiv b[c]\\x \equiv y [c]\end{array}\right.$

		Alors $\left\{\begin{array}{l c r}a+x \equiv b+ y [c] \\ ax \equiv by [c] \end{array}\right.$

#### Preuve

		$c|b-a$ et $c|y-x$
		Donc $c|(b-a+y-x)$
		Donc $c|(b+y-(a+x))$
		Donc $a+x \equiv b+y [c]$

		On pose $\left\{\begin{array}{l c r}a = ck+b, k \in \Z \\ x = cl+y, l \in \Z\end{array}\right.$
		$ax = (ck+b)(cl+y)$
				$=by+cky+clk+c^2kl$
				$=by+c(ky+bl+clk)$
		Donc $ax \equiv by [c]$

#### Proposition : Critères de Divisibilité en Base 10

		Soit $N \in \N$, on notera ses chiffres $a_0...a_n$
		$N = \overset{n}{\underset{k=0}{\sum}}10^ka_k$

		Divisibilité par $2$ :
				$N$ pair $\iff N \equiv 0[2]$
						$\iff \overset{n}{\underset{k=0}{\sum}} 10^ka_k \equiv 0 [2]$
						$\iff a_0 \equiv 0 [2]$ car	$\forall k \ge 1, 10^k \equiv 0 [2] \\10^0 = 1 \equiv 1 [2]\quad\ $

		Divisibilité par $3$ :
				$\forall k \in \N, 10^k \equiv 1^k \equiv1 [3]$ car $10 \equiv 1 [3]$
				$3|N \iff N \equiv 0 [3]$
						$\iff \overset{n}{\underset{k=0}{\sum}}10^ka_k \equiv 0 [3]$

		Divisibilité par $9$ : 
				$\forall k \in N, 10^k \equiv 1 [9]$
				$9|N \iff N \equiv 0 [9]$
						$\iff \overset{n}{\underset{k=0}{\sum}}10^ka_k \equiv 0 [9]$

		Divisibilité par $5$ :
				$\left\{\begin{array}{l c r}10^0 \equiv 1 [5] \\ \forall k \in \N^*, 10^k \equiv 0 [5] \end{array}\right.$
				$5|N \iff a_0 \equiv 0 [5]$
						$\iff a_0 \in \{0,5\}$

		Divisibilité par $11$ :
				$10^0 \equiv -1 [11]$
				Donc $\forall k \in \N, 10^k \equiv (-1)^k[11]$
				$N \equiv 0 [11] \iff \overset{n}{\underset{k=0}{\sum}}(-1)^ka_k \equiv 0 [11]$
						$\iff a_0-a_1+a_2...+(-1)^na_n \equiv 0 [11]$

#### Remarque : Réécriture en Classes d’Equivalence

		On peut réecrire le calcul précédent dans $\Z/11 \Z$ 
		$\overline N = \overline{\overset{n}{\underset{k=0}{\sum}}10^ka_k} = \overset{n}{\underset{k=0}{\sum}}\overline{10^k}\ \overline{a_k} = \overset{n}{\underset{k=0}{\sum}}\overline{(-1)^k}\ \overline{a_k}$

#### Remarque : Opération dans $\Z / n \Z$

		Dans $\Z / n \Z$, on dispose $\left\{\begin{array}{l c r}\text{d’une addition} : \quad\quad\ \ \overline{a} + \overline{ b} = \overline{a+b} \\ \text{d'une multiplication} : \overline{a} * \overline{b} = \overline{a*b}\end{array}\right.$

		L’addition est commutative, associative, n’élément neutre $\overline{0}$ et l’opposé de $\overline{a}$ est $\overline{-a}$
		La multiplication est commutative, associative, d’élément neutre $\overline{1}$ et distributive par rapport à $+$



## 6 - PCGD et PPCM

#### Définition : PGCD

		Soient $(a,b) \in \Z^2$
		Le PGCD de $a$ et $b$ est le plus grand diviseur commun à $a$ et $b$
		Il existe car $\mathcal{D} = \{d \in \N|d|a \text{ et } d|b\}$ est non vide car $a \in \mathcal{D}$
		$\mathcal{D}$ est majoré par $|a| $
		On le note $\text{PGCD}(a,b)$ ou $a\wedge b$

#### Proposition : Théorème d’Euclide

		Soient $a \in \Z, b \in \N^*$
		Soit $r$ le reste de la division de $a$ par $b$
		$a \wedge b = b \wedge r$

#### Preuve

		On pose $\left\{\begin{array}{l c r}d = a \wedge b\\ \varsigma = b \wedge r \\ a = bq+r\end{array}\right.$

		$\left\{\begin{array}{l c r}d|a\\d|b\end{array}\right. \Longrightarrow \left\{\begin{array}{l c r}d|a-bq\\d|b\end{array}\right. \Longrightarrow \left\{\begin{array}{l c r}d|r\\d|b\end{array}\right. \Longrightarrow  d \leq \varsigma$

		$\left\{\begin{array}{l c r}\varsigma|b\\\varsigma|r\end{array}\right. \Longrightarrow \left\{\begin{array}{l c r}\varsigma|bq+r\\\varsigma|b\end{array}\right. \Longrightarrow \left\{\begin{array}{l c r}\varsigma|a\\\varsigma|b\end{array}\right. \Longrightarrow \varsigma \leq d$

		Donc $d = \varsigma$

#### Proposition : PGCD et Diviseurs

		Soient $(a,b) \in \Z^2$ et $d = a \wedge b$
		$\mathcal{D} = \{k \in \Z|\ k|a, k|b \}$
		$\forall k \in \Z, k \in \mathcal{D} \iff k|d$

#### Preuve

		“$\Longleftarrow$” : Soit $k \in \Z$, on suppose $k|d$
				$d|a$ donc $k|a$
				$d|b$ donc $k|b$

				Donc $k \in \mathcal{D}$

		“$\Longrightarrow$” : Soit $k \in \mathcal{D}$
				On pose $r_0$ le reste de la division de $a$ par $b$,
				$r_1$ le reste de la division de $b$ par $r_0$
				et $\forall n \in \N, r_{n+1}$ le reste de la division de $r_{n-1}$ par $r_n$ si $r_n \neq 0$

				La suite $(r_n)$ est décroissante, minorée par $0$ et à valeurs entières
				Soit $N \in \N$ tel que $r_N = 0$			(si $N=0$, on pose $r_{-1} = b$)

				D’après la poposition précédente,
				$d =a \wedge b = b \wedge r_0 = r_0 \wedge r_1...r_{N-1} \wedge r_N$
						$= r_{N-1} \wedge 0 = r_N$

				On pose aussi $\forall n \in [\![1, N-1]\!], r_{n-1} = r_nq_n + r_{n+1}$
				On en déduit que $\exists(\alpha_n, \beta_n) \in \Z^2, r_{N-1} = a \alpha_N + b \beta_N$
				$\left\{\begin{array}{l c r}k|a\\k|b\end{array}\right. \Longrightarrow k|a \alpha_N + b \beta_N \Longrightarrow k|r_{N-1} \Longrightarrow k|d$

#### Définition : PPCM

		Soit $(a,b) \in \Z^2$, on pose $M = \{k \in \N|\ a|k, b|k\}$
		$M \neq \varnothing$ car $ab \in M$
		$M \neq \varnothing$ donc admet un plus petit élément noté $\text{PPCM}(a,b)$ ou $a \vee b$

#### Proposition : Produit PGCD PPCM

		$\forall (a,b) \in \Z^2, (a \wedge b)(a \vee b) = ab$

#### Preuve

		Voir paragraphe Facteurs Premiers

#### Proposition : Propriétés de $\wedge$ et $\vee$

		$\wedge$ est commutative, associative sur $\Z^*$
		$\vee$ est commutative, associative sur $\Z^*$

#### Preuve

		Soient $(a,b,c) \in (\Z^*)^3, d = (a \wedge b) \wedge c, \varsigma = a \wedge (b \wedge c)$ 

		$\left\{\begin{array}{l c r}d|c\\d|a \wedge b\end{array}\right. \Longrightarrow \left\{\begin{array}{l c r}d|c\\d|a\\d|b\end{array}\right.$

		$\left\{\begin{array}{l c r}\varsigma|a\\\varsigma|b \wedge c\end{array}\right. \Longrightarrow \left\{\begin{array}{l c r}\varsigma|a\\\varsigma|b\\\varsigma|c\end{array}\right.$

		On pose $\varepsilon = \text{PGCD}(a,b,c)$
		On a $\left\{\begin{array}{l c r}d \leq \varepsilon \\ \varsigma \leq \varepsilon\end{array}\right.$

		$\left\{\begin{array}{l c r}\varepsilon|a\\\varepsilon|b\\\varepsilon|c\end{array}\right. \Longrightarrow \left\{\begin{array}{l c r}\varepsilon|a\\\\\varepsilon|b \wedge c\end{array}\right. \Longrightarrow \varepsilon|a \wedge (b \wedge c) \Longrightarrow \varepsilon \leq d$

		De même, on $\varepsilon\leq \varsigma$
		Donc $d = \varepsilon = \varsigma$

#### Proposition : Théorème de Bézout

		Soient $(a,b) \in \Z \cross \Z^*, d = a \wedge b$
		$\exists(u,v) \in \Z^2, d = au+bv$

#### Preuve

		On pose $A = \{au+bv|(u,v) \in \Z^2\}$
		On veut montrer que $d \in A$
				$a = a*1+b*0$ donc $a \in A$
				$b = a*0+b*1$ donc $b \in A$
				$0 = a*0+b*0$ donc $0 \in A$

		Soit $(x,y) \in A^2$
				$x = au_1+bv_1, (u_1,v_1) \in \Z^2$
				$y = au_2 + bv_2, (u_2,v_2) \in \Z^2$
				$x+y = a(u_1+u_2) + b(v_1+v_2) \in A$

		Soit $x \in A, k \in \Z$
				$x = au+bv, (u,v) \in \Z^2$
				$kx = aku+bkv \in A$

		Soit $n = \text{min}(A \cap \N^*)$		$(|b| \in A \cap \N^*)$
		Soit $x \in A$

		Par division euclidienne de $x$ par $n$ :
				$\left\{\begin{array}{l c r}x = nq+r \\ q \in A, 0 \leq r<n \end{array}\right.$

		$\left\{\begin{array}{l c r}x \in A\\n \in A\end{array}\right. \Longrightarrow \left\{\begin{array}{l c r}x \in A\\-qn \in A\end{array}\right. \Longrightarrow x-qn \in A \Longrightarrow r \in A$

		$\left\{\begin{array}{l c r}r < n \\r \in A\end{array}\right. \Longrightarrow r \leq 0$

		Donc $r = 0$
		Donc $n|x$

		D’où $A = n \Z$
		Or, $\left\{\begin{array}{l c r}a \in A\\b \in A\end{array}\right. \Longrightarrow \left\{\begin{array}{l c r}n|a\\n|b\end{array}\right.$

		Cas particulier : $a \wedge b = d = 1$, alors $1$ est le seul diviseur positif de $a$ et $b$
		Donc $n=1$ donc $A = \Z$ donc $1 \in \Z$

		Cas général : On pose $a' = \frac{a}{d} \in \Z,\ b' = \frac{b}{d} \in \Z,\ a' \wedge b' = 1$
		D’après le cas particulier, $\exist (u,v) \in \Z^2, a'u+b'v = 1$

		D’où $au+bv=d$

#### Proposition : Réciproque du Théorème de Bézout

		Soient $(a,b) \in \Z\cross \Z^*$
		On suppose qu’il existe $(u,v) \in \Z^2$ tel que $au+bv=1$
		Alors $a \wedge b = 1$

#### Preuve

		On pose $d = a \wedge b$
		$\left\{\begin{array}{l c r}d|a\\d|b\end{array}\right. \Longrightarrow d|au+bv \Longrightarrow d|1 \Longrightarrow d=1$

#### Proposition : Théorème de Gauss

		Soient $(a,b,c) \in \Z^3$ tels que $\left\{\begin{array}{l c r}a \wedge b = 1\\a|bc\end{array}\right.$
		Alors $a|c$

#### Preuve

		D’après le théorème de Bézout,
		$au+bv = 1$ avec $(u,v) \in \Z^2$
		D’où $acu+bcv = c$

		$\left\{\begin{array}{l c r}a|acu\\a|bcv\end{array}\right. $ 
		Donc $a|acu+bcv $
		Donc $a|c$

#### Remarque : Inversion Modulo $n$

		Soit $x \in \Z$
		$\exist?y \in \Z, xy \equiv 1 [n]$
		$(\iff$dans $\Z/n \Z, \overline{x} + \overline{y} = \overline{1} ?)$

		Avec $n=4 :$
				$\begin{matrix}x\ 0123\\0\ 0000\\1\ 0123 \\2 \ 0202 \\3\ 0321\end{matrix}$		$\left\{\begin{array}{l c r}1 \text{ et }3 \text{ sont inversibles modulo } 4 \\ 2 \text{ n'est pas inversible modulo } 4\end{array}\right.$ 

		$3x \equiv 2[4]$
		$\iff 3 * 3x \equiv 3*2[4]$
		$\iff x \equiv 2[4]$

		$2x \equiv 1[4]$
		$\Longrightarrow 2*2x \equiv 2[4]$
		$\Longrightarrow 0 \equiv 2 [4]$

#### Proposition : Congruences et Nombres Premiers

		Soit $p$ un nombre premier
		Alors $\forall x \in \Z, x \not \equiv 0[p] \Longrightarrow \exists y \in \Z, xy \equiv 1 [p]$

#### Preuve

		Soit $x \in \Z$ tel que $x \not \equiv 0[p]$
		Soit $y \in \Z$
		$xy \equiv 1[p] \iff \exists u \in \Z, xy = 1+pu$
				$\iff \exists u \in \Z, xy -pu = 1$

		$y$ existe $\iff x \wedge p = 1$
				$\iff p \nmid x$

#### Proposition : Inversibilité Modulo $n$

		Soit $n \in \N^*, x \in \Z$
		$x$ inversible modulo $n$ $\iff x \wedge n = 1$

#### Preuve

		Voir précédent

#### Proposition : Petit Théorème de Fermat

		Soit $p$ premier, $a \in \Z$
		$a^p \equiv a[p]$

#### Preuve

		Cas 1 : $a \equiv 0[p]$
				$a^p \equiv 0^p[p]$
				$a^p \equiv 0[p] \equiv a [p]$

		Cas 2 : $a \not \equiv 0 [p]$
				Alors $a \wedge p = 1$

				On pose $\forall i \in \N^*, r_i$ le reste de la division de $ia$ par $p$
				Soit $i \in [\![1,p-1]\!]$
						$r_i = 0 \Longrightarrow p|ia \Longrightarrow p|i$		Contradiction
						$\forall i \in \N^*, r_i \neq 0$

				Soit $(i,j) \in [\![1,p-1]\!]^2, i \neq j$
						On suppose $r_i = r_j$, alors $ia \equiv ja [p]$
						Or, $a \wedge p = 1$ donc $a$ est inversible modulo $p$
						Donc $a \equiv j[p]$ donc $i = j$		Contradiction

				Ainsi, $r_1...r_{p-1} \in [\![1,p-1]\!]$ distincts donc ils prennent toutes les valeurs de $[\![1,p-1]\!]$
				$i \longmapsto r_i$ est injective
				$\{r_1...r_{p-1}\} = [\![1,p-1]\!]$

				Donc $\overset{p-1}{\underset{k=1}{\prod}} r_i = (p-1)!$
				Donc $\overset{p-1}{\underset{k=1}{\prod}} ia \equiv (p-1)![p]$
				Donc $(p-1)! a^{p-1} \equiv (p-1)![p]$

				D’où $(p-1)! \equiv 0[p] \iff p |1*2*3\dots*(p-1)$
						$\iff\exists i \in [\![1,p-1]\!], p|i$
				Donc $(p-1)! \not \equiv 0[p]$
				Donc $(p-1)!$ est inversible modulo $p$
				Donc $a^p \equiv 1[p]$
				Donc $a^p \equiv a[p]$



## 7 - Décomposition en Facteurs Premiers

#### Définition : Nombre Premier

		Soit $n \in \N$
		On dit que $n$ est premier si
				$n \ge 2$
				les seuls diviseurs entiers de $n$ sont $1$ et $n$

#### Proposition : Infinité de Nombres Premiers

		Il y a une infinité de nombres premiers

#### Preuve

		On suppose qu’il n’y a qu’un nombre fini de nombres premiers
				$p_1<...<p_n$

		On pose $N = p_n*...*p_1+1$
		$N>p_n$ donc $N$ n’est pas premier
		$N$ a d’autres diviseurs positifs que $1$ et $N$
		$N$ est divisible par un nombre entre $2$ et $N-1$

		Soit $p = \text{min}(\{k \in [\![2,N-1]\!] | k |N\})$
		$p$ est premier		(Tout diviseur de $p$ divise aussi $N$)
		$\exists i \in [\![1,n]\!], p_i=p$
		$p_i|N$
		$p_i|N-p_1...p_n$
		$p_i|1$		Contradiction

		Donc il y a une infinité de nombres premiers

#### Proposition : Théorème Fondamental de l’Arithmétique

		“Tout entier se décompose en un unique produit de nombres premiers”

		Soient $n \in \N$ tel que $n \ge 2$ et $\mathcal{P}$ l’ensemble des nombres premiers
		$\exist! \nu : \mathcal{P} \longrightarrow \N$ telle que $\left\{\begin{array}{l c r}\{p \in \mathcal{P}|\nu(p) \neq 0\} \text{ est fini} \\ n = {\underset{p \in \mathcal{P}}{\prod}}p^{\nu(p)} \end{array}\right.$

#### Preuve

		Existence : Déjà vue : Récurrence Forte (Chapitre 9)

		Unicité : Soit $n \ge 2$ et $\nu : \mathcal{P} \longrightarrow \N$ telle que
		${(*)\underset{p \in \mathcal{ P}}{\prod}}p^{\mu(p)} = {\underset{p \in \mathcal{ P}}{\prod}}p^{\nu(p)}$	avec $\left\{\begin{array}{l c r}\mu\neq \nu \\ M = \{p \in \mathcal{P}|\mu(p)\neq 0\} \text{ fini} \\ M = \{p \in \mathcal{P}|\nu(p)\neq 0\} \text{ fini} \\ n \text{ minimale pour cette propriété} \end{array}\right.$

		Soit $p \in M, \mu(p) \neq 0$ donc $p|n$
		Si $\nu(p) = 0, \forall q \in \N, p \wedge q = 1$ donc $p|1$		Contradiction avec le théorème de Gauss

		Donc on peut simplifier $(*)$ par $p$
		On a alors $2$ décompositions de $\frac{n}{p}<n$		Contradiction
		Donc $n$ n’existe pas

#### Proposition : Divisibilité et Nombres Premiers

		Soient $(,b,c) \in \N^3$ supérieurs à $2$
		On pose $a = {\underset{p \in \mathcal{ P}}{\prod}} p^{\alpha(p)}$ et $b = {\underset{p \in \mathcal{ P}}{\prod}}p^{\beta(p)}$
		$a|b \iff \forall p \in \mathcal{P}, \alpha(p) \leq \beta(p)$

#### Preuve

		“$\Longrightarrow$” : On suppose $a|b, \exist k, b = ak$
				On pose $k = {\underset{p \in \mathcal{ P}}{\prod}}p^{\kappa(p)}$
				et donc $b = {\underset{p \in \mathcal{ P}}{\prod}}p^{\alpha(p)}{\underset{p \in \mathcal{ P}}{\prod}}p^{\kappa(p)} = {\underset{p \in \mathcal{ P}}{\prod}}p^{\alpha(p) + \kappa(p)}$

				Par unicité de la décomposition en facteurs premiers,
				$\forall p \in \mathcal{P}, \beta(p) = \alpha(p) + \kappa(p) \ge \alpha(p)$

		“$\Longleftarrow$” : On suppose $\forall p \in \mathcal{P}, \beta(p) \ge \alpha(p)$
				On pose $\forall p \in \mathcal{P}, \kappa(p) = \beta(p) - \alpha(p) \in \N$

				Tous les $\alpha(p)$ et $\beta(p)$ sont nuls à partir d’un certain rang
				C'est donc le cas aussi pour les $\kappa(p)$
				Donc on a le droit de former le produit
				${\underset{p \in \mathcal{ P}}{\prod}}p^{\kappa(p)} \in \N$

				On pose $k = {\underset{p \in \mathcal{ P}}{\prod}}p^{\kappa(p)}$ et $ak = {\underset{p \in \mathcal{ P}}{\prod}}p^{\alpha(p)}{\underset{p \in \mathcal{ P}}{\prod}}p^{\kappa(p)} = {\underset{p \in \mathcal{ P}}{\prod}}p^{\alpha(p) + \kappa(p)} = {\underset{p \in \mathcal{ P}}{\prod}}p^{\beta(p)}=b$

#### Proposition : Produit de Facteurs Premiers, PGCD et PPCM

		Avec les notations précédentes,

		$a \wedge b = {\underset{p \in \mathcal{ P}}{\prod}}p^{\text{min}(\alpha(p), \beta(p))}$	et	$a \vee b = {\underset{p \in \mathcal{ P}}{\prod}}p^{\text{max}(\alpha(p), \beta(p))}$
		

#### Corollaire :

$(a \wedge b)(a \vee b) = ab$

#### Preuve

		$(a \wedge b)(a \vee b) = {\underset{p \in \mathcal{ P}}{\prod}}p^{\text{min}(\alpha(p), \beta(p))}{\underset{p \in \mathcal{ P}}{\prod}}p^{\text{max}(\alpha(p), \beta(p))}$
				$= {\underset{p \in \mathcal{ P}}{\prod}}p^{\text{min}(\alpha(p),\beta(p)) + \text{max}(\alpha(p), \beta(p))}$
				$={\underset{p \in \mathcal{ P}}{\prod}}p^{\alpha(p) + \beta(p)} = ab$


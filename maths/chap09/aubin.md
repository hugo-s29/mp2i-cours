## 1 - Propriétés de $(\R, \leq)$

#### Axiome : Propriétés de $(\R, \leq)$

		$\R$ est muni d’une addition notée $+$ associative, commutative, d’élément neutre 0 et tout réel $x$ a un symétrique pour $+$ noté $-x$
		$\R$ est muni d’une multiplication notée $\cross$, associative, commutative, d’élément neutre 1 et tout réel $x$ a un symétrique pour $\cross$ noté $x^{-1}$ ou $\frac{1}{x}$					(on la notera * dans ce document) 
		La multiplication est distributive sur l’addition
				$\forall (a, b ,c) \in \R^3, a(b+c) = ab + ac$

		$\leq$ est un ordre total sur $\R$
				$\forall (x, y ,a) \in \R^3, (x \leq y \Longrightarrow a+x \leq a+y)$
		$\forall a \in \R^*_+, \forall (x,y) \in \R^2, x\leq y \Longrightarrow ax \leq ay$

		$\Q \subset \R$
		Propriété de la borne supérieure : Tout partie non vide majorée de $\R$ admet une borne supérieure

#### Lemme : Opposé d’un réel

		$\forall a \in \R, -a = -1* a$

#### Proposition : Inverse de $\leq$

		Soient $(x,y) \in \R^2$
		$x \leq y \Longrightarrow -y \leq -x$

#### Preuve

		$x \leq y \Longrightarrow -x + x \leq -x + y$
				$\Longrightarrow 0 \leq -x + y$
				$\Longrightarrow - y \leq -x$		

#### Corollaire : $\cross$ et $\leq$

		$\forall a \in \R^*_-, \forall (x, y) \in \R^2, x \leq y \Longrightarrow ay \leq ax $

#### Preuve

		Soient $a < 0, (x,y) \in \R^2$

		On pose $b = -a$
		$a < 0 \Longrightarrow -0 \leq -a \Longrightarrow 0 \leq b$

		Si $b = 0, a = 0$
		$x \leq y \Longrightarrow bx \leq by$
				$\Longrightarrow -by \leq -bx$
				$\Longrightarrow -1(by) \leq -1(bx)$
				$\Longrightarrow (-1*b)*y \leq (-1*b)*x$
				$\Longrightarrow -by \leq -bx$
				$\Longrightarrow ay \leq ax$

#### Proposition : Elément Symétrique pour la Multiplication

		Soit $a \in \R, -a$ est le seul réel qui vérifie $a + (-a) =0$

#### Preuve

		$a + (-a) = a + (-1) * a$
				$= a * (1 + -1)$
				$=a * 0 = 0$

		On a bien $a * 0 = 0$ car :
				$a * 0 = a * (0+0)$
				$ 0 + 0 = (a*0) + (a*0) = 0$

#### Proposition : $+$ et $\leq$

		Soient $(a,b,x,y) \in \R^4$ tels que $\left\{\begin{array}{l c r}x \leq y \\ a \leq b\end{array}\right.$
		Alors $a + x \leq b + y$

#### Preuve

		$a \leq b \Longrightarrow a + x \leq b + x$
		$x\leq y \Longrightarrow b + x \leq b + y$
		$\leq$ est transitive donc $a+x \leq b+y$

#### Remarque : Soustraire des Inégalités

		On ne peut pas soustraire directement des inégalités

		Si $\left\{\begin{array}{l c r}x \leq y \\ a \leq b\end{array}\right.$,	alors $\left\{\begin{array}{l c r} x \leq y \\ -b \leq -a\end{array}\right.$

		et alors, $x-b \leq y-a$

#### Proposition : $\cross$ et $\leq$ dans $\R^4$

		Soient $(x,y,a,b) \in (\R^+)^4$

		$\left\{\begin{array}{l c r}0 \leq x \leq y \\ 0 \leq a \leq b\end{array}\right. \Longrightarrow xa \leq yb$

#### Preuve

		$\left\{\begin{array}{l c r}x \leq y \\ 0 \leq a\end{array}\right. \Longrightarrow ax \leq ay$	et	$\left\{\begin{array}{l c r}a\leq b \\ 0 \leq y\end{array}\right. \Longrightarrow ay\leq bx$

#### Proposition : Inégalité des Inverses

		$\forall (x,y) \in (\R^+_*)^2, x \leq y \Longrightarrow \frac{1}{x} \leq \frac{1}{y}$

#### Preuve

	Soient $(x,y) \in (R^+_*)^2$
	On suppose $x \leq y$

	Si $\frac{1}{x} \leq 0$, alors $x \frac{1}{x} \leq 0 * x$, alors $1 \leq 0$

	Donc $\frac{1}{x} \gt 0$ donc $\frac{1}{x}x \leq \frac{1}{x}y$

	Donc $\frac{1}{x} \leq \frac{1}{y}$

#### Remarque : Diviser des Inégalités

		On ne peut pas diviser des inégalités



## 2 - Inégalités Classiques

#### Proposition : Inégalité Triangulaire dans $\R$

		$\forall (x,y) \in \R^2, \left\{\begin{array}{l c r}| x+y | \leq |x| + |y|\\|x|-|y| \leq |x-y| \end{array}\right.$

		En changeant $y$ en $-y$, on a aussi

		$\left\{\begin{array}{l c r}| x-y | \leq |x| + |y|\\|x|-|y| \leq |x+y| \end{array}\right.$

#### Preuve

		1 - Soient $(x,y) \in \R^2$
				$|x| = \text{max}(-x,x) \geq x$
				$|y| \geq y$

				Donc $x+y \leq |x+y|$

				Si $x+y\leq 0$, alors $|x+y| \leq |x| + |y|$

				On a aussi $|x| \geq -x$ et $|y| \geq -y$
				Donc $-(x+y) \leq |x| + |y| $

				Si $x+y \lt 0$, alors $|x| + |y| \geq |x+y| $

		2 - Soient $(x,y) \in \R^2$

				$|x| = |x - y + y| \leq |x-y| + |y|  $
				Donc $|x| - |y| \leq |x+y|$

				Si $|x| - |y| \geq 0, |x| - |y| \leq |x-y| $

				On a aussi $|y| = |y-x+x| \leq |y-x| + |x| $
				Donc $|y| - |x| \leq |y-x| $

				Si $|x| - |y| \lt 0, |x| - |y| \leq |x-y| $

#### Proposition : Inégalité Triangulaire dans $\C$

		$\forall (x,y) \in \C, \left\{\begin{array}{l c r}|x+y| \leq |x| + |y| \\ |x| - |y| \leq |x-y|    \end{array}\right.$

#### Preuve

		$|x+y| \leq |x| + |y| \iff |x+y|^2 \leq (|x| + |y| )^2$
				$\iff (x+y)(\overline{x} + \overline{y}) \leq |x|^2  + |y|^2 +2 |xy| $
				$\iff |x|^2 + |y|^2 + (x \overline{y} + \overline{x}y) \leq |x|^2 + |y|^2 +2 |xy| $
				$\iff 2 \Re(xy) \leq 2 |xy| $

		Or, pour tout $z \in \C, \Re(e) \leq |z| $
		En effet :
				$|z| = \sqrt{\Re(z)^2 + \Im(z)^2} \ge \sqrt{\Re(z)^2} = |\Re(z)| \ge \Re(z) $

#### Proposition : Inégalité Triangulaire à $n$ Coefficients

		Soient $(z_1...z_n) \in \C^n$
		Alors, $|\overset{n}{\underset{k=1}{\sum}}|z_k \leq \overset{n}{\underset{k=1}{\sum}}|z_k| $

#### Preuve

		Pour $n \in \N^*, P(n): $“$\forall (z_1...z_n) \in \C^n, |\overset{n}{\underset{k=1}{\sum}}|z_k \leq \overset{n}{\underset{k=1}{\sum}}|z_k|$”

		$P(1)$ et $P(2)$ sont vraies

		Soit $n \in \N^*$, on suppose $P(n)$ vraie
		Soient $(z_1...z_n+1) \in \C^n+1$
		$|\overset{n+1}{\underset{k=1}{\sum}}|z_k = |\overset{n}{\underset{k=1}{\sum}}z_k + z_{n+1} |  \leq \overset{n}{\underset{k=1}{\sum}}|z_k| + |z_{n+1}| = \overset{n+1}{\underset{k=1}{\sum}} |z_k|  $ 

		Donc $P(n+1)$ vraie
		Par récurrence, $\forall n \in N^*, P(n)$ vraie

#### Proposition : Inégalité Triangulaire des Intégrales

		Soit $f : [a,b] \longrightarrow \R$ continue
		Alors $|\int_a^bf(x)dx|  \leq \int_a^b |f(x)|dx \\$

#### Preuve

		$\forall x \in [a,b], -|f(x)| \leq f(x)\leq |f(x)| $

#### Proposition  : Inégalité Triangulaire des Intégrales sur $\C$

		Soit $f : [a,b] \longrightarrow \C$ continue
		Alors $|\int_a^bf(x)dx| \leq \int_a^b |f(x)|dx\\$

#### Preuve

		Cas 1 : $|\int_a^bf(x)dx| = 0 \\$

				On a $\forall x \in [a,b], |f(x)| \ge 0 $
				donc $\int_a^b|f(x)|dx \ge 0 = |\int_a^bf(x)dx| \\$

		Cas 2 : $|\int_a^bf(x)dx| \neq 0 \\$

				On pose $r = |\int_a^bf(x)dx| \in \R^*_+ \\$
				Soit $\theta$ un argument de $\int_a^bf(x)dx\\$
				D’où $\int_a^bf(x)dx = re^{i \theta}\\$

			$r = e^{-i \theta} \int_a^bf(x)dx = \int_a^bf(x)e^{-i \theta}dx\\$
					$= \Re(\int_a^bf(x)e^{-i \theta}dx)\\$
					$=\int_a^b\Re(f(x)e^{-i \theta})dx \leq \int_a^b|f(x)e^{-i \theta}|dx\\$		car $\forall x, \Re(f(x)e^{-i \theta}) \leq |f(x)e^{-i \theta}| $
					$\leq$ $\int_a^b|f(x)||e^{-i \theta}|dx = \int_a^b|f(x)|dx\\$

#### Proposition : Inégalité de Cauchy-Schwartz

		Soient $f, g : [a,b] \longrightarrow \R$ continues

		$(\int_a^bf(t)g(t)dt)^2 \leq \int_a^bf^2(t)dt \int_a^bg^2(x)dt\\$

#### Proposition : Inégalité des Accroissements Finis sur $\R$

		Soit $f : I \longrightarrow \R$ dérivable sur $I$ telle qu’il existe $M \in \R$ vérifiant
				$\forall t \in I, |f'(t)| \leq M$

		Alors $\forall (a,b) \in I^2, |f(a) -f(b)| \leq M |a-b|  $

#### Proposition : Inégalité des Accroissements Finis sur $\C$

		Soit $f : I\longrightarrow \C$ de classe $C^1$ et $M$ tel que
				$\forall t \in I, |f'(t)| \leq M$

		Alors $\forall (a,b) \in I^2, |f(a) -f(b)| \leq M |a-b|  $

#### Preuve

		On suppose $a \leq b$

		$|f(a) - f(b)| = |f(b)-f(a)| = |\int_a^bf'(t)dt| \\ $
				$\leq$$\int_a^b |f'(t)|dt \\$
				$\leq$$\int_a^bMdt = M(b-a) = M |b-a| $ 



## 3 - Valeur Absolue

#### Proposition : Inégalités avec la Valeur Absolue

		Soient $(a,b) \in \R^2$
		$|a| \leq b \iff -b \leq a \leq b$
		$|a| \ge b \iff a \ge b $ ou $a \leq -b$

#### Proposition : Partie Bornée et Valeur Absolue

		Soit $A \in \mathcal{P}(\R)$
		$A$ est bornée $\iff \exist M \in \R, \forall a \in A, |a| \leq M $

#### Preuve

		“$\Longleftarrow$” :
				On suppose qu’il existe $M \in \R$ tel que $\forall a \in A, |a| \leq M $

				Donc $\forall a \in A, -M \leq a \leq M$
				Donc $A$ est majorée par $M$ et minorée par $-M$
				Donc $A$ est bornée

		“$\Longrightarrow$” : 
				On suppose $A$ bornée

				Soit $M$ un majorant de $A$ et $m$ un minorant de $A$
				On pose $\alpha = \text{max}(M,-m)$
				$\alpha \ge M$ et $\forall a \in A, a \leq \alpha$

				On a aussi $\alpha \ge m$ donc $-a \leq -m$
				donc $-m$ est un majorant

				$\forall a \in A, -\alpha \leq a \leq \alpha$
				donc $\forall a \in A, |a| \leq \alpha $ 



## 4 - Bornes Inférieure / Supérieure

#### Proposition : Existence de la Borne Inférieure

		Toute partie minorée, non vide de $\R$ admet une borne inférieure

#### Preuve

		Soit $A \in \mathcal{P}(\R)$ non vide et minorée
		Soit $B = {-a|a \in A} \neq \varnothing$
		Soit $m$ un minorant de $A$

		$\forall a \in A, m \leq a$
		donc $\forall a \in A, -a \ge -m$
		donc $B$ est majoré par $m$

		D’après la propriété de la borne supérieure, $B$ admet une borne supérieure
		On suppose $\beta = \text{sup}(B)$

		$\beta$ majore $B$ donc $\forall a \in A, -a \leq \beta$
		donc $\forall a \in A, -\beta \leq a$
		donc $-\beta$ est un majorant de $A$

		Soit $x$ un minorant de $A$
		Montrons que $x \leq -\beta$
		$-x$ majore $B$ donc $-x \ge \beta$ donc $x \leq -\beta$

		Donc $-\beta = \text{inf}(A)$

#### Proposition : Caractérisation de la Borne Supérieure

		Soient $A \in \mathcal{P}(\R)$ non vide majorée et $M \in \R$
		$M = \text{sup}(A) \iff \left\{\begin{array}{l c r}\forall a \in A, a \leq M \\ \forall \varepsilon > 0, \exist a_0 \in A, a_0> M-\varepsilon\end{array}\right.$

#### Preuve

		“$\Longrightarrow$” : On suppose $M = \text{sup}(A)$

			$M$ est un majorant de $A$ donc $\forall a \in A, a \leq M$
			et c’est le plus petit majorant

			Soit $\varepsilon >0$
			$M - \varepsilon > M$ donc $M - \varepsilon$ ne majore pas $A$
			$\exist a_0 \in A, a_0 > M-\varepsilon$

		“$\Longleftarrow$” : On suppose $\left\{\begin{array}{l c r}\forall a \in A, a \leq M \quad\quad\quad \quad\quad\quad\quad\quad\quad1 \\ \forall \varepsilon > 0, \exist a_0 \in A, a_0> M-\varepsilon\quad\quad\quad\ 2\end{array}\right.$

				D’après $1$, $M$ est un majorant de $A$
				Soit $M'$ un majorant de $A$, montrons $M' \ge M$
				On suppose $M' \leq M$, on pose $\varepsilon = M - M'\ge 0$

				D’après 2, il existe $a_0 \in A$ tel que
						$a_0 > M-\varepsilon = M' \ge a_0$		contradiction

				Donc $M' \ge M$
				Donc $M$ est le plus petit majorant de $A$
				Donc $M = \text{sup}(A)$

#### Proposition : Caractérisation de la Borne Inférieure

		Soient $A \in \mathcal{P}(\R)$ non vide minorée et $M \in \R$
		$M = \text{inf}(A) \iff \left\{\begin{array}{l c r}\forall a \in A, a > M \\ \forall \varepsilon > 0, \exist a_0 \in A, a_0< M+\varepsilon\end{array}\right.$

#### Proposition : Inégalité et Borne Supérieure

		Soit $A \in \mathcal{P}(\R)$ non vide majorée et $M \in \R$
		$M \ge \text{sup}(A) \iff \forall a \in A, M \ge a$

#### Preuve

		“$\Longrightarrow$” : On suppose $M \ge \text{sup}(A)$
				Soit $a \in A$, on sait que $a \leq \text{sup}(A)$ car $\text{sup}(A)$ majore $A$
				Donc $a \leq M$

		“$\Longleftarrow$” : On suppose $\forall a \in A, a \leq M$
				Donc $M$ majore $A$
				Or, $\text{sup}(A)$ est le plus petit majorant de $A$ donc $M \ge \text{sup}(A)$

#### Proposition : Inégalité et Borne Inférieure

		Soit $A \in \mathcal{P}(\R)$ non vide minorée et $m \in \R$
		$m \leq \text{inf}(A) \iff \forall a \in A, a > m$

#### Proposition : $\R$ est archimédien

		$\R$ est archimédien :
		$\forall x \in \R^+_*, \forall y \in \R, \exist n \in \N, nx \ge y$

#### Preuve

		Soient $(x,y) \in \R^+_* \cross \R$
		Supposons $(H) : \forall n \in \N, nx \leq y$

		On pose $A = \{nx|n \in \N\} \subset \R$
		$A \neq \varnothing$ car $0 \in A$
		D’après $(H), A$ est majoré par $y$
		Soit $\alpha = \text{sup}(A)$

		Soit $n \in \N$
		$(n+1)x \in A$ donc $(n+1)x \leq \alpha$
		donc $nx \leq \alpha$

		Donc $\left\{\begin{array}{l c r}\alpha - x \ge nx \\\alpha-x< \alpha\end{array}\right.$		Contradiction avec le fait que $\alpha$ soit le plus petit majorant de $A$

		Donc $\exist n \in \N, nx \ge y$

#### Proposition : Théorème des Valeurs Extrêmes

		Toute fonction continue sur un segment est bornée et atteint ses bornes

		Si $f : [a,b] \longrightarrow \R$ est continue, alors
		$\exist (\alpha,\beta) \in [a,b]^2, \forall x \in [a,b],\ \ f(\alpha) \leq f(x) \leq f(\beta)$

#### Preuve

		Voir Chapitre 12 : Suites

#### Proposition : Limite de Suite et Borne Supérieure

		Soit $A \in \mathcal{P}(\R)$ non vide majorée
		Il existe une suite $(a_n) \subset A$ telle que
		$\lim a_n = \text{sup}(A)$

#### Preuve

		On sait que $\forall \varepsilon > 0, \exist a \in A, a > \text{sup}(A) - \varepsilon$

		Donc $\forall n \in \N^*, \exist a_n > sup(A) - \frac{1}{n}$
		$\forall n \in \N, a_n \in A$ donc $a_n < \text{sup}(A)$
		$\forall a \in \N^*, \text{sup}(A) - \frac{1}{n} < a_n < \text{sup}(A)$

		Par encadrement, $a_n \underset{n \longrightarrow +\infty}{\longrightarrow}  \text{sup}(A)$

#### Proposition : Limite de Suite et Borne Inférieure

		Soit $A \in \mathcal{P}(\R)$ non vide minorée
		Il existe une suite $(a_n) \subset A$ telle que
		$\lim a_n = \text{inf}(A)$



## 5 - Partie Entière

#### Proposition - Définition

		Soit $x \in \R$
		$\exist!n \in \Z, n \leq x < n+1$
		Cet entier est appelé partie entière de $x$ et noté $\lfloor x \rfloor $

#### Preuve

		Soit $A = \{p \in \Z|p > x\}$
		$A \neq \varnothing$ car $\R$ est archimédien
		$A$ est minoré par $x$

		Soit $\alpha$ la borne inférieure de $A$, alors $\alpha \ge x$
		Montrons que $\alpha \in \Z$

		Soit $n \ge 2, \alpha+\frac{1}{n} \ge \alpha$
		donc $\exist a_n \in A, \alpha \leq a_n \leq \alpha+\frac{1}{n}$

		$\frac{1}{n} < 1$ car la distance entre deux entiers est $\ge 1$
		Il y a au plus $1$ entier dans $[\alpha, \alpha+\frac{1}{n}]$

		Donc tous les $a_n$ sont égaux et $a_n \longrightarrow \alpha$ donc $\forall n \ge 2, a_n = \alpha$
		donc $\alpha \in A$, donc $\alpha = \text{min}(A)$, alors $\alpha-1 \notin A$
		donc $\alpha-1 \leq x \leq a$
		On pose $n = \alpha-1$



## 6 - Densité

#### Définition : Densité

		Soit $A \in \mathcal{P}(\R)$
		On dit que $A$ est dense dans $\R$ si :
		Pour tout intervalle $I$ ouvert non vide de $\R$, $A \cap I \neq \varnothing$

#### Théorème : Densité de $\Q$

		$\Q$ est dense dans $\R$

#### Preuve

		Soit $I$ un intervalle ouvert non vide de $\R$
		Soient $a < b $ deux éléments de $I$

		On cherche $(p,q) \in \Z \cross \N^*$ tels que $a < \frac{p}{q} <  b$

		Comme $\R$ est archimédien, $\exist q \in \N^*, q(b-a) \ge 2 > 1$
		Donc l’intervalle $[qa, qb]$ a une longueur supérieure à $1$
		Il contient donc au moins $1$ entier $p$

		En effet, sinon on a $\lfloor qa \rfloor  = \lfloor qb \rfloor $ et alors
		$\left\{\begin{array}{l c r} \lfloor qa \rfloor \leq qb \leq \lfloor qa \rfloor +1 \\ \lfloor qa \rfloor \leq qa \leq \lfloor qa \rfloor +1 \\  \end{array}\right.$
		et alors $-1 <qb-qa<1$		contradiction

		On a donc $qa \leq p \leq qb$
		et finalement $a \leq \frac{p}{q} \leq b$

#### Théorème : Densité de $\R \text{\\}\Q$

		$\R \text{\\} \Q$ est dense dans $\R$

#### Preuve

		Soit $I$ un intervalle ouvert non vide de $R$

		On pose $J = \{x - \sqrt{2}|x \in I\}$, $J$ est ouvert et non vide
		$\Q$ est dense dans $\R$ donc $J \cap \Q \neq \varnothing$

		Soit $r \in J \cap \Q$, alors $r + \sqrt{2} \in I$
		Soit $s \in Q = r + \sqrt{2}$, alors $\sqrt{2} = s-r \in \Q$
		ce qui n’est pas le cas
		Ainsi, $r + \sqrt{2} \in I \cap (\R\text{\\}\Q)$

#### Remarque : Suite de Rationnels

		Soit $x \in \R, \forall n \in \N^*, I_n = ]x-\frac{1}{n}, x + \frac{1}{n}[$
		Pour tout $n \in \N^*$, on choisit $r_n \in Q \cap I$
		On a défini une suite de rationnels $(r_n)$
		$\forall n \in \N^*, x-\frac{1}{n} \leq r_n \leq x + \frac{1}{n}$
		Par encadrement, $r_n \longrightarrow x$

#### Proposition : Approximation par Défaut et par Excès

		Soit $x \in \R$
		Alors, $\forall n \in \N$, $\frac{\lfloor 10^nx \rfloor }{10^n} \leq x < \frac{\lfloor 10^nx \rfloor }{10^n} + \frac{1}{10^n}$

		On démontrera que $\frac{\lfloor 10^nx \rfloor }{10^n} \underset{n \longrightarrow +\infty}{\longrightarrow} x$

#### Preuve

		$\forall n \in \N, \lfloor 10^nx \rfloor \leq 10^nx < \lfloor 10^nx \rfloor   + 1$

#### Corollaire : Densité de $D$

		Soit $D$ l’ensemble des nombres décimaux
		$D = \{\frac{p}{10^n}|p \in \Z, n \in \N\}$
		$D$ est dense dans $\R$



## 7 - Intervalles

#### Définition : Intervalle de $\R$

		Un intervalle de $\R$ est une partie de $\R$ d‘une de ces formes :
				$\{x \in \R|a \leq x \leq b\}, (a,b) \in \R^2$
				$\{x \in \R|a \leq x < b\}, a \in \R, b \in \R \cup \{+\infty\}$
				$\{x \in \R|a < x \leq b\}, a \in \R \cup \{-\infty\},b \in \R$
				$\{x \in \R|a < x < b\}, a \in \R \cup \{-\infty\}, b \in \R \cup \{+ \infty\}$

#### Définition : Partie Convexe

		Soit $D$ une partie de $\R$
		On dit que $D$ est convexe si $\forall (x,y) \in D^2,x \leq y \Longrightarrow [x,y] \in D$

#### Théorème : Intervalle et Convexité

		Soit $D \in \mathcal{P}(\R)$
		$D$ est un intervalle $\iff D$ est convexe

#### Preuve

		“$\Longrightarrow$” : On suppose que $D$ est un intervalle

				Cas 1 : On suppose $D = [a,b]$ avec $(a,b) \in \R^2$ et $a \leq b$
						Soient $(x,y) \in D^2$ avec $x \leq y$
						Soit $z \in [x,y]$
						On a donc $a \leq x \leq z \leq y \leq b$ donc $z \in [a,b]$
						Donc $D$ est convexe 

			Cas 2 : On suppose $D = [a,b[$ avec $a \in \R, b \in \R \cup \{+\infty\}$ et $a < b$
						Soient $(x,y) \in D^2$ avec $x \leq y$
						Soit $z \in [x,y]$
						On a donc $a \leq x \leq z \leq y < b$ donc $z \in [a,b]$
						Donc $D$ est convexe 

			Les deux autres cas se traitent de la même fa\c con

		“$\Longleftarrow$” : On suppose que $D$ est convexe et non vide

				On pose $M = \left\{\begin{array}{l c r} \text{sup}(D) \text{ si } D \text{ est majorée} \\ + \infty \text{ sinon}\end{array}\right.$	et $m = \left\{\begin{array}{l c r} \text{inf}(D) \text{ si } D \text{ est minorée} \\ - \infty \text{ sinon}\end{array}\right.$

				Montrons que
						$]m, M[ \subset D \subset [m, M]$ si $(m,M) \in \R^2$
						$]m,M[ \subset D \subset [m,M[$ si $m \in \R, M = +\infty$
						$]m,M[ \subset D \subset ]m,M]$ si $m = -\infty, M \in \R$
						$]m,M[ \subset D \subset ]m,M[$ si $m = -\infty, M = +\infty$

				Soit $z \in ]m,M[$
				Si $M \in \R$, $z$ ne majore pas $D$ car $z \leq M$
				Si $M = +\infty$, $D$ n’est pas majorée donc $z$ n’est pas un majorant
				Donc $\exist y \in D, y \ge z$

				Si $m \in \R$, $z$ ne minore pas $D$ car $m \leq z$
				Si $m = -\infty$, $D$ n’est pas minorée donc $z$ n’est pas un minorant
				Donc $\exist x \in D, x \leq z$

				Donc $z \in [x,y] \subset D$ car $\left\{\begin{array}{l c r}(x,y) \in D^2 \\ D \text{ convexe}\end{array}\right.$

				Donc $z \in D$, on a bien $]m,M[ \subset D$

				Cas 1 : On suppose $(m,M) \in \R^2$

						Soit $z \in D$, $\left\{\begin{array}{l c r}m \text { minore } D \text{ donc } m \leq z \\ M \text { majore } D \text{ donc } z \leq M\end{array}\right.$		donc $z \in [m,M]$

						Donc $D \in \{]m,M[,\ [m,M[,\ ]m,M],\ [m,M]\}$
						Donc $D$ est un intervalle

				Cas 2 : On suppose $m \in \R, M = +\infty$

						Soit $z \in D$, $\left\{\begin{array}{l c r}m \text { minore } D \text{ donc } m \leq z \\ M =+\infty\end{array}\right.$		donc $z \in [m,+\infty[$

						Donc $D \in \{]m,M[,\ [m,M[\}$
						Donc $D$ est un intervalle

				Cas 3 : On suppose $m = -\infty, M \in \R$

						Soit $z \in D, \left\{\begin{array}{l c r}m = -\infty \\ M \text { majore } D \text{ donc } z \leq M\end{array}\right.$		donc $z \in ]-\infty,M]$

						Donc $D \in \{]m,M[,\ ]m,M]\}$
						Donc $D$ est un intervalle

				Cas 4 : On suppose $m = -\infty, M = +\infty$

						Soit $z \in \R$ donc $z \in ]-\infty, +\infty[$

						$D = \R$ donc $D$ est un intervalle

#### Proposition : Bornes, Min et Max

		Soient $a,b \in \R$

		$ \text{inf}([a,b]) = \text{min}([a,b]) = a \\\text{sup}([a,b]) = \text{max}([a,b]) = b$

		$\text{inf}(]a,b[) = a \\ \text{sup}(]a,b[) = b$

		$\text{inf}([a,b[) = \text{min}([a,b[) = a \\ \text{sup}([a,b[) = b \quad \quad\quad\quad\quad\ $

		$\text{inf}(]a,b]) = a \quad\quad\quad\quad\quad\quad\ \\ \text{sup}(]a,b]) = \text{max}(]a,b]) = b$

#### Proposition : Intersection d’Intervalles

		Un intersection quelconque d’intervalles est convexe

#### Preuve

		Soit $(I_a)_{a \in A}$ une famille d’intervalles et $I = \underset{a \in A}{\bigcap}I_a$

		Montrons que $I$ est un intervalle
		Montrons que $I$ est convexe

		Soit $(x,y) \in I^2, x \leq y$, montrons $[x,y] \subset I$

		Soit $z \in [x,y]$
		Soit $a \in A$

		$x \in I$ donc $x \in I_a$
		$y \in I$ donc $y \in I_a$

		$I_a$ est convexe
		Donc $z \in I_a$

#### Remarque : Réunion d’Intervalles

		Un réunion d’intervalles n’est pas nécessairement un intervalle



## 8 - Fonction Convexes

#### Définition : Fonction Convexe

		Soit $f : I \longrightarrow \R$ avec $I$ un intervalle
		On dit que $f$ est convexe si
				$\forall (x,y) \in I^2, \forall \lambda \in [0,1], f((1-\lambda)x + \lambda y) \leq (1-\lambda) f(x) + \lambda f(y)$ 

#### Proposition : Expression d’un Elément d’un Intervalle selon les Bornes

		Soit $(a,b) \in \R^2$ avec $a \leq b$
		Soit $x \in \R$
		$x \in [a,b] \iff \exist \lambda \in [0,1], x = (1-\lambda)a + \lambda b$

#### Preuve

		$x \in [a,b] \iff a \leq x \leq b$
				$\iff 0 \leq x-a \leq b-a$
				$\iff 0 \leq \frac{x-a}{b-a} \leq 1$
				$\iff\exist \lambda \in [0,1], \lambda = \frac{x-a}{b-a}$
				$\iff\exist \lambda \in [0,1], x = \lambda(b-a)+a$
				$\iff\exist \lambda \in [0,1], x = \lambda b - \lambda a + a$
				$\iff\exist \lambda \in [0,1], x = (1-\lambda)a + \lambda b$

#### Proposition : Inégalité de Jansen

		Soit $f : I \longrightarrow \R$ convexe
		et $(x_1...x_n) \in I^n, (\lambda_1...\lambda_n) \in [0,1]^n$ tels que $\overset{n}{\underset{i=1}{\sum}} \lambda_i = 1$ 		et $n \ge 2$

		Alors $f(\overset{n}{\underset{i=1}{\sum}} \lambda_i x_i) \leq \overset{n}{\underset{i=1}{\sum}} \lambda_i f(x_i)$

#### Preuve

		Soit $n \ge 2$
		$\forall (x_1...x_n) \in I^n, (\lambda_1...\lambda_n) \in [0,1]^n$ tels que	$\overset{n}{\underset{i=1}{\sum}} \lambda_i = 1$
		On a $f(\overset{n}{\underset{i=1}{\sum}} \lambda_i x_i) \leq \overset{n}{\underset{i=1}{\sum}} \lambda_i f(x_i)$

		Soient $(x_1...x_{n+1}) \in I^{n+1}, (\lambda_1...\lambda_{n+1}) \in [0,1]^{n+1}$
		On suppose $\overset{n+1}{\underset{i=1}{\sum}} \lambda_i = 1$
		On suppose $\lambda_{n+1} \neq 1$

		On pose $\left\{\begin{array}{l c r} \lambda = \overset{n}{\underset{i=1}{\sum}} \lambda_i = 1 - \lambda_{n+1} \neq 0 \\ x = \frac{1}{\lambda}\overset{n}{\underset{i=1}{\sum}} \lambda_i x_i = \overset{n}{\underset{i=1}{\sum}} \frac{\lambda_i}{\lambda} x_i \in I \end{array}\right.$

		Ainsi, $f(\overset{n+1}{\underset{i=1}{\sum}} \lambda_i x_i) = f(\lambda_{n+1}x_{n+1} + \overset{n}{\underset{i=1}{\sum}} \lambda_i x_i)$
				$= f((1 -\lambda)x_{n+1} + \lambda x) \leq (1-\lambda)f(x_{n+1}) + \lambda f(x)$

		De plus, $f(x) = f(\overset{n}{\underset{i=1}{\sum}} \mu_i x_i)$ avec $\forall i \in [\![1,n]\!],\mu_i = \frac{\lambda_i}{\lambda}$
		$\overset{n}{\underset{i=1}{\sum}} \mu_i = \overset{n}{\underset{i=1}{\sum}} \frac{\lambda_i}{\lambda} = \frac{1}{\lambda} + \lambda = 1$

		D’après l’hypothèse de récurrence,
		$f(x \leq \overset{n}{\underset{i=1}{\sum}} \frac{\lambda_i}{\lambda} f(x_i))$
		D’où
		$f(\overset{n+1}{\underset{i=1}{\sum}} \lambda_i x_i) = \lambda_{n+1} f(x_{n+1}) + \overset{n}{\underset{i=1}{\sum}} \lambda_i f(x_i)$

		Montrons que $x \in I$
		On pose $\left\{\begin{array}{l c r}\alpha = \text{min}\{x_i|i \in [\! [1,n]\!]\} \in I \\ \beta = \text{max}\{x_i|i \in [\! [1,n]\!]\} \in I \end{array}\right.$

		$\forall i \in [\! [1,n]\!], \alpha \leq x_i \leq \beta$
		donc $\forall i \in [\! [1,n]\!], \frac{\lambda_i}{\lambda}\alpha \leq \frac{\lambda_i}{\lambda}x_i \leq \frac{\lambda_i}{\lambda}\beta$
		donc $\overset{n}{\underset{k=1}{\sum}}\frac{\lambda_i}{\lambda}\alpha \leq \overset{n}{\underset{k=1}{\sum}}\frac{\lambda_i}{\lambda}x_i \overset{n}{\underset{k=1}{\sum}}\frac{\lambda_i}{\lambda}\beta$
		donc $\alpha \leq x \leq \beta$

		Donc, par convexité de $I$,
		On suppose $\lambda_{n+1} = 1$, alors $\overset{n}{\underset{i=1}{\sum}} \lambda_i = 0$

		Or, $\forall i \in [\! [1,n]\!], \lambda_i \ge 0$
		Donc $\forall i \in [\! [1,n]\!], \lambda_i = 0$
		$f(\overset{n}{\underset{i=1}{\sum}} \lambda_i x_i) = f(x_{n+1}) \leq \overset{n+1}{\underset{i=1}{\sum}} \lambda_i f(x_i) = f(x_{n+1})$ 

#### Proposition : Lemme des Pentes

		Soit $f : I \longrightarrow \R$ convexe
		Soient $x_1<x_2<x_3 \in I^3$
		Alors $\frac{f(x_1) - f(x_2)}{x_1-x_2} \leq \frac{f(x1)-f(x_3)}{x_1-x_3} \leq \frac{f(x_2)-f(x_3)}{x_2-x_3}$

#### Preuve

		Soit $\lambda \in ]0,1[$ tel que $x_2 = (1-\lambda)x_1 + \lambda x_3$
		$f(x_2) - f(x_1) \leq (1 - \lambda)f(x_1) + \lambda f(x_3) - f(x_1)$
				$\leq \lambda(f(x_3) - f(x_1))$
		$x_2-x_1 = \lambda(x_3-x_1) > 0$

		D’où $\frac{f(x_2) - f(x_1)}{x_2-x_1} \leq \frac{\lambda(f(x_3)-f(x_1))}{\lambda(x_3-x_1)} \leq \frac{f(x_3)-f(x_1)}{x_3-x_1}$

		$f(x_2) - f(x_3) \leq (1-\lambda)f(x_1) + \lambda f(x_3) - f(x_3)$
				$\leq (1-\lambda)(f(x_1) - f(x_3))$

		$x_2 - x_3 = (1-\lambda)(x_1 - x_3) < 0$
		$\frac{f(x_2) - f(x_3)}{x_2-x_3} \geq \frac{(1-\lambda)(f(x1)-f(x_3))}{(1-\lambda)(x_1-x_3)} \geq \frac{f(x_1)-f(x_3)}{x_1-x_3}$

#### Proposition : Réciproque du Lemme des Pentes

		Soit $f : I\longrightarrow \R$

		Si, $\forall x_1<x_2<x_3 \in I^3, \frac{f(x_1) - f(x_2)}{x_1-x_2} \leq \frac{f(x_1) - f(x_3)}{x_1-x_3}$
		Alors $f$ est convexe

#### Preuve

		Soient $x \leq y \in I^2$
		Soient $\lambda \in ]0,1[$ et $z = (1-\lambda)x + \lambda y$

		Montrons que $f(z) \leq (1-\lambda)f(x) + \lambda f(y)$
		On pose $\left\{\begin{array}{l c r}x_1 = x \\x_2=z \\x_3=y\end{array}\right.$		Ainsi, $x_1<x_2<x_3$
		Donc $\frac{f(x) - f(z)}{x-z} \leq \frac{f(x) - f(y)}{x-y}\ (*)$	et $\lambda = \frac{z-x}{y-x}$ 

		$(*) \Longrightarrow \frac{f(z) - f(x)}{z-x} \leq \frac{f(y) - f(x)}{y-x}$
				$\Longrightarrow f(z) - f(x) \leq \frac{f(y) - f(x)}{y-x}(z-x)$
				$\Longrightarrow f(z) \leq \lambda(f(y) - f(x)) + f(x) = \lambda f(y) + (1-\lambda)f(x)$

#### Remarque : Autres Preuves Possible

		Si on remplace $(*)$ par $\frac{f(x_1) - f(x_3)}{x_1-x_3} \leq \frac{f(x_2) - f(x_3)}{x_2-x_3}$		ou par		$\frac{f(x_1) - f(x_2)}{x_1-x_2} \leq \frac{f(x_2) - f(x_3)}{x_2-x_3}$
		On peut aussi conclure que $f$ est convexe

#### Proposition : Théorème Convexité / Dérivabilité

		Soit $f : I \longrightarrow \R$ convexe sur $I$ ouvert
		Alors $f$ est dérivable à gauche et ) droite en tout point de $I$ et
		$\forall x \in I, f'_{gauche}(x) \leq f'_{droite}(x)$ 

#### Preuve

		Soit $a \in I$ et $\tau_a : $$I\text{\\}\{a\} \longrightarrow \R \quad\quad\quad\quad\quad\quad\quad \\x \longmapsto	\frac{f(x) - f(a)}{x-a}$

		D’après le Lemme des Pentes, $\tau_a$ est croissante
		En effet, soient $(x,y) \in (I \text{\\}\{a\})^2$ et $x<y$

		Cas 1 : $a<x<y$
				On a alors $\frac{f(x) - f(a)}{x-a} \leq \frac{f(y) - f(a)}{y-a}$
				Donc $\tau_a(x) \leq \tau_a(y)$

		Cas 2 : $x \leq a \leq y$
				On a alors $\frac{f(x) - f(a)}{x-a} \leq \frac{f(x) - f(y)}{x-y} \leq \frac{f(y) - f(a)}{y-a}$
				Donc $\tau_a(x) \leq \tau_a(y)$

		Cas 3 : $x\leq y\leq a$
				On a alors $\frac{f(x) - f(y)}{x-y} \leq \frac{f(x) - f(a)}{x-a} \leq \frac{f(y) - f(a)}{y-a}$
				Donc $\tau_a(x) \leq \tau_a(y)$

		Donc $\tau_a(x) \leq \tau_a(x)$

		Soit $x > a$ avec $x \in I$
		On fixe $z_0 < a$ avec $z_0 \in I$

		Alors $\tau_a(x) \ge \tau_a(z_0)$
		$\tau_a$ est minorée sur $I \cap ]a, +\infty[$ et croissante
		Donc $\tau_a$ a une limite finie quand $x$ tend vers $a$ par valeur supérieure
		Donc $f$ est dérivable à droite et $f'_{droite}(a) \ge \tau_a(z_0)$

		Soit $z_1>a$ fixé
		$\forall x \in I \cap ]-\infty, a[, \tau_a(x) \leq \tau_a(z_1)$
		Donc $\tau_a$ est majorée sur $I \cap ]-\infty,a[$
		Donc $\tau_a$ a une limite finie que $x$ tend vers $a$ par valeur inférieure
		Donc $f$ est dérivable à gauche et $f'_{gauche}(a) \leq \tau_a(z_1)$

		De plus, $\forall x \in I \cap ]-\infty, a[,\ \forall y \in ]a,+\infty[,\ \tau_a(x) \leq \tau_a(y)$

		Donc, si on fait tendre $x$ vers $a$ par valeur inférieure :
				$\forall y \in I \cap ]a,+\infty[, f'_{gauche}(a) \leq \tau_a(y)$
		Si on fait tendre $y$ par valeur supérieure : 
				$f'_{gauche}(x) \leq f'_{droite}(x)$

#### Corollaire

		Soit $f : I\longrightarrow \R$ convexe où $I$ est ouvert
		Alors $f$ est continue sur $I$

#### Preuve

		Soit $a \in I$

		$\forall x \in I \cap ]-\infty, a[, \frac{f(x) - f(a)}{x-a} = f'_{g}(a) + \underset{x \underset{<}{\rightarrow}a}{o}(1)$
		Donc $f(x) = f(a) + f'_g(a)(x-a) + \underset{x \underset{<}{\rightarrow}a}{o}(x-a)$
		Donc $f(x) \underset{x \underset{<}{\rightarrow}a}{\longrightarrow} f(a)$

		De même, $\forall x \in I \cap ]a,+\infty[, f(x) = f(a) + f'_d(a) + \underset{x \underset{>}{\rightarrow}a}{o}(x-a)$
		Donc $f(x) \underset{x \underset{>}{\rightarrow}a}{\longrightarrow} f(a)$
		Donc $f$ est continue en $a$

#### Proposition : Théorème Convexité / Croissance Dérivée

		Soit $f : I \longrightarrow \R$ dérivable
		$f$ est dérivable $\iff$ $f'$ est croissance

#### Preuve

		“$\Longrightarrow$” : On suppose que $I$ a au moins 2 éléments distincts, sinon le résultat est trivial
				On suppose $f$ convexe

				Soient $(x,y) \in I^2$, on suppose $x<y$
				Soit $u \in ]x,y[$
				Soit $\tau_x : u \longmapsto \frac{f(u) - f(x)}{u-x}$

				Comme $\tau_x$ est croissante sur $I \text{\\} \{x\}, f'(x) \leq \tau_x(u)$
				D’après le Lemme des Pentes,
						$\frac{f(u) - f(x)}{u-x} \leq \frac{f(x) - f(y)}{x-y} \leq \frac{f(y) - f(u)}{y-u}$
				et donc $\tau_x(u) \leq \tau_y(u)$

				Comme $\tau_y$ est croissante, $\tau_y(u) \leq f'(y)$
				D’où $f'(x) \leq \tau_x(u) \leq \tau_y(u) \leq f'(y)$
				Donc $f'$ est croissante

		“$\Longleftarrow$” : On va exploiter le Théorème des Accroissements Finis

				Soit $f : [a,b] \longrightarrow \R$ continue dérivable sur $]a,b[$
				Alors $\exist c \in ]a,b[, f'(c) = \frac{f(a) - f(b)}{a-b}$

				Soient $x_1<x_2<x_3 \in I^3$
				$f$ est continue sur $[x_1,x_2]$ et dérivable sur $]x_1,x_2[$
				$\exist c_1 \in ]x_1,x_2[, \frac{f(x_1) - f(x_2)}{x_1-x_2} = f'(c_1)$

			 	$f$ est continue sur $[x_2,x_3]$ et dérivable sur $]x_2,x_3[$
				$\exist c_2 \in ]x_2,x_3[, \frac{f(x_2) - f(x_3)}{x_2-x_3} = f'(c_2)$

				On remarque que $c_1 < x < c_2$
				Comme $f'$ est croissante, $f'(c_1) \leq f'(c_2)$

#### Corollaire :

		Soit $f : I\longrightarrow \R$ deux fois dérivable
		$f$ convexe sur $I$ $\iff$ $\forall x \in I, f''(x)>0$

#### Proposition : Inégalité Image / Taux de Variation

		Soit $f : I\longrightarrow \R$ convexe, dérivable
		$\forall (x,a) \in I^2, f(x) \ge f'(a)(x-a) + f(a)$

#### Preuve

		Soit $a \in I$
		On pose $g:$$I \longrightarrow \R \quad\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad \\x \longmapsto f(x) - f'(a)(x-a) + f(a)$

		$g$ est dérivable sur $I$ et $g'(x) = f'(x) - f'(a)$
		On sait que $f'$ est croissante sur $I$

		$g$ est décroissante pour $x < a$, croissante pour $x > a$ et $g(a) = 0$
		$\forall x \in I, g(x) \ge 0$

#### Définition : Concavité

		On dit que $f$ est concave si $-f$ est convexe

#### Propositions : Concavité

		Soit $f : I\longrightarrow \R$
				$f$ concave $\iff$ $\forall (x,y) \in I^2, \forall \lambda \in [0,1], f((1-\lambda)x + \lambda y) \ge (1-\lambda)f(x) + \lambda f(y)$

				Si $f$ est concave sur un intervalle $I$ ouvert, $f$ est continue

				Si $f$ est dérivable, $f$ concave $\iff$ $f'$ décroissante

				Si $f$ est deux fois dérivable, $f$ concave $\iff$ $f''$ négative

				Si $f$ est dérivable et concave, $\forall (x,a) \in I^2, f(x) < f'(a)(x-a) + f(a)$


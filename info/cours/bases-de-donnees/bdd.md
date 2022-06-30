$\Huge \text{Bases de données}$

Objectifs:

 - structure d'une base de données
 - interrogation d'une base de donnée

# I. Introduction
## Besoin

Stockage d'un grand nombre de données : \vspace{-2mm}

> optimisation du volume de stockage  \vspace{-2mm}

> intégrité des données

Redondance ces stockages \vspace{-2mm}

Redondance des alimentations électriques / systèmes de refroidissements

Rapidité d'accès à l'information

Délocalisation du stockage dans le Cloud

## Définition d'une relation

Relation : \vspace{-2mm}

- modèle abstrait $\to$ structure mais pas d'opérations
- pas associé à un langage
- pratique pour l'analyse du monde réel

Relation / table : $R = (A_0 : D_0, A_1 : D_1, \ldots)$ où $A_i$ est le nom de l'attribut et $D_i$ est le domaine de l'attribut $A_i$ :\vspace{-2mm}

> $\to$ ensemble des valeurs possibles (fini ou non)\vspace{-2mm}

> $\to$ type asocié

Base de données $\to$ ensemble de relations

Nécessité de représenter les relations : tableau, enregistrements,...

## Vocabulaire

* Relation et tables sont synonymes.
* Attributs, champs et traits sont synonymes
* Instance, enregistrement, observation ($\simeq$ ligne de données)

Clé primaire: ensemble d'attributs permettant l'identification d'un enregistrement sans ambigüité.

L'implémentation de SQL n'est pas au programme, uniquement la syntaxe l'est.

## Opérations sur les données

Type d'opération sur les données $\to$ requêtes\vspace{-2mm}

* Créer / insérer
* Mettre à jour / modifier
* Détruire
* Rechercher $\to$ la seule au programme

Traitement de la requête:\vspace{-2mm}

1. Analyse syntaxique
2. Optimisation par le SGBD (système de gestion de base de données) $\to$ Hors programme
3. Exécution pour obtenir le résultat

Interrogation de la base de données : \vspace{-2mm}

> calcul relationnel $\to$ hors programme \vspace{-2mm}

> algèbre relationnelle $\to$ hors programme \vspace{-2mm}

> langage de requête : SQL $\to$ au programme

Sélection : renvoie une table contenant une partie des enregistrements.

Projection : Renvoie une table contenant une partie des attributs.

Le résultat de la requête ci-dessous est une table.
```SQL
SELECT att_1, att_1, ... FROM nom_table WHERE condition;
```

Pour récupérer tous les attributs, on utilise `*`.

Pour les conditions, on peut utiliser `+`, `-`, `*`, `/`, `=`, `<>`, `<=`, `>=`, `<`, `>`, `and`, `or`, `not`, `is null`, `is not null`.

Exemples :

```SQL
SELECT Id, Nom FROM villes WHERE Region = "Pays de la Loire";
SELECT Id, Nom, Nb_hab FROM villes WHERE Id = 5;
SELECT Id, Nom, Nb_hab FROM villes WHERE Nom = "Nantes";
SELECT Id, Nom, Nb_hab FROM villes WHERE Nb_hab = 934000;
SELECT * FROM villes WHERE Region = "Pays de la Loire";
SELECT Id, Nom FROM villes WHERE Id >= 5;
SELECT Id, Nom, Nb_hab FROM villes WHERE Region = "Pays de la Loire" ORDER BY Id DESC;
SELECT DISTINCT Region FROM villes ORDER BY Region ASC;
```

L'utilisation de `ORDER BY` permet d'ordonner les éléments d'une table lors d'une requête.

> \vspace{-2mm} ordre lexicographique, comparaison de nombres

> \vspace{-2mm} possibilités de combiner l'ordre : `ORDER BY Region ASC, Nom DESC`.

L'utilisation de `DISTINCT` permet de supprimer les redondances de la table de retour de requête.

Au lieu de faire `X = "Possibilité 1" OR X = "Possibilité 2"`, on peut écrire `X IN ("Possibilité 1", "Possibilité 2")`.

Attention, si on a une valeur à `NULL`, on ne peut pas utiliser l'égalité (`X = NULL`) mais on doit utiliser le mot clé `IS` (`X IS NULL`).

Autre possibilité pour le 5. : utiliser `GROUP BY` en fin de requête pour regrouper les attributs identiques (normalement prévu pour une utilisation plus complexe).

Le mot clé `LIMIT` permet de limiter le nombre de lignes retournées.
Si on veut omettre des lignes au début, on utilise l'instruction `OFFSET`.

Exemples :

```sql
SELECT Id, Nom, Region FROM Villes
ORDER BY Region ASC, Nom DESC;

SELECT Id, Nom, Region FROM Villes
ORDER BY Region ASC, Nom DESC LIMIT 3;

SELECT Id, Nom, Region FROM Villes
ORDER BY Region ASC, Nom DESC LIMIT 3 OFFSET 5;
```


Aggrégations : opérations sur les valeurs d'un attribut `MIN`, `MAX`, `AVG`, `COUNT`, `SUM`.

`GROUP BY` : regroupement (en fin de requête).

`NULL` : ignorés.

Attention : pas d'agrégation dans le `WHERE`.

`AS` : alias

Filtrage des agrégats avec `HAVING` (en fin de requête) $\to$ après un `GROUP BY` (mais cela dépend des environnements)

`WHERE` $\to$ attribut unique

`HAVING` $\to$ 

Exemple de syntaxe :

```sql
SELECT MIN(att_2) FROM nom_table WHERE condition_1
GROUP_BY att_1 HAVING condition_2
```

Exemples : 

```sql
SELECT MIN(Nb_hab) FROM Villes;

SELECT AVG(Nb_hab) AS A_TROUVER FROM Villes;

SELECT Region, AVG(Nb_hab_region) as moyenne FROM Villes
GROUP BY Region ORDER BY moyenne DESC;

# 3 solutions : 

SELECT Nom FROM Villes GROUP BY Id
HAVING Nb_hab_region = MIN(Nb_hab_region); # je ne sais pas si ça marche...

SELECT Nom FROM Villes WHERE Nb_hab = (SELECT MIN(Nb_hab FROM Villes);

SELECT Nom FROM Villes ORDER BY Nb_hab ASC LIMIT 1;

SELECT COUNT(Nb_hab) AS PAS_UN_PIEGE FROM Villes;

SELECT COUNT(DISTINCT Nb_hab_region) as Plus_compliquee FROM Villes;

SELECT Region, AVG(Nb_hab) AS moyenne FROM Villes
GROUP BY Region HAVING moyenne > 200 000;
```


Stockage redondant de `Nb_hab_region` : utilisation de deux tables `Villes` et `Region`.

Le lien entre les tables est fait avec un identifiant primaire au lieu de chaînes de caractères (car les accents sont difficiles à prévoir) :

- dans la table `Villes`, on stocke `ID_Region`
- dans la table `Region`, on a un attribut `ID`

Type `IPK` $\to$ *Integer Primary Key*.

Attention aux ambigüité sur les noms d'attributs.


**Opérations sur les tables** $\leftrightarrow$ opérations sur les ensembles

- Intersection avec `INTERSECT` :

```sql
SELECT * FROM Villes_1 INTERSECT SELECT * FROM Villes_2
```

- Union avec `UNION` :

```SQL
SELECT * FROM Villes_1 UNION SELECT * FROM Villes_2
```

- Soustraction avec `EXCEPT` :

```SQL
SELECT * FROM Villes_1 EXCEPT SELECT * FROM Villes_2
```


Représentation des modèles entité-relation :

```
+------------------------+
|       Etutiants        |
+------------------------+            +-------------------------+
| Nom : text             |    O-*     |         Ecoles          |
| Prénom : text          |============+-------------------------+
| Filière : text         |            | Nom : text              |
| _Numéro INE_ : integer |            | Ville : text            |
+------------------------+            | _ID école_ : integer    |
           ||                         | INE : integer           |
           || *-*                     +-------------------------+
           ||
+-------------------------+
|        Concours         |
+-------------------------+
| Nom : text              |
| _ID Concours_ : integer |
| INE : integer           |
+-------------------------+
```

Produit cartésien :

```SQL
SELECT att FROM table1 JOIN table2
```

On associe chaque ville à chaque région (même Bordeaux -- Pays de la Loire ou Bordeaux -- Bretagne).

Utilisation de `ON` à la place de `WHERE` pour vérifier une condition sur un `JOIN` : 

```SQL
SELECT Villes.Nom, Regions.Nom FROM Villes JOIN Regions
ON Villes.ID_Region = Regions.ID_Regions
```

retourne

+--------------+----------------------------+
| Nom_ville    | Nom_region                 |
+--------------+----------------------------+
| Bordeaux     | Nouvelle-Aquitaine         |
+--------------+----------------------------+
| Angoulème    | Nouvelle-Aquitaine         |
+--------------+----------------------------+
| Lyon         | Auvergne-Rhône-Alpes       |
+--------------+----------------------------+
| ...          | ...                        |
+--------------+----------------------------+

On peut utiliser plusieurs `JOIN ... ON ...` :

```SQL
SELECT * FROM T1 JOIN T2 ON ... JOIN T3 ON ...;
```

Jointure gauche `LEFT JOIN` : retourne une table contenant toutes les occurrences de la table *gauche* ($1^{\underline{\text{ère}}}$ citée) même si elles ne vérifient pas la condition du `ON`.

```SQL
SELECT Villes.Nom AS Nom_villes, Region.Nom AS Nom_region
FROM Regions LEFT JOIN Villes ON Villes.ID_Regions = Regions.ID;

SELECT Villes.Nom AS Nom_villes, Region.Nom AS Nom_region
FROM Villes LEFT JOIN Regions ON Villes.ID_Regions = Regions.ID;
```

*Exercice* :

```SQL
SELECT Villes.Nom, Regions.Nom, Regions.Nb_hab FROM Villes
WHERE Villes.Nom = "Nantes" JOIN Regions
ON Villes.ID_Region = Regions.ID;

SELECT Villes.Nom, Regions.Nom, Villes.Nb_hab FROM Villes
JOIN Regions ON Villes.ID_Region = Regions.ID
ORDER BY Villes.Nb_hab DESC LIMIT 1;
```


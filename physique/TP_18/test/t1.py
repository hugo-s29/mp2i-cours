# Régression linéaire
# 06/04/2022
# Bastien FAVRE
# v0.8


# IMPORTATION DES MODULES

from math import pi
import numpy as np
import matplotlib.pyplot as plt
from numpy.polynomial import Polynomial


# PROGRAMME PRINCIPAL

# Déclaration des points expérimentaux
T20 = np.array([31.95, 29.75, 27.93, 26.66, 25.31, 24.07, 22.49,
              21.22,19.65, 17.41, 16.06]) # Mesures sur 20 périodes

L0 = np.array([0.620, 0.546, 0.474, 0.433, 0.394, 0.350, 0.308, 0.270,
             0.23, 0.190, 0.15]) # Mesures de la longueur

card = len(T20) # Nombre de valeurs expérimentales
uT = [0.10]*card # Incertitude sur T
uL0 = [0.04]*card # Incertitude sur L


T2 = [] # Liste contenant T²
uT2 = [] # Liste contenant u(T²)

for i in range(card):
    # Calcul d'une période
    x = T20[i]/20
    y = uT[i]

    # Calcul de T² et de son incertitude
    uT2.append(2.*x*y)
    T2.append(x*x)

# Régression linéaire

# Nombre de tirages
N = 100
abscisses = [0] * card
ordonnées = [0] * card
a = []
b = []

# Tirage aléatoire des points
for i in range(N):
    for j in range(card):
        # Tirage aléatoire des valeurs
        x = np.random.normal(L0[j], uL0[j])
        y = np.random.normal(T2[j], uT2[j])

        # Remplissage des listes
        abscisses[j] = x
        ordonnées[j] = y

    # Modélisation de la droite
    pb, pa = Polynomial.fit(abscisses, ordonnées, 1).convert()
    a.append(pa)
    b.append(pb)

# Écart-type
sa = np.std(a)
sb = np.std(b)

# Moyenne des paramètres
a_m = np.mean(a)
b_m = np.mean(b)

g = 4 * (np.pi)**2 / a_m
ug = sa*2

print(a_m, b_m)
print(g, "+-", ug)

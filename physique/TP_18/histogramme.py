# necessaire pour le traitement statistique
import numpy as np
# necessaire pour les graphiques
import matplotlib.pyplot as plt
# necessaire pour  les fonctions mathematiques classiques
from math import *

# Entrer les différentes valeurs de période T dans la liste ci-dessous
# Exemple : T = np.array([6,7,8,9])

T = np.array([1.81, 1.34, 1.47, 1.50, 1.59, 1.56, 1.59, 1.47, 1.63,
              1.57, 1.38, 1.53, 1.66, 1.53, 1.66, 1.60, 1.63, 1.53, 1.53,
              1.56, 1.53, 1.62, 1.66, 1.69, 1.56, 1.37, 1.68, 1.53, 1.65,
              1.63, 1.59, 1.63, 1.65, 1.66, 1.81, 1.57, 1.53, 1.57, 1.63,
              1.35])

# Une fois que les tableaux d et T sont remplis, il faut compiler ce script (touche F5 ou commande Run)

# Trace histogramme rice : choix automatique par la fonction hist,
# fonde sur la taille de l'echantilon
plt.hist(T, bins='rice', histtype = 'bar', edgecolor='black', color='lightblue')

# Les informations necessaires a un graphique
plt.title("Histogrammes des périodes T")
plt.xlabel("T (s)")
plt.ylabel("effectifs")
plt.savefig("histo.eps")
plt.show()

# Calcul de l'écart-type,
# ddof=1 est important, cela fixe le denominateur de l'ecart-type
std = np.std(T,ddof=1)
# Calcul de la moyenne
moy=np.mean(T)
# Longueur de l'echantillon
longueur=len(T)

print('Nombre de mesures=', longueur, 'Ecart type =', std)
print('Moyenne=', moy, 'Incertitude-type A, a 68%= ', std/sqrt(longueur))

from math import *
import numpy as np

import matplotlib.pyplot as plt

##### Incertitude composee #####


# Entrez la longueur, et l'acceleration

l = 0.618
g = 9.80

# Entrez l'incertitude-type à 68% (1 écart-type)

ul=0.002
ug=0.01

# Entrez la fonction de composition
## Pour définir une fonction de plusieurs variables, par exemple x^2-y^2
## def f(x,y):
##    return x**2-y**2

def f(x,y):
    return 2*pi*sqrt(x/y)

# Entrez le nombre de simulation que vous voulez effectuer 

N = 100000
# Simulation

longueur=[]
gravite=[]
periode=[]

for i in range(N):
    # Tirage d'un nombre aléatoire entre les valeurs extrémales
    x=np.random.normal(l, ul)
    y=np.random.normal(g, ug)
    longueur.append(x)
    gravite.append(y)
    # Calcul de la fonction avec ce nombre aléatoire
    periode.append(f(x,y))

ax1=plt.subplot(1,3,1)
ax2=plt.subplot(1,3,2)
ax3=plt.subplot(1,3,3)

ax1.hist(longueur,label='l', bins='rice', histtype = 'step')
ax1.set_xlabel("l (m)")
ax1.set_ylabel("effectifs")
ax2.hist(gravite,label='l', bins='rice', histtype = 'step')
ax2.set_xlabel("g (m/s^2)")
ax3.hist(periode,label='l', bins='rice', histtype = 'step')
ax3.set_xlabel("T (s)")
plt.show()

# Calcul et affichage moyenne et écart type

moy=np.mean(periode)
sigma=np.std(periode, ddof=1)
print("moyenne =", moy)
print("sigma =", sigma)


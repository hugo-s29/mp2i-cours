import numpy as np
import matplotlib.pyplot as plt

T = 30 # periode du signal

def e(t): # signal d'entrée
    return np.floor((t % T)/T + 0.5)

dt = 0.01 # valeur de Δt
ts = np.arange(0., 100., dt) # valeurs de t

plt.plot(ts, e(ts)) # on affiche e

u = 0
us = []

for t in ts:
    # calcul de du avec l'équation différentielle
    du = (e(t) - u) * dt
    # on modifie u et on stocke le résultat
    u += du
    us.append(u)

plt.plot(ts, us)
plt.xlabel("t' (u.a.)")
plt.ylabel("u (V)")
plt.show()

import numpy as np
import matplotlib.pyplot as plt
import matplotlib

matplotlib.use("pgf")
matplotlib.rcParams.update({
    "pgf.texsystem": "pdflatex",
    'font.family': 'serif',
    'text.usetex': True,
    'pgf.rcfonts': False,
})

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
# plt.show()
plt.xlabel(r"$t'\,(u.a.)$")
plt.ylabel(r"$u\,(V)$")
plt.savefig('p3.pgf')

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

T20=np.array([31.95, 29.75, 27.93, 26.66, 25.31, 24.07, 22.49,
              21.22,19.65, 17.41, 16.06])

L0=np.array([0.620, 0.546, 0.474, 0.433, 0.394, 0.350, 0.308, 0.270,
             0.23, 0.190, 0.15])

N = 400

plt.title("recherche de droite pour modeliser T=f(l)")
ax1 = plt.subplot(1, 3, 1) # droites
ax2 = plt.subplot(1, 3, 2) # points aléatoires
ax3 = plt.subplot(1, 3, 3) # courbe avec les points

card=len(T20)
uT=[0.10]*card
uL0=[0.04]*card

T2=[ (x / 20.) ** 2 for x in T20] # calcul de T²
uT2=[ 2. * (t / 20.) * u_t for t, u_t in zip(T20, uT)] # calcul de u(T²)

# Les droites sont de la forme y = ax + b

a_vals = [] # coefficients directeurs
b_vals = [] # ordonnées à l'origine

ax1.scatter(L0, T2)
ax2.scatter(L0, T2)
ax3.scatter(L0, T2)

for k in range(N):
    # le point (T = 0, ℓ = 0) est toujours présent
    courbe_t2 = [0]
    courbe_l = [0]

    for i in range(card):
        t2 = T2[i]
        u_t2 = uT2[i]
        l = L0[i]
        u_l = uL0[i]

        # on choisit un point aléatoire aux coordonées (t₁², ℓ₁)
        t2_1 = np.random.normal(t2, u_t2)
        l_1 = np.random.normal(l, u_l)

        courbe_t2.append(t2_1)
        courbe_l.append(l_1)

    # régression linéaire
    a, b = [ float(x) for x in np.polyfit(courbe_l, courbe_t2, 1) ]
    ax2.scatter(courbe_l, courbe_t2, marker="+") # on affiche les points sur graph2
    ax1.plot(L0, a * L0 + b) # et la courbe sur graph1

    a_vals.append(a)
    b_vals.append(b)

# régression linéaire sans prendre en compte les incertitudes
p = np.polyfit(L0,T2,1)
a=float(p[0])
b=float(p[1])

ax3.plot(L0, a*L0+b, color="green")

# calcul des valeurs moyennes et des incertitudes
ma = np.mean(a_vals)
mb = np.mean(b_vals)

ua = np.std(a_vals, ddof=1)
ub = np.std(b_vals, ddof=1)

ax3.plot(L0, ma*L0+b, color="red")

print(f"a = {ma:0.4} ± {ua:0.4}")
print(f"b = {mb:0.4} ± {ub:0.4}")

# calcul de la valeur de g et son incertitude

g = 1 / (a / (np.pi**2 * 4))
ug = (2*np.pi/a)**2 * ua
print(f"g = {g:0.4} ± {ug:0.4}")

ax3.errorbar(L0, T2, uT2, uL0, fmt='none')

ax1.set_xlabel(r"$\ell\,(m)$")
ax1.set_ylabel(r"$T^2\,(s^2)$")
ax2.set_xlabel(r"$\ell\,(m)$")
ax2.set_ylabel(r"$T^2\,(s^2)$")
ax3.set_xlabel(r"$\ell\,(m)$")
ax3.set_ylabel(r"$T^2\,(s^2)$")

plt.tight_layout(pad=1.0)
plt.savefig('p1.pgf')
# plt.show()

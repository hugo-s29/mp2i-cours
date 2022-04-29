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

plt.gca().set_aspect('equal')

# ici, alpha est l'angle d'incidence des rayons
alpha = np.pi / 6
n1, n2 = 1, 1.458 # indices de réfraction (air et verre)
r = 1 # rayon de la lentille

beta = -np.arcsin((n1/n2)*alpha)

# on affiche la lentille
ctheta = np.linspace(-np.pi/2, np.pi/2, 100)
cx = r * np.cos(ctheta)
cy = r * np.sin(ctheta)

plt.plot(np.append(cx, 0), np.append(cy, -r))

# coordonée y des rayons
rayons = np.linspace(-r+0.1, r-0.1, 30)

for y in rayons:
    # rayon avant d'entrer dans la lentille
    r1x = r * np.linspace(-1, 0, 10) * np.cos(alpha)
    r1y = -r * np.linspace(-1, 0, 10) * np.sin(alpha) + y
    
    # rayon dans la lentille
    px, py = 0, y
    fact = 1/2.

    # on cherche à estimer la position du point de sortie
    # de la lentille avec une méthode type dichotomie
    # la solution est plus simple dans le cas où alpha = 0
    # ( x = √(r²  - y²) ) mais, je n'ai pas trouvé d'expression
    # exacte pour x avec alpha quelconque

    for i in range(20):
        dt = fact**i
        
        # si le point est en dehors de la lentille,
        # on se rapproche de la lentille, sinon, on
        # s'éloigne
        if px**2 + py**2 < r**2:
            px += r * dt * np.cos(beta)
            py += r * dt * np.sin(beta)
        else:
            px -= r * dt * np.cos(beta)
            py -= r * dt * np.sin(beta)
    
    # normale du de la lentille
    normal = np.array([px,py]) / r

    r2x = np.array([px])
    r2y = np.array([py])
    
    # ici, vec représente un vecteur unitaire
    # dans la même direction que le rayon
    vec = np.array([px,py-y])
    vec = vec / np.linalg.norm(vec)

    # phi est l'angle incident et psi est l'angle réfracté
    cos_phi = min(np.dot(normal, vec), 1)
    sin_phi = np.sqrt(1 - cos_phi**2)
    sin_psi = (n2/n1) * sin_phi
    
    if abs(sin_psi) > 1: # réfléction totale
        rx = np.concatenate((r1x, r2x))
        ry = np.concatenate((r1y, r2y))

        plt.plot(rx,ry)
        continue
    
    cos_psi = np.sqrt(1 - sin_psi**2)
    
    s = np.sign(-y) # correction pour le signe de sin_psi
    
    r3x = r * np.linspace(1, 0, 10) * cos_psi + px
    r3y = s * r * np.linspace(1, 0, 10) * sin_psi + py
    
    # on affiche les rayons
    rx = np.concatenate((r1x, r2x, r3x))
    ry = np.concatenate((r1y, r2y, r3y))
    
    plt.plot(rx,ry)

plt.axis('off')
#plt.show()
plt.savefig('p2.pgf')


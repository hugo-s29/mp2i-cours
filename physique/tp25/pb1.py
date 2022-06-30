import numpy as np
import matplotlib.pyplot as plt

a = 2
n = 12
eps = 10**(-n)

x = np.linspace(-3, 3, 1000)
y = np.tanh(a*x)

plt.plot(x, y, 'red')
plt.plot(x, x, 'blue')

f = lambda x : x - np.tanh(a * x)

u = 0
v = 10

while abs(v - u) > eps:
    m = (u + v) / 2

    if f(m) * f(v) > 0:
        v = m
    else:
        u = m

res = np.round(u, n)
print(f'Racine en {res} à {eps}')
plt.show()


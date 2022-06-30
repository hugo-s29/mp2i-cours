from scipy.integrate import solve_ivp
import numpy as np
import matplotlib.pyplot as plt

cond_init = np.array([1, 0])
omega_0 = 2
Q = 1
E = 10

def f(t, x):
    return np.array([
        x[0],
        - omega_0 * x[1] / Q - omega_0 ** 2 * x[0] + omega_0 ** 2 * E
    ])

data = solve_ivp(f, [0, 50], cond_init, max_step = 0.1)

plt.plot(data.t, data.y[0])
plt.show()

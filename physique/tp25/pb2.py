from scipy.integrate import solve_ivp
import numpy as np
import matplotlib.pyplot as plt

cond_init = np.array([np.pi, 0])
omega_0 = 2

def f(t, x):
    return np.array([
        x[1],
        -omega_0**2 * np.sin(x[0])
    ])

data = solve_ivp(f, [0, 50], cond_init, max_step = 0.1)

plt.plot(data.t, data.y[0])
plt.show()


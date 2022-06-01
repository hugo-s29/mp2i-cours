import pandas as pd
import numpy as np

df = pd.read_csv('data2.csv')
omegasd = df['omega_haut']**2 - df['omega_bas']**2
df['omega_squared'] = omegasd.round(2)

#for oh, ob, o in zip(df['omega_haut'], df['omega_bas'], df['omega_squared']):
#    so = format(o, '.2f')
#    print(f"{oh:0.4}&{ob:0.4}&{so}\\\\\\hline")

omegasd_mean = omegasd.mean()
n = omegasd.size

print(round(omegasd_mean, 3))
s = round(
    np.sqrt(
        sum([ (w - omegasd_mean)**2 for w in omegasd ])/(n - 1)
    ),
    5
)

print(s)
print(s / np.sqrt(n))


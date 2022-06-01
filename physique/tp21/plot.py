import matplotlib.pyplot as plt
import matplotlib
import pandas as pd
import numpy as np

"""
matplotlib.use('pgf')
matplotlib.rcParams.update({
    'pgf.texsystem': 'pdflatex',
    'font.family': 'serif',
    'text.usetex': True,
    'pgf.rcfonts': False,
})
"""

fig = plt.figure()
ax  = fig.add_subplot(1, 1, 1)

df = pd.read_csv('data.csv').apply(pd.to_numeric, errors='coerce')

#plt.xlabel(r'$t\quad(\mbox{s})$')
#plt.ylabel(r'$\omega\quad(\mbox{rad}/\mbox{s})$')

target_num_points = 15000
total_num_points = len(df['t'])
every = total_num_points // target_num_points

t = np.array(df['t'])[::every]
gx = -np.array(df['gx'])[::every]

plt.plot(t, gx, linewidth=0.5, color="#9ccfd8")
# plt.savefig('data.pgf')

plt.show()


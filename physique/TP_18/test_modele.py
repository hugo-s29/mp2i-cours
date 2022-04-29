from math import pi
import numpy as np
import matplotlib.pyplot as plt
# valeurs experimentales brutes

T20=np.array([31.95, 29.75, 27.93, 26.66, 25.31, 24.07, 22.49,
              21.22,19.65, 17.41, 16.06])

L0=np.array([0.620, 0.546, 0.474, 0.433, 0.394, 0.350, 0.308, 0.270,
             0.23, 0.190, 0.15])

card=len(T20)
uT=[0.10]*card
uL0=[0.04]*card

Tlog=[]
Llog=[]
T1=[]
L2=[]
T2=[]

uTlog=[]
uLlog=[]

uL2=[]
uT2=[]

for i in range(card):
    x=T20[i]/20
    y=uT[i]
    T1.append(x)
    #
    uT2.append(2.*x*y)
    T2.append(x*x)
    #
    uTlog.append(y/x)
    Tlog.append(np.log(x))
    #
    x=L0[i]
    y=uL0[i]
    uLlog.append(y/x)
    Llog.append(np.log(x))
    #
    x=np.sqrt(x)
    uL2.append(0.5*y/x)
    L2.append(x)

    
ax1=plt.subplot(1,3,1)
ax2=plt.subplot(1,3,2)
ax3=plt.subplot(1,3,3)

plt.title("recherche de droite pour modeliser T=f(l)")

ax1.scatter(Llog, Tlog)
ax1.errorbar(Llog, Tlog, uTlog, uLlog, fmt='none')
ax1.set_xlabel("ln(l) (ln(m))")
ax1.set_ylabel("ln(T) (ln(s))")


ax2.scatter(L2, T1)
ax2.errorbar(L2, T1, uT, uL2, fmt='none')
ax2.set_xlabel("l^(1/2) (m^1/2)")
ax2.set_ylabel("T (s)")

p = np.polyfit(L0,T2,1)
a=float(p[0])
b=float(p[1])
print(a,b, card)
print(4*pi*pi/9.81)

ax3.scatter(L0, T2)
ax3.plot(L0, a*L0+b)
ax3.errorbar(L0, T2, uT2, uL0, fmt='none')
ax3.set_xlabel("l (m)")
ax3.set_ylabel("T^2 (s^2)")


plt.show()

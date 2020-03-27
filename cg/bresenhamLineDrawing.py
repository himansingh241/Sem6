import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

x1, y1 = map(int, input("Enter initial points(x y)").split())
x2, y2 = map(int, input("Enter final points(x y)").split())

if x1 > x2:
    x1, x2 = x2, x1
    y1, y2 = y2, y1

factor = 1

slope = (y2 - y1) / (x2 - x1)

if slope < 0:
    factor = -1

X = [x1]
Y = [y1]

ydiff = abs(y2 - y1)
print(ydiff)
xdiff = abs(x2 - x1)
ydiff2 = 2 * ydiff
diff2 = 2 * (ydiff - xdiff)
P = ydiff2 - xdiff
print(ydiff2)
x = x1
y = y1
for k in range(xdiff):
    print(P)
    x += 1
    if P < 0:
        P += ydiff2
    elif P >= 0:
        y += factor
        P += diff2
    X.append(x)
    Y.append(y)
    
print(X)
print(Y)
plt.plot(X, Y)
plt.show()

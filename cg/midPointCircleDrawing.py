import matplotlib.pyplot as plt

def midPointAlgo(x_center, y_center, r):
    x, y = r, 0
    X, Y = [], []
    X.append(x + x_center)
    Y.append(y + y_center)
    if r > 0:
        X.append(x + x_center)
        Y.append(-y + y_center)
        X.append(y + x_center)
        Y.append(x + y_center)
        X.append(-y + x_center)
        Y.append(x + y_center)
    P = 1 - r
    while x > y:
        y += 1
        # Midpoint inside circle
        if P <= 0:
            P += 2 * y + 1
        else:
            x -= 1
            P += 2 * y - 2 * x + 1
        if x < y:
            break
        X.append(x + x_center)
        Y.append(y + y_center)
        X.append(-x + x_center)
        Y.append(y + y_center)
        X.append(x + x_center)
        Y.append(-y + y_center)
        X.append(-x + x_center)
        Y.append(-y + y_center)
        if x != y:
            X.append(y + x_center)
            Y.append(x + y_center)
            X.append(-y + x_center)
            Y.append(x + y_center)
            X.append(y + x_center)
            Y.append(-x + y_center)
            X.append(-y + x_center)
            Y.append(-x + y_center)
    return X, Y

x_center, y_center = map(int, input("Enter center points of Circle: ").split())
r = int(input('Enter radius of circle: '))

X, Y = midPointAlgo(x_center, y_center, r)
plt.scatter(X, Y)
plt.show()

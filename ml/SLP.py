import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.datasets import load_iris
from sklearn.preprocessing import MinMaxScaler
import seaborn as sns
from tqdm import tqdm
sns.set(style="ticks", color_codes=True)

def activation(x, derivative=False):
    x[x <= 0.5] = 0
    x[x > 0.5] = 1
    return x

def train(X, y, epochs=100, alpha=0.1):
    weights = np.random.uniform(size=(X.shape[1] + 1, 1))
    y = y.reshape(y.shape[0], 1)
    X = np.c_[np.ones(X.shape[0]), X]
    for i in tqdm(range(epochs)):
        predicted_output = activation(X @ weights)
        error = y - predicted_output
        d_pred_output = alpha * error
        weights += X.T @ d_pred_output
    return weights

def predict(X, weights):
    return activation(X @ weights[1:, :] + weights[0, :])

iris = load_iris()
# sns.pairplot(sns.load_dataset("iris"), hue='species')
plt.show()
df = pd.DataFrame(np.c_[iris.data, iris.target], columns=iris['feature_names'] + ['target'])

X = df.iloc[:, :-1]
y = df.iloc[:, -1].values
y[y == 2] = 1
scaler = MinMaxScaler()
X = scaler.fit_transform(X)

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3)

if __name__ == "__main__":
    weights = train(X_train, y_train, epochs=1000, alpha=0.01)
    y_pred = predict(X_test, weights)
    print("Testing Accuracy: ", accuracy_score(y_test, y_pred) * 100, "%", sep='')

import numpy as np
from sklearn.metrics import accuracy_score


def sigmoid(x, derv=False):
    if derv:
        return x * (1 - x)
    else:
        return 1 / (1 + np.exp(-x))


def algo(X, y, alpha=0.01, epochs=100):
    input_neurons, hidden_neurons, output_neurons = 2, 2, 1
    hidden_weights = np.random.uniform(size=(input_neurons, hidden_neurons))
    hidden_bias = np.random.uniform(size=(1, hidden_neurons))

    output_weights = np.random.uniform(size=(hidden_neurons, output_neurons))
    output_bias = np.random.uniform(size=(1, output_neurons))

    for i in range(epochs):
        # Output From hidden layer
        hidden_activation = X @ hidden_weights
        hidden_activation += hidden_bias
        hidden_output = sigmoid(hidden_activation)

        # Output From Output Layer
        output_activation = hidden_output @ output_weights
        output_activation += output_bias
        predicted_output = sigmoid(output_activation)

        error = y - predicted_output

        d_pred_output = error * sigmoid(predicted_output, True)

        hidden_error = d_pred_output @ output_weights.T
        d_hidden_output = hidden_error * sigmoid(hidden_output, derv=True)

        output_weights += hidden_output.T @ d_pred_output * alpha
        output_bias += np.sum(d_pred_output, axis=0, keepdims=True) * alpha

        hidden_weights += X.T @ d_hidden_output * alpha
        hidden_bias += np.sum(d_hidden_output, axis=0, keepdims=True) * alpha

    return predicted_output


def predict(predicted_output):
    predicted_output[predicted_output < 0.5] = 0
    predicted_output[predicted_output >= 0.5] = 1
    return predicted_output


X = np.array([[0, 0], [0, 1], [1, 0], [1, 1]])
y = np.array([[0], [1], [1], [0]])

if __name__ == "__main__":
    predicted_output = algo(X, y, alpha=0.1, epochs=20000)
    print(predicted_output)
    y_pred = predict(predicted_output)
    print("Prediction: ", y_pred)
    print("Accuracy: ", accuracy_score(y, y_pred))

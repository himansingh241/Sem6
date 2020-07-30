import numpy as np
import math as m
import matplotlib.pyplot as plt

def display(matrix, result):
    if matrix is not None:
        x1 = np.append(matrix[0], matrix[0, 0])
        y1 = np.append(matrix[1], matrix[1, 0])
        plt.plot(x1, y1)
    if result is not None:
        x2 = np.append(result[0], result[0, 0])
        y2 = np.append(result[1], result[1, 0])
        plt.plot(x2, y2)

    plt.axis('equal')
    plt.legend(['Original Object', 'Transformed Object'])
    plt.title('2D Transformations')
    plt.show()

def translation(tx, ty):
    trans_matrix = np.eye(3)
    trans_matrix[0, 2] = tx
    trans_matrix[1, 2] = ty

    return trans_matrix


def scaling(h, k):
    scale_matrix = np.eye(3)
    scale_matrix[0, 0] = h
    scale_matrix[1, 1] = k

    return scale_matrix 


def rotation(a, direction):
    rotation_matrix = np.eye(3)
    r = m.radians(a)
    s = m.sin(r)
    c = m.cos(r)
    if direction == 1:
        rotation_matrix[0, :2] = c, -s
        rotation_matrix[1, :2] = s, c
    elif direction == 2:
        rotation_matrix[0, :2] = c, s
        rotation_matrix[1, :2] = -s, c
    else:
        return '\nPlease Choose A Valid Direction For Rotation'

    return rotation_matrix


def reflection(axis):
    reflection_matrix = np.eye(3)
    if axis == 1:
        c = float(input('Enter Equation of line in form of "x = c" (Enter c) : '))
        reflection_matrix[0, 0] = -1
        t = translation(-c, 0) @ reflection_matrix @ translation(c, 0)
    elif axis == 2:
        s, c = map(float, input('Enter Equation of line in form of "y = mx + c" (Enter m and c):').split())
        angle = m.degrees(m.atan(s))
        reflection_matrix[1, 1] = -1
        t = translation(0, -c) @ rotation(angle, 2) @ reflection_matrix @ rotation(angle, 1) @ translation(0, c)
    else:
        return '\nPlease Choose a Valid Option for Reflection'

    return t


def shearing():
    pass


v = int(input('Enter number of Vertices in the object : '))
obj_matrix = np.empty((3, v))

for i in range(0, v):
    obj_matrix[0, i], obj_matrix[1, i] = map(float, input('Enter Co-ordinate of point (x y):').split())
    obj_matrix[2, i] = 1

print("\n\nHomogeneous Matrix of object's co-ordinates")
print(obj_matrix)

display(obj_matrix, None)

flag = True

while flag:
    print('\n\n-----Transformation-----')
    print('(1)Translation\n(2)Scaling\n(3)Rotation\n(4)Reflection\n(5)Shearing\n(6)Exit')
    option = int(input('\nWhich transformation do you want to perform : '))

    if option == 1:
        print('\n-----Translation-----')
        x = float(input('Enter translation length along x-axis : '))
        y = float(input('Enter translation length along y-axis : '))

        result = translation(x, y) @ obj_matrix
        print(result)
        display(obj_matrix, result)

    elif option == 2:
        print('\n-----Scaling-----')
        x = float(input('Enter Scaling factor along x-axis : '))
        y = float(input('Enter Scaling factor along y-axis : '))

        result = scaling(x, y) @ obj_matrix
        print(result)
        display(obj_matrix, result)

    elif option == 3:
        print('\n-----Rotation-----')
        o = float(input('Enter Rotation Angle(in Degree) : '))
        d = int(input('Choose Direction of Rotation\n(1)Anticlockwise\n(2)Clockwise\n'))

        result = rotation(o, d) @ obj_matrix
        print(result)
        display(obj_matrix, result)

    elif option == 4:
        print('\n-----Reflection-----')
        a = int(input('Choose line for Reflection\n(1)Parallel y-axis\n(2)Other\n'))

        result = reflection(a) @ obj_matrix
        print(result)
        display(obj_matrix, result)

    elif option == 5:
        print('\n-----Shearing-----')

    elif option == 6:
        print('\nExit')
        flag = False
    else:
        print("\nChoose a Valid Option!")

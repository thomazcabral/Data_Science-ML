import numpy as np

def dot_product(arrays):
    return np.dot(arrays[0], arrays[1])


def inner_product(matrices):
    if(len(matrices) == 1):
        return matrices[0]
    matrices[1] = np.inner(matrices[0], matrices[1])
    matrices.remove(matrices[0])
    return inner_product(matrices)


def outer_product(matrices):
    if(len(matrices) == 1):
        return matrices[0]
    matrices[1] = np.outer(matrices[0], matrices[1])
    matrices.remove(matrices[0])
    return inner_product(matrices)


def determinant(matrix):
    return np.linalg.det(matrix)


def linear_equation(matrix, vector):
    return np.linalg.solve(matrix, vector)


def multiplictive_inverse(matrix):
    return np.linalg.inv(matrix)


def diagonal_sum(matrix):
    return np.trace(matrix)

operation = input("Type just the number:\n1 - Dot Product\n2 - Inner Product\n3 - Outer Product\n4 - Determinant\n5 - Linear Equation\n6 - Multiplictive inverse\n7 - Sum of the diagonal elements\n")

if(operation == '1'):
    all_arrays = []
    print("Arrays must be given in this format: [1,2,3]")
    for i in range(2):
        array = input(f"Array {i + 1}: ")
        array_list = eval(array)
        array_np = np.array(array_list)
        all_arrays.append(array_np)
    print(f"Dot Product between these arrays is:\n{dot_product(all_arrays)}")

elif(operation == '2'):
    all_arrays = []
    print("Matrices must be given in this format: [[1,2,3],[4,5,6]] and all of them have to a compatible size")
    num = int(input("Number of matrices: "))
    for i in range(num):
        matrix_str = input(f"Matrix {i + 1}: ")
        matrix_list = eval(matrix_str)
        matrix_np = np.array(matrix_list)
        all_arrays.append(matrix_np)
    print(f"Inner Product between this matrices is:\n{inner_product(all_arrays)}")

elif(operation == '3'):
    all_matrices = []
    print("Matrices must be given in this format: [[1,2,3],[4,5,6]] and all of them have to a compatible size")
    num = int(input("Number of matrices: "))
    for i in range(num):
        matrix_str = input(f"Matrix {i + 1}: ")
        matrix_list = eval(matrix_str)
        matrix_np = np.array(matrix_list)
        all_matrices.append(matrix_np)
    print(f"Outer Product between this matrices is:\n{outer_product(all_matrices)}")

elif(operation == '4'):
    print("The matrix must be given in this format: [[1,2,3],[4,5,6]]")
    matrix = eval(input("Matrix: "))
    matrix_np = np.array(matrix)
    print(f"The determinant of that matrix is {determinant(matrix_np)}")

elif(operation == '5'):
    print("The linear equation is in this format: Ax = B where A must be a matrix in this format: [[1,2,3],[4,5,6]] and B must be a constant vector in this format: [1,2,3]")
    matrix = eval(input("Matrix: "))
    matrix_np = np.array(matrix)
    vector = eval(input("Vector: "))
    vector_np = np.array(vector)
    print(f"The solution of this linear equation is {linear_equation(matrix_np, vector_np)}")

elif(operation == '6'):
    print("The matrix must be given in this format: [[1,2,3],[4,5,6]]")
    matrix = eval(input("Matrix: "))
    matrix_np = np.array(matrix)
    print(f"The multiplicative inverse of that matrix is:\n{multiplictive_inverse(matrix)}")

elif(operation == '7'):
    print("The matrix must be given in this format: [[1,2,3],[4,5,6]]")
    matrix = eval(input("Matrix: "))
    matrix_np = np.array(matrix)
    print(f"The sum of the elements in its diagonal is {diagonal_sum(matrix)}")

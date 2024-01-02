import numpy as np

def operation1(arrays):
    return np.dot(arrays[0], arrays[1])

operation = input("Type just the number:\n1 - Dot Product\n2 - Inner Product\n3 - Outer Product\n4 - Determinant\n5 - Linear Equation\n6 - Multiplictive inverse\n7 - Sum of the diagonal elements\n")

if(operation == '1'):
    all_arrays = []
    print("Arrays have to be given in this format: [1,2,3]")
    for i in range(2):
        array = input(f"Array {i + 1}: ")
        array_np = np.array([int(value) for value in array[1:-1].split(",")])
        all_arrays.append(array_np)
    print(f"Dot Product between these arrays: {operation1(all_arrays)}")
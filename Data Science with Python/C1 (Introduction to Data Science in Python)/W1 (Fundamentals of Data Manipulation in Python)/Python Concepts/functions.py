def add_numbers(x, y, z):
    return x + y + z

print(add_numbers(1, 2, 3))


def add_numbers(a, b, c=None):
    if(c == None):
        return a + b
    return a + b + c
    
print(add_numbers(1, 2))
print(add_numbers(1, 2, 3))


def do_math(a, b, kind="add"):
    if(kind == "add"):
        return a + b
    return a - b

print(do_math(1, 2))

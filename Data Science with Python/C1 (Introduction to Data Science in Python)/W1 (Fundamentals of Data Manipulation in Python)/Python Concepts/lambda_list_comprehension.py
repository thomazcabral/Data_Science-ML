my_function = lambda a, b, c: a + b + c #much more limited than a normal function
print(my_function(1, 2, 3)) # lambda functions are called normally such as non-lambda functions


people = ['Dr. Christopher Brooks', 'Dr. Kevyn Collins-Thompson', 'Dr. VG Vinod Vydiswaran', 'Dr. Daniel Romero']

def split_title_and_name(person): # normal function
    return person.split()[0] + ' ' + person.split()[-1]

map1 = map(lambda x: x.split()[0] + " " + x.split()[-1], people) #lambda function
result = list(map1)
print(result)


even_numbers = []

for number in range(1000):
    if(number % 2 == 0):
        even_numbers.append(number)

print(even_numbers)

# List comprehension
even_numbers = [number for number in range(1000) if number % 2 == 0] # for loop followed by a condition
print(even_numbers)

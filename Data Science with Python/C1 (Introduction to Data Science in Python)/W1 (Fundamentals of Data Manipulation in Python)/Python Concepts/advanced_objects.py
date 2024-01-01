class Person:
    department = "School of Information"

    def set_name(self, new_name):
        self.name = new_name
    def set_location(self, new_location):
        self.location = new_location


store1 = [10, 11, 12.34, 2.34]
store2 = [9, 11.1, 12.34, 2.01]
cheapest = map(min, store1, store2)
result = list(cheapest)
average = sum(result) / len(result)
cheap_store = "store 1" if result in store1 else "store 2"
print(cheap_store)


numbers = [1, 2, 3, 4, 5, 6]
squared = map(lambda x: x**2, numbers)
result = list(squared)
print(result)


list1 = [1, 2, 3, 4, 5]
list2 = [8, 9, 10, 11, 12]
joined = map(lambda x, y: x + y, list1, list2)
result = list(joined)
print(result)

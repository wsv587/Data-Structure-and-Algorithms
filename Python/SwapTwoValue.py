def swap(value1, value2):
    value1, value2 = value2, value1
    return value1, value2


valueA = 10
valueB = 20
tuple = swap(valueA, valueB)

print(tuple)

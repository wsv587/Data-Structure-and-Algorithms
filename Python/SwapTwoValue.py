def swap(value1, value2):
    value1, value2 = value2, value1
    return value1, value2  # 返回元组，不需要加括号


valueA = 10
valueB = 20
tup = swap(valueA, valueB)  # 元组

print(tup)

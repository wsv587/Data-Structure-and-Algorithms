# 方式一 中间变量
def swap1(value1, value2):
    temp = value1
    value1 = value2
    value2 = temp
    return value1, value2


tup = swap1(666, 999)
print(tup)


# 方式二 python特有
def swap2(value1, value2):
    value1, value2 = value2, value1
    return value1, value2  # 返回元组，不需要加括号


valueA = 10
valueB = 20
tup = swap2(valueA, valueB)  # 元组
print(tup)


# 方式三 数学算法
def swap3(value1, value2):
    value1 = value1 - value2
    value2 = value1 + value2  # value2 = (value1 - value2) + value2
    value1 = value2 - value1  # value1 = value1 - (value1 - value2)
    return value1, value2


tup = swap3(1, 2)
print(tup)

# 斐波那契数列
# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34 ...

# 递归方式实现斐波那契数列
def fib(n):
    if n <= 1:
        return n
    return fib(n - 1) + fib(n - 2)


result = fib(8)


print(result)

# for循环方式实现斐波那契数列
def fib1(n):
    if n <= 1:
        return n

    first = 0
    second = 1
    sum = 0
    for i in range(0, n - 1):
        sum = first + second
        first = second
        second = sum

    return sum


result = fib1(8)
print(result)


# 数组方式实现斐波那契数列
def fib2(n):
    if n <= 1:
        return n

    arr = [0, 1]
    # range(min, max)不包括max
    for i in range(2, n+1):
        arr.append(arr[i - 1] + arr[i - 2])
    return max(arr)

result = fib2(8)
print(result)

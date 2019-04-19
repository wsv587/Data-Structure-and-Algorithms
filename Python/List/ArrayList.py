import os


class ArrayList:
    ```创建一个arraylist对象```

    # size
    # defaultCount
    # elements
    # 对象方法、类方法、静态方法、对象属性、类属性前加两个下划线代表private私有

    __DEFAULT_COUNT = 10
    # 限制对象只可以动态增加这两个对象属性
    __slots__ = ['__elements', '__size']  # 对象属性前加两个下划线代表私有，外界不可访问

    def __init__(self):
        self.__elements = []
        self.__size = 0
        # print('init __size = %d'%(self.__size))

    # 类方法
    @classmethod
    def array_list(cls):
        return cls()  # 也可以 return ArrayList()

    # 对象方法
    def add(self, obj):
        self.__elements.append(obj)  # python 中不能使用list[idx] = xxx来添加元素，否则会报越界错误
        self.__size += 1
        print(self.__elements, self.__size)

    def remove_at_index(self, idx):
        for i in range(idx, self.__size - 1):
            print(i)
            self.__elements[idx] = self.__elements[idx + 1]
        del self.__elements[self.__size - 1]  # 目前只想到这个方法，python貌似不支持设置为null
        # self.__elements[self.__size - 1] = None  # 不能使用None,None也是对象
        self.__size -= 1
        print(self.__elements)

    def remove(self, obj):
        idx = self.index_of(obj)  # 之所以不用contains方法，因为避免先调用contains、再调用index_of而消耗性能
        if idx == -1:
            return
        self.remove_at_index(idx)

    def pop(self):
        del self.__elements[self.__size - 1]
        # self.__elements[self.__size - 1] = None
        self.__size -= 1

    def object_at_index(self, idx):
        return self.__elements[idx]

    def index_of(self, obj):
        for i in range(0, self.__size):
            if self.__elements[i] == obj:
                return i
        return -1

    def contains(self, obj):
        return self.index_of(obj) != -1

    def is_empty(self):
        return self.__size == 0

    def clear(self):
        self.__elements = []

    def size(self):
        return self.__size


# list = ArrayList()
# list.add(12)
# print(list.elements)
# list.elements = [2, 4]
# print(list.elements)

list = ArrayList.array_list()
# list.__elements = [999]
# print(list.__elements)

list.add(12)
print(list)
list.add(24)
list.remove_at_index(0)
list.add(666)
list.add(888)

print(list.index_of(666))
print(list.object_at_index(2))
print(list.contains(24))
print (list.is_empty())

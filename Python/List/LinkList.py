class Node:
    __slots__ = ['data', 'next']

    def __init__(self):
        self.data = None
        self.next = None


class LinkList:
    __slots__ = ['first', 'last', 'size']

    @classmethod
    def link_list(cls):
        return cls()

    def __init__(self):
        self.first = None
        self.last = None
        self.size = 0

    def add(self, obj):
        pass

    def remove_at_index(self, idx):
        pass

    def remove(self, obj):
        pass

    def pop(self):
        pass

    def object_at_index(self, idx):
        pass

    def index_of(self, obj):
        pass

    def contains(self, obj):
        pass

    def is_empty(self):
        return self.size == 0

    def clear(self):
        self.first = None

    def size(self):
        return self.size


list = LinkList()
list.__element = [2]

print(list.__element)
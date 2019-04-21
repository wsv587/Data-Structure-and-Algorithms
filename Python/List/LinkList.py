class Node:
    __slots__ = ['data', 'next']

    def __init__(self):
        self.data = None
        self.next = None

    def __init__(self, data, next):
        self.data = data
        self.next = next


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
        if self.size == 0:
            self.first = Node(obj, self.first)
        else:
            prev = self.__node(self.size - 1)
            prev.next = Node(obj, prev.next)
        self.size += 1

    def insert(self, obj, idx):
        if idx == 0:
            self.first = Node(obj, self.first)
        else:
            prev = self.__node(idx - 1)
            prev.next = Node(obj, prev.next)
        self.size += 1

    def remove_at_index(self, idx):
        if idx == 0:
            self.first = self.first.next
        else:
            prev = self.__node(idx - 1)
            prev.next = prev.next.next
        self.size -= 1

    def remove(self, obj):
        prev = self.__prev_node_of(obj)
        prev.next = prev.next.next
        self.size -= 1

    def pop(self):
        prev = self.__node(self.size - 1)
        prev.next = prev.next.next
        self.size -= 1

    def object_at_index(self, idx):
        node = self.__node(idx)
        return node.data

    def index_of(self, obj):
        node = self.__node_of(obj)
        return node.data

    def contains(self, obj):
        node = self.first
        for _ in range(0, self.size - 1):
            if node.data is obj:
                return True
            node = node.next
        return False

    def is_empty(self):
        return self.size == 0

    def clear(self):
        self.first = None
        self.size = 0

    def size(self):
        return self.size

    def __node(self, idx):
        node = self.first
        for i in range(0, self.size - 1):
            node = node.next
        return node

    def __node_of(self, obj):
        node = self.first

        for _ in range(0, self.size - 1):
            if node.data is obj:
                return node
            node = node.next
        return None

    def __prev_node_of(self, obj):
        node = self.first
        prev = None
        for _ in range(0, self.size - 1):
            if node.data is obj:
                return node
            prev = node
            node = node.next
        return prev


list = LinkList()
list.__element = [2]

print(list.__element)
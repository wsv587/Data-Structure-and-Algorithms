class Node:
    __slots__ = ['data', 'next']

    def __init__(self):
        self.data = None
        self.next = None


class LinkList:
    __slots__ = ['first']
    def __init__(self):
        pass



list = LinkList()
list.__element = [2]

print(list.__element)
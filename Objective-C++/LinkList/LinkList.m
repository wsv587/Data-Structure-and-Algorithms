//
//  LinkList.m
//  LinkList
//
//  Created by sw on 2019/4/19.
//  Copyright © 2019 WS. All rights reserved.
//

#import "LinkList.h"

// 定义Node私有类（Java中叫内部类）

@interface Node : NSObject
@property(nonatomic) id data;       // 节点存储的数据
@property(nonatomic) Node *next;    // 节点指向的后继节点

@end

@implementation Node
+ (instancetype)nodeWithData:(NSObject *)data next:(Node *)next {
    Node *node = [[Node alloc] init];
    node.data = data;
    node.next = next;
    return node;
}

@end

/**
 * 如果LinkList缓存了尾节点，那么他的添加操作的复杂度将是O(1),删除尾节点的复杂度也是O(1)
 */
@interface LinkList()
@property(nonatomic) Node *first;                   // 链表的头结点
@property(nonatomic) NSUInteger size;
@end

@implementation LinkList
+ (instancetype)linklist {
    return [[LinkList alloc] init];
}

-(instancetype)init {
    if (self = [super init]) {
        _first = nil;
        _size = 0;
    }
    return self;
}

- (void)add:(NSObject *)obj {
    if (_size == 0) {
        _first = [Node nodeWithData:obj next:_first];
    } else {
        Node *preNode = [self p_nodeWithIndex:_size - 1];
        preNode.next = [Node nodeWithData:obj next:preNode.next];
    }
    _size += 1;
}

- (void)insert:(NSObject *)obj atIndex:(NSInteger)idx {
    if (idx == 0) {
        // 在头部插入 first指向新节点，新节点指向first原来的next
        _first = [Node nodeWithData:obj next:_first];
    } else {
        // 获取待插入位置的前一个节点，新节点指向前一个节点原来的next，前一个节点指向新节点，
        Node *preNode = [self p_nodeWithIndex:idx - 1];
        preNode.next = [Node nodeWithData:obj next:preNode.next];
    }
    
    _size += 1;
}

- (void)pop {
    // 删除最后一个节点，需要获取最后一个结点的前驱
    Node *preNode = [self p_nodeWithIndex:_size - 2];
    preNode.next = nil;
    _size -= 1;
}

- (void)removeObject:(NSObject *)obj {
    // 移除头结点需要特殊处理
    if ([obj isEqualTo:_first.data]) {
        _first = _first.next;
        _size -= 1;
        return;
    }
    
    Node *preNode = [self p_preNodeWithObject:obj];
    preNode.next = preNode.next.next;

    _size -= 1;
}

- (NSObject *)removeObjectAtIndex:(NSInteger)idx {
    Node *node = _first;
    if (idx == 0) {
        _first = _first.next;
    } else {
        Node *preNode = [self p_nodeWithIndex:idx - 1];
        preNode.next = preNode.next.next;
    }
    
    _size -= 1;
    return node.data;
}

- (NSObject *)objectAtIndex:(NSInteger)idx {
    Node *node = nil;
    if (idx == 0) {
        node = _first;
    } else {
        node = [self p_nodeWithIndex:idx];
    }
    return node.data;
}

- (NSInteger)indexOfObject:(NSObject *)obj {
    Node *node = _first;
    for (NSUInteger i = 0; i < _size; i++) {
        if ([node.data isEqual:obj]) {
            return i;
        }
        node = node.next;
    }
    return NSNotFound;
}

- (NSObject *)setObject:(NSObject *)obj atIndex:(NSInteger)idx {
    Node *node = _first;
    NSObject *oldElement = _first.data;
    if (idx == 0) {
        node.data = obj;
    } else {
        node = [self p_nodeWithIndex:idx];
        oldElement = node.data;
        node.data = obj;
    }
    return oldElement;
}

- (BOOL)contains:(NSObject *)obj {
    Node *node = _first;
    for (NSUInteger i = 0; i < _size; i++) {
        if ([node.data isEqual:obj]) {
            return true;
        }
        node = node.next;
    }
    return NSNotFound;
}

- (void)clear {
    _size = 0;
    _first = nil;
}

- (BOOL)isEmpty {
    return _size == 0;
}

- (NSUInteger)size {
    return _size;
}

#pragma Override
- (NSString *)description {
    if (_size == 0) {
        return @"empty linklist";
    }
    NSString *desc = _first.data;
    if (_size == 1) {
        return _first.data;
    }
    Node *node = _first;
    for (NSUInteger i = 0; i < _size; i++) {
        desc = [NSString stringWithFormat:@"%@,%@",desc, node.next.data];
        node = node.next;
        if (node.next == nil) {
            break;
        }
    }
    return desc;
}

#pragma mark - Private
/** 获取指定位置的节点
 * idx: 位置
 */
- (Node *)p_nodeWithIndex:(NSUInteger)idx {
    Node *node = _first;
    for (NSUInteger i = 0; i < idx; i++) {
        node = node.next;
    }
    return node;
}
/** 获取某个元素所在的节点
 * obj: 元素
 */
- (Node *)p_nodeWithObject:(NSObject *)obj {
    Node *node = _first;
    for (NSUInteger i = 0; i < _size; i++) {
        if ([node.data isEqual:obj]) {
            return node;
        }
        node = node.next;
    }
    return nil;
}
/** 获取某个元素所在节点的前驱
 * obj: 元素
 * 注意: obj如果存在于头结点或不存在于链表中都会返回nil.因为头结点无前驱.所以这个方法无法区分obj不存在于链表 和 obj存在于头结点的情况. 所以obj是否存在于头结点还需要单独处理
 */
- (Node *)p_preNodeWithObject:(NSObject *)obj {
    Node *node = _first;
    Node *preNode = nil;
    for (NSUInteger i = 0; i < _size; i++) {
        if ([node.data isEqual:obj]) {
            return preNode;
        }
        preNode = node;
        node = node.next;
    }
    return preNode;
}
@end

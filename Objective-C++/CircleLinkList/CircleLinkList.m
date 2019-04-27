//
//  CircleLinkList.m
//  CircleLinkList
//
//  Created by sw on 2019/4/25.
//  Copyright © 2019 WS. All rights reserved.
//

#import "CircleLinkList.h"
#import "Node.h"

@interface CircleLinkList ()
@property(nonatomic) NSUInteger size;
@end

@implementation CircleLinkList
+ (instancetype)linklist {
    return [[CircleLinkList alloc] init];
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
        _first.next = _first;
    } else {
        Node *preNode = [self p_nodeWithIndex:_size - 1];
        preNode.next = [Node nodeWithData:obj next:preNode.next];
        preNode.next.next = _first;
    }
    _size += 1;
}

- (void)insert:(NSObject *)obj atIndex:(NSInteger)idx {
    if (idx == 0) {
        // 在头部插入 first指向新节点，新节点指向first原来的next
        _first = [Node nodeWithData:obj next:_first];
        if (_size == 0) {
            _first.next = _first;
        } else {
            // 获取尾节点，尾节点指向新的头节点
            // 因为此时已经把新节点加入链表，所以需要使用_size作为下标去取尾节点，而不是使用原来的size-1去取尾节点
            Node *lastNode = [self p_nodeWithIndex:_size];
            lastNode.next = _first;
        }
    } else {
        // 获取待插入位置的前一个节点，新节点指向前一个节点原来的next，前一个节点指向新节点，
        Node *preNode = [self p_nodeWithIndex:idx - 1];
        preNode.next = [Node nodeWithData:obj next:preNode.next];
    }
    
    _size += 1;
}

- (void)pop {
    if (_size == 1) {
        _first = nil;
    } else {
        // 删除最后一个节点，需要获取最后一个结点的前驱
        Node *preNode = [self p_nodeWithIndex:_size - 2];
        preNode.next = _first;
    }
    _size -= 1;
}

- (void)removeObject:(NSObject *)obj {
    Node *preNode = [self p_preNodeWithObject:obj];
    // 移除头结点需要特殊处理
    if ([obj isEqualTo:_first.data]) {
        preNode.next = _first.next;
        _first = _first.next;
    } else {
        preNode.next = preNode.next.next;

    }
    _size -= 1;
}

- (NSObject *)removeObjectAtIndex:(NSInteger)idx {
    Node *node = _first;
    if (idx == 0) {
        if (_size == 1) {
            _first = nil;
        } else {
            Node *lastNode = [self p_nodeWithIndex:_size - 1];
            lastNode.next = _first.next;
            _first = _first.next;
        }
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
    // 循环链表需要打破循环引用
    _first.next = nil;
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
    NSString *desc = [NSString stringWithFormat:@"%@_%@",_first.data,_first.next.data];
    if (_size == 1) {
        return _first.data;
    }
    Node *node = _first;
    for (NSUInteger i = 0; i < _size - 1; i++) {
        desc = [NSString stringWithFormat:@"%@,%@_%@",desc, node.next.data,node.next.next.data];
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

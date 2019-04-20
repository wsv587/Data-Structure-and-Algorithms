//
//  LinkList.m
//  LinkList
//
//  Created by sw on 2019/4/19.
//  Copyright © 2019 WS. All rights reserved.
//

#import "LinkList.h"
#define DEFAULT_SIZE 10
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
        _elements = [NSMutableArray arrayWithCapacity:DEFAULT_SIZE];
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
    
}

- (NSObject *)setObject:(NSObject *)obj atIndex:(NSInteger)idx {
    
}

- (BOOL)contains:(NSObject *)obj {
    
}

- (void)clear {
    
}

- (BOOL)isEmpty {
    return _size == 0;
}

- (NSUInteger)size {
    return _size;
}

#pragma mark - Private
/* 获取指定位置的节点
 * idx：位置
 */
- (Node *)p_nodeWithIndex:(NSUInteger)idx {
    Node *node = _first;
    for (NSUInteger i = 0; i <= idx; i++) {
        node = node.next;
    }
    return node;
}
@end

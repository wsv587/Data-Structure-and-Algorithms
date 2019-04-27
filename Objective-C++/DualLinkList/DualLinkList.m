//
//  DualLinkList.m
//  DualLinkList
//
//  Created by sw on 2019/4/23.
//  Copyright © 2019 WS. All rights reserved.
//

#import "DualLinkList.h"

@interface DualNode ()
@property(nonatomic) DualNode *next;
@property(nonatomic) DualNode *prev;
@property(nonatomic) NSObject *data;


@end

@implementation DualNode

+ (instancetype)nodeWithData:(NSObject *)data prev:(DualNode *)prev next:(DualNode *)next {
    return [[DualNode alloc] initWithData:data prev:prev next:next];
}

- (instancetype)initWithData:(NSObject *)data prev:(DualNode *)prev next:(DualNode *)next {
    if (self = [super init]) {
        _data = data;
        _prev = prev;
        _next = next;
    }
    return self;
}

- (NSString *)description {
    if ([self.data isKindOfClass:[NSString class]]) {
        return (NSString *)self.data;
    } else if ([self.data isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)self.data stringValue];
    }
    return (NSString *)self.data;
}

@end

@interface DualLinkList ()
@property(nonatomic) DualNode *first;       // 头结点
@property(nonatomic) DualNode *last;        // 尾节点
@property(nonatomic) NSUInteger size;       // 链表的长度

@end

@implementation DualLinkList
+ (instancetype)linklist {
    DualLinkList *list = [[DualLinkList alloc] init];
    list.size = 0;
    list.first = nil;
    list.last = nil;
    return list;
}

- (void)add:(NSObject *)obj {
    if (_size == 0) {
        self.first = [DualNode nodeWithData:obj prev:nil next:nil];
        self.last = self.first;
    } else {
        // 获取last节点
        // 插入newlast
        // 更新last节点
        
        // newNode.prev = last
        // last.next = newNode
        // newNode.next = nil
        // self.last = newNode
        
        self.last.next = [DualNode nodeWithData:obj prev:self.last next:nil];
        self.last = self.last.next;
        
    }
    
    self.size += 1;
}

- (void)insert:(NSObject *)obj atIndex:(NSInteger)idx {
    if (idx == 0) {
        // 向链表头部插入
        if (self.size == 0) {
            // 链表为空
            [self add:obj];
            return;
        } else {
            // 链表非空
            DualNode *newNode = [DualNode nodeWithData:obj prev:nil next:self.first];
            self.first.prev = newNode;
            self.first = newNode;
        }
    } else {
        if (idx == self.size) {
            // 向链表末尾插入
            [self add:obj];
            return;
        } else {
            // 向链表中间插入
            DualNode *oldNode = [self p_nodeAtIndex:idx];
            DualNode *newNode = [DualNode nodeWithData:obj prev:oldNode.prev next:oldNode];
            oldNode.prev.next = newNode;
            oldNode.prev = newNode;
        }
    }
    self.size += 1;
}

- (NSObject *)removeObjectAtIndex:(NSInteger)idx {
    DualNode *removedNode = nil;
    if (idx == 0) {
        removedNode = self.first;
        if (self.size == 1) {
            self.first = nil;
            self.last = nil;
        } else {
            self.first = removedNode.next;
            self.first.prev = nil;
        }
    } else {
        if (idx == self.size - 1) {
            // 移除链表末尾节点
            removedNode = self.last;
            self.last = self.last.prev;
            self.last.next = nil;
        } else {
            // 移除链表中间节点
            removedNode = [self p_nodeAtIndex:idx];
            removedNode.prev.next = removedNode.next;
            removedNode.next.prev = removedNode.prev;
        }
    }
    
    self.size -= 1;
    return removedNode.data;
}

- (void)clear {
    DualNode *node = self.first;
    for (int i = 0; i < self.size; i++) {
        node.prev = nil;
        node = node.next;
    }
    self.first = nil;
    self.last = nil;
    self.size = 0;
}

- (BOOL)isEmpty {
    return self.size == 0;
}

- (BOOL)contains:(NSObject *)obj {
    DualNode *node = self.first;
    for (int i = 0; i < self.size; i++) {
        if ([node.data isEqual:obj]) {
            return YES;
        }
        node = node.next;
    }
    return NO;
}

//- (NSUInteger)size {
//    return _size;
//}

- (NSString *)description {
    DualNode *node = self.first;
    NSString *desc = [NSString stringWithFormat:@"null_%@_%@",node.data, node.next];
    for (int i = 0; i < self.size - 1; i++) {
        node = node.next;
        desc = [NSString stringWithFormat:@"%@, %@_%@_%@", desc, node.prev, node.data, node.next];
    }
    
    desc = [NSString stringWithFormat:@"%@, %@_%@_null",desc, self.last.prev, self.last.data];
    return desc;
}

#pragma mark - Private

//kSelectorHuge1Bit
- (DualNode *)p_nodeAtIndex:(NSInteger)idx {
    DualNode *node = nil;
    if (idx < (self.size >> 1)) {
        // 前半部分，使用first指针查找
        node = self.first;
        for (NSInteger i = 0; i < idx; i++) {
            node = node.next;
        }
    } else {
        // 后半部分，使用last指针查找
        node = self.last;
        for (NSInteger i = self.size - 1; i > idx; i--) {
            node = node.prev;
        }
    }
    return node;
}
@end

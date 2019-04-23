//
//  DualLinkList.m
//  DualLinkList
//
//  Created by sw on 2019/4/23.
//  Copyright © 2019 WS. All rights reserved.
//

#import "DualLinkList.h"

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

@end

@interface DualLinkList ()
@property(nonatomic) DualNode *first;       // 头结点
@property(nonatomic) DualNode *last;        // 尾节点
@property(nonatomic) NSUInteger size;       // 链表的长度

@end

@implementation DualLinkList

@end

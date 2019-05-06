//
//  Node.m
//  BinaryTree
//
//  Created by sw on 2019/5/6.
//  Copyright © 2019 WS. All rights reserved.
//

#import "Node.h"

@implementation Node
+ (instancetype)nodeWithData:(NSObject *)data parent:(BinarySearchNode *)parent {
    return [[BinarySearchNode alloc] initWithData:data parent:parent];
}

- (instancetype)initWithData:(NSObject *)data parent:(BinarySearchNode *)praent {
    if (self = [super init]) {
        _data = data;
        _parent = _parent;
    }
    return self;
}

- (NSComparisonResult)compare:(BinarySearchNode *)node {
    return [self.data integerValue] > [node.data integerValue];
}
@end

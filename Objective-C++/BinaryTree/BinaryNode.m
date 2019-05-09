//
//  BinaryNode.m
//  BinaryTree
//
//  Created by sw on 2019/5/6.
//  Copyright © 2019 WS. All rights reserved.
//

#import "BinaryNode.h"

@implementation BinaryNode
+ (instancetype)nodeWithData:(NSObject *)data parent:(BinaryNode *)parent {
    return [[self alloc] initWithData:data parent:parent];
}

- (instancetype)initWithData:(NSObject *)data parent:(BinaryNode *)parent {
    if (self = [super init]) {
        _data = data;
        _parent = parent;
    }
    return self;
}

- (NSComparisonResult)compare:(BinaryNode *)node {
    return [(id)self.data integerValue] > [(id)node.data integerValue];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@",self.data];
}
@end

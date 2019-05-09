//
//  Comparer.m
//  BinaryTree
//
//  Created by sw on 2019/5/7.
//  Copyright © 2019 WS. All rights reserved.
//

#import "Comparer.h"
#import "BinaryNode.h"

@implementation Comparer

+ (instancetype)comparer {
    return [[self alloc] init];
}

- (NSComparisonResult)compare:(__autoreleasing id)obj1 with:(__autoreleasing id)obj2 {
    if ([obj1 isKindOfClass:[BinaryNode class]]) {
        obj1 = [(BinaryNode *)obj1 data];
    } else if ([obj2 isKindOfClass:[BinaryNode class]]) {
        obj2 = [(BinaryNode *)obj2 data];
    }
    if ([obj1 isKindOfClass:[NSNumber class]]) {
        NSInteger val1 = [(NSNumber *)obj1 integerValue];
        NSInteger val2 = [(NSNumber *)obj1 integerValue];
        return [self p_compare:val1 with:val2];
    } else if ([obj1 isKindOfClass:[NSString class]]) {
        NSInteger val1 = [(NSString *)obj1 integerValue];
        NSInteger val2 = [(NSString *)obj1 integerValue];
        return [self p_compare:val1 with:val2];
    } else {
        NSAssert(0, @"对象不可比较");
    }
    
    return 0;
}

- (NSComparisonResult)p_compare:(NSInteger)val1 with:(NSInteger)val2 {
    if (val1 > val2) {
        return NSOrderedDescending;
    } else if (val1 < val2) {
        return NSOrderedAscending;
    } else {
        return NSOrderedSame;
    }
}

@end

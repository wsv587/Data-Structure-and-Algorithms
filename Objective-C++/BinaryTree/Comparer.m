//
//  Comparer.m
//  BinaryTree
//
//  Created by sw on 2019/5/7.
//  Copyright © 2019 WS. All rights reserved.
//

#import "Comparer.h"

@implementation Comparer

- (NSComparisonResult)compare:(__autoreleasing id<NSObject> *)obj1 obj:(__autoreleasing id<NSObject> *)obj2 {
    if ([obj1 isKindOfClass:[NSNumber class]]) {
        NSInteger val1 = [(NSNumber *)obj1 integerValue];
        NSInteger val2 = [(NSNumber *)obj1 integerValue];
        if (val1 > val2) {
            return NSOrderedDescending;
        } else if (val1 < val2) {
            return NSOrderedAscending;
        } else {
            return NSOrderedSame;
        }
    } else if ([obj1 isKindOfClass:[NSString class]]) {
        NSInteger val1 = [(NSString *)obj1 integerValue];
        NSInteger val2 = [(NSString *)obj1 integerValue];
        if (val1 > val2) {
            return NSOrderedDescending;
        } else if (val1 < val2) {
            return NSOrderedAscending;
        } else {
            return NSOrderedSame;
        }
    } else {
        NSAssert(0, @"对象不可比较");
    }
    
    return 0；
}

@end

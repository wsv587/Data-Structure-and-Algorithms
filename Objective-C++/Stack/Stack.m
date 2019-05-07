//
//  Stack.m
//  Stack
//
//  Created by sw on 2019/5/7.
//  Copyright © 2019 WS. All rights reserved.
//

#import "Stack.h"

@interface Stack ()
//@property(nonatomic) NSUInteger size;
//@property(nonatomic) NSMutableArray *elements;
@end

@implementation Stack
// 添加元素
- (void)add:(NSObject *)obj {
    self.elements[_size] = obj;
}
// 移除末尾元素
- (void)pop {
    if (self.elements.count <= 0) {
        return;
    }
    [self.elements removeLastObject];
    self.size -= 1;
}
// 是否包含某个元素
- (BOOL)contains:(NSObject *)obj {
    for (int i = 0; i < self.size; i++) {
        if ([self.elements[i] isEqual:obj]) {
            return YES;
        }
    }
    return NO;
}
// 获取栈顶元素
- (NSObject *)top {
    return self.elements[self.size - 1];
}

- (NSMutableArray *)popTo:(NSInteger)idx {
    NSInteger removeCount = self.size - 1 - idx;
    NSMutableArray *removes = [NSMutableArray arrayWithCapacity:removeCount];
    for (NSInteger i = 0; i < removeCount; i++) {
        [removes addObject:[self top]];
        [self pop];
    }
    return removes;
}

// 清空栈
- (void)clear {
    self.elements = nil;
    self.size = 0;
}

// 判断Stack是否为空
- (BOOL)isEmpty {
    return self.size == 0;
}
// 获取Stack的大小
- (NSUInteger)size {
    return _size;
}


@end

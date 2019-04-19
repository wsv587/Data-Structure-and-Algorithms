//
//  Assert.m
//  Objective-C++
//
//  Created by sw on 2019/4/19.
//  Copyright © 2019 WS. All rights reserved.
//

#import "Assert.h"

void assertNil(id obj) {
    assert(obj);
}
void assertBool(BOOL val) {
    assert(val);
}


@implementation Assert
+ (void)assertNil:(id)obj {
    NSAssert(obj, @"空对象异常");
}

+ (void)assertBool:(BOOL)val {
    NSAssert(val, @"表达式结果为false");
}

+ (void)assertArraySize:(NSInteger)size idx:(NSInteger)idx {
    NSAssert(idx >=0 && idx < size, @"数组越界");
}
@end

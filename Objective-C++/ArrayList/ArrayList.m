//
//  ArrayList.m
//  ArrayList
//
//  Created by sw on 2019/4/17.
//  Copyright © 2019 WS. All rights reserved.
//

#import "ArrayList.h"

#define DEFAULT_SIZE 10

@interface ArrayList ()
NSUInteger _size;
NSMUtableArray *_elements;
@end

@implementation ArrayList
+ (instancetype)arraylist {
    return [[ArrayList alloc] init];
}

-(instancetype)init {
    if (self = [super init]) {
        _elements = [NSMutableArray arrayWithCapacity:DEFAULT_SIZE];
        _size = 0;
    }
    return self;
}

- (NSUInteger)size {
    return _size;
}
@end

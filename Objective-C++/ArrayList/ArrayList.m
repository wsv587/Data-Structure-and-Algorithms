//
//  ArrayList.m
//  ArrayList
//
//  Created by sw on 2019/4/17.
//  Copyright © 2019 WS. All rights reserved.
//

#import "ArrayList.h"

#define DEFAULT_SIZE 10
#define ELEMENT_NOT_FOUND -1

@interface ArrayList ()
@property(nonatomic) NSUInteger size;
@property(nonatomic) NSMutableArray *elements;
//NSUInteger _size;
//NSMUtableArray *_elements;
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

- (void)add:(NSObject *)obj {
    if ([self checkNil:obj]) {
        return;
    }
    _elements[_size++] = obj;
}

- (void)remove:(NSObject *)obj atIndex:(NSInteger)idx {
    if ([self checkNil:obj]) {
        return;
    }
    if ([self checkRangeException:idx]) {
        return;
    }
    for (NSInteger i = idx; i < _size - 1; i++) {
        _elements[i] = _elements[i+1];
    }
    // _elements[_size - 1] = nil; // 置空会crash
    [_elements removeLastObject];
    _size -= 1;
}

- (void)insert:(NSObject *)obj atIndex:(NSInteger)idx {
    if ([self checkNil:obj]) {
        return;
    }
    if ([self checkRangeException:idx]) {
        return;
    }
    
    for (NSInteger i = _size; i > idx; i--) { // idx后面所有的元素向后移动一位
        _elements[i] = _elements[i - 1];
    }
    _elements[idx] = obj;
    _size += 1;
}

- (NSObject *)objectAtIndex:(NSInteger)idx {
    if ([self checkRangeException:idx]) {
        return nil;
    }
    return _elements[idx];
}

- (NSInteger)indexOfObject:(NSObject *)obj {
    if ([self checkNil:obj]) {
        return -1;
    }
    for (NSInteger i = 0; i < _size; i++) {
        if ([_elements[i] isEqual:obj]) {
            return i;
        }
    }
    return ELEMENT_NOT_FOUND;
}

- (NSObject *)setObject:(NSObject *)obj atIndex:(NSInteger)idx {
    if ([self checkNil:obj] || [self checkRangeException:idx]) {
        return nil;
    }
    NSObject *oldElement = _elements[idx];
    _elements[idx] = obj;
    return oldElement;
}

- (BOOL)contain:(NSObject *)obj {
    if ([self checkNil:obj]) {
        return NO;
    }
    return [self indexOfObject:obj] != ELEMENT_NOT_FOUND;
}

- (void)clear {
    _elements = [NSMutableArray arrayWithCapacity:DEFAULT_SIZE];
    _size = 0;
}

- (BOOL)isEmpty {
    return _size == 0;
}

- (NSUInteger)size {
    return _size;
}

#pragma mark - Private
- (BOOL)checkNil:(NSObject *)obj {
    if (obj == nil) {
        return YES;
    }
    return NO;
}

- (BOOL)checkRangeException:(NSInteger)idx {
    if (idx < 0 || idx >= _size) {
        return YES;
    }
    return NO;
}
@end

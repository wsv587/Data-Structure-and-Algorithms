//
//  RBNode.m
//  Objective-C++
//
//  Created by wangsong on 2020/10/5.
//  Copyright © 2020 WS. All rights reserved.
//

#import "RBNode.h"

@implementation RBNode

//@synthesize color;

- (BOOL)isRed {
    return self.color == RED;
}

- (BOOL)isBlack {
    return self.color == BLACK;
}

- (RBColor)color {
    return _color;
}

- (void)setColor:(RBColor)color {
    _color = color;
}

- (void)setRed {
    self.color = RED;
}

- (void)setBlack {
    self.color = BLACK;
}


- (RBNode *)sibiling {
    if ([self isLeftChild]) {
        return (RBNode *)self.parent.right;
    } else {
        return (RBNode *)self.parent.left;
    }
    return nil;
}

- (RBNode *)uncle {
    return [(RBNode *)self.parent sibiling];
}

@end

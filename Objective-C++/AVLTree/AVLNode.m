//
//  AVLNode.m
//  Objective-C++
//
//  Created by sw on 2020/9/21.
//  Copyright © 2020 WS. All rights reserved.
//

#import "AVLNode.h"

@implementation AVLNode

- (BOOL)isBalance {
    return ABS(((AVLNode *)self.left).height - ((AVLNode *)self.right).height) <= 1;
}

- (NSInteger)leftTreeHeight {
    return self.left == nil ? 0 : ((AVLNode *)self.left).height;
}

- (NSInteger)rightTreeHeight {
    return self.right == nil ? 0 : ((AVLNode *)self.right).height;
}

- (void)updateHeight {
    self.height = 1 + MAX([self leftTreeHeight], [self rightTreeHeight]);
}

- (NSInteger)factor {
    return [self leftTreeHeight] - [self rightTreeHeight];
}
@end

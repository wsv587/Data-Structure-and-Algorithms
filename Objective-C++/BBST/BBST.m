//
//  BBST.m
//  Objective-C++
//
//  Created by wangsong on 2020/10/5.
//  Copyright © 2020 WS. All rights reserved.
//

#import "BBST.h"

@implementation BBST
- (void)rotateLeft:(BinaryNode *)node {
    BinaryNode *g = node;
    BinaryNode *p = g.right;
    
    g.right = p.left;
    p.left = g;
    
    // 更新各自的parent
    g.right.parent = g;
    p.parent = g.parent;
    g.parent = p;
}

- (void)rotateRight:(BinaryNode *)node {
    BinaryNode *g = node;
    BinaryNode *p = node.left;
    
    g.left = p.right;
    p.right = g;
    
    // 更新各自的parent
    g.left.parent = g;
    p.parent = g.parent;
    g.parent = p;
}
@end

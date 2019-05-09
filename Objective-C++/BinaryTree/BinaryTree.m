//
//  BinaryTree.m
//  BinaryTree
//
//  Created by sw on 2019/5/6.
//  Copyright © 2019 WS. All rights reserved.
//

#import "BinaryTree.h"
#import "Stack.h"

@interface BinaryTree ()
@property(nonatomic) Comparer *comparer;
@end

@implementation BinaryTree
+ (instancetype)treeWithComparer:(Comparer *)comparer {
    return [[BinaryTree alloc] initWithComparer:comparer];
}

- (instancetype)initWithComparer:(Comparer *)comparer {
    if (self = [super init]) {
        self.comparer = comparer;
    }
    return self;
}

- (void)preOrderTraversal:(BinaryNode *)root {
    if (root == nil) {
        return;
    }
    NSLog(@"%@",root.data);
    [self preOrderTraversal:root.left];
    [self preOrderTraversal:root.right];
}

- (void)preOrderTraversalWithoutRecursion:(BinaryNode *)root {
    if (root == nil) {
        return;
    }
    Stack *S = [Stack stack];
    BinaryNode *node = root;
    while (node != nil) {
        NSLog(@"%@",node.data);
        if (node.left != nil) {
            node = node.left;
        } else if (node.right != nil) {
            node = node.right;
        }
    }
}

- (void)inOrderTraversal:(BinaryNode *)root {
    if (root == nil) {
        return;
    }
    [self inOrderTraversal:root.left];
    NSLog(@"%@",root.data);
    [self inOrderTraversal:root.right];
}

- (void)postOrderTraversal:(BinaryNode *)root {
    if (root == nil) {
        return;
    }
    [self postOrderTraversal:root];
    [self postOrderTraversal:root];
    NSLog(@"%@",root.data);
}

- (void)levelOrderTraversal:(BinaryNode *)root {
    if (root == nil) {
        return;
    }
    NSUInteger size = 1;
    // NSMutableArray模拟队列，而实际上Java的队列就是linkedList实现的
    NSMutableArray<BinaryNode *> *queue = [NSMutableArray arrayWithObject:root];
    while (size != 0) {
        BinaryNode *lastBinaryNode = queue.firstObject;
        NSLog(@"%@",lastBinaryNode.data);
        if (lastBinaryNode.left != nil) {
            [queue addObject:lastBinaryNode.left];
        }
        if (lastBinaryNode.right != nil) {
            [queue addObject:lastBinaryNode.right];
        }
        [queue removeObjectAtIndex:0];
        if ((size -= 1) == 0) {
            size = queue.count;
        }
    }
}

- (void)reverse:(BinaryNode *)root {
    if (root == nil) {
        return;
    }
    BinaryNode *temp = root.left;
    root.left = root.right;
    root.right = temp;
    
    [self reverse:root.left];
    [self reverse:root.right];
}

- (NSUInteger)height:(BinaryNode *)root {
    if (root == nil) {
        return 0;
    }
    return 1 + MAX([self height:root.left], [self height:root.right]);
}

-(BOOL)isEmpty {
    return self.size == 0;
}

- (void)clear {
    self.root = nil;
}

@end

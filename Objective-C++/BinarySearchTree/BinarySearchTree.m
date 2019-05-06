//
//  BinarySearchTree.m
//  BinarySearchTree
//
//  Created by sw on 2019/4/28.
//  Copyright © 2019 WS. All rights reserved.
//

#import "BinarySearchTree.h"
#import "BinarySearchNode.h"

@interface BinarySearchTree ()
@property(nonatomic) NSUInteger size;
@property(nonatomic) BinarySearchNode *root;
@end

@implementation BinarySearchTree
+ (instancetype)binarySearchTree {
    return [[BinarySearchTree alloc] init];
}

- (void)add:(NSObject *)data {
    BinarySearchNode *newNode = [BinarySearchNode nodeWithData:data parent:nil];
    if (self.size == 0) {
        self.root = newNode;
    } else {
        BinarySearchNode *node = self.root;
        BinarySearchNode *parent = self.root;
        NSComparisonResult result = NSOrderedSame;
        while (node != nil) {
            if ([node compare:newNode] == NSOrderedDescending) { // node > newNode 查找左子树
                parent = node;
                node = node.left;
                result = NSOrderedDescending;

            } else if ([node compare:newNode] == NSOrderedAscending) { // node < newNode 查找右子树
                parent = node;
                node = node.right;
                result = NSOrderedAscending;
            } else { //相等
                return;
            }
        }
        
        if (result == NSOrderedDescending) {
            parent.left = newNode;
        } else {
            parent.right = newNode;
        }
    }
}

- (void)remove:(NSObject *)data {
    
}

- (void)preOrderTraversal:(BinarySearchNode *)root {
    if (root == nil) {
        return;
    }
    NSLog(@"%@",root.data);
    [self preOrderTraversal:root.left];
    [self preOrderTraversal:root.right];
}

- (void)preOrderTraversalWithoutRecursion:(BinarySearchNode *)root {
    if (root == nil) {
        return;
    }
    BinarySearchNode *node = root;
    while (node != nil) {
        NSLog(@"%@",node.data);
        if (node.left != nil) {
            node = node.left;
        } else if (node.right != nil) {
            node = node.right;
        }
    }
}

- (void)inOrderTraversal:(BinarySearchNode *)root {
    if (root == nil) {
        return;
    }
    [self inOrderTraversal:root.left];
    NSLog(@"%@",root.data);
    [self inOrderTraversal:root.right];
}

- (void)postOrderTraversal:(BinarySearchNode *)root {
    if (root == nil) {
        return;
    }
    [self postOrderTraversal:root];
    [self postOrderTraversal:root];
    NSLog(@"%@",root.data);
}

- (void)levelOrderTraversal:(BinarySearchNode *)root {
    if (root == nil) {
        return;
    }
    NSUInteger size = 1;
    // NSMutableArray模拟队列，而实际上Java的队列就是linkedList实现的
    NSMutableArray<BinarySearchNode *> *queue = [NSMutableArray arrayWithObject:root];
    while (size != 0) {
        BinarySearchNode *lastNode = queue.firstObject;
        NSLog(@"%@",lastNode.data);
        if (lastNode.left != nil) {
            [queue addObject:lastNode.left];
        }
        if (lastNode.right != nil) {
            [queue addObject:lastNode.right];
        }
        [queue removeObjectAtIndex:0];
        if ((size -= 1) == 0) {
            size = queue.count;
        }
    }
}

- (void)reverse:(BinarySearchNode *)root {
    if (root == nil) {
        return;
    }
    BinarySearchNode *temp = root.left;
    root.left = root.right;
    root.right = temp;
    
    [self reverse:root.left];
    [self reverse:root.right];
}

- (NSUInteger)height:(BinarySearchNode *)root {
    if (root == nil) {
        return 0;
    }
    return 1 + MAX([self height:root.left], [self height:root.right]);
}
@end
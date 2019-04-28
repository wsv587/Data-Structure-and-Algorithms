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

@end

//
//  BinarySearchTree.m
//  BinarySearchTree
//
//  Created by sw on 2019/4/28.
//  Copyright © 2019 WS. All rights reserved.
//

#import "BinarySearchTree.h"
#import "BinaryNode.h"

@implementation BinarySearchTree

- (void)add:(NSObject *)data {
    BinaryNode *newNode = [BinaryNode nodeWithData:data parent:nil];
    if (self.size == 0) {
        self.root = newNode;
    } else {
        BinaryNode *node = self.root;
        BinaryNode *parent = self.root;
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

- (BOOL)contains:(NSObject *)data {
    return [self node:data] != nil;
}

- (BinaryNode *)node:(NSObject *)data {
    BinaryNode *node = self.root;
    while (node != nil) {
        if ([node.data isEqual:data]) {
            return node;
        }
//        if (node.data == compar) {
//            <#statements#>
//        }
    }
    return nil;
}
@end

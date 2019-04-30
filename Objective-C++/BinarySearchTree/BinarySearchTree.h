//
//  BinarySearchTree.h
//  BinarySearchTree
//
//  Created by sw on 2019/4/28.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BinarySearchNode;

@interface BinarySearchTree : NSObject
@property(nonatomic, readonly) NSUInteger size;
@property(nonatomic, readonly) BinarySearchNode *root;

+ (instancetype)binarySearchTree;
- (void)add:(NSObject *)data;

- (void)remove:(NSObject *)data;
/**
 * 前序遍历
 */
- (void)preOrderTraversal:(BinarySearchNode *)root;
/**
 * 中序遍历
 */
- (void)inOrderTraversal:(BinarySearchNode *)root;
/**
 * 后序遍历
 */
- (void)postOrderTraversal:(BinarySearchNode *)root;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
@end

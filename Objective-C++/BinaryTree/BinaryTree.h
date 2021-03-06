//
//  BinaryTree.h
//  BinaryTree
//
//  Created by sw on 2019/5/6.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinaryNode.h"
#import "Comparer.h"

@interface BinaryTree : NSObject
@property(nonatomic) NSUInteger size;
@property(nonatomic) BinaryNode *root;
@property(nonatomic, readonly) Comparer *comparer;
/**
 * 创建一棵空数
 */
+ (instancetype)treeWithComparer:(Comparer *)comparer;
/**
 * 前序遍历
 */
- (void)preOrderTraversal:(BinaryNode *)root;
- (void)preOrderTraversalWithoutRecursion:(BinaryNode *)root;
/**
 * 中序遍历
 */
- (void)inOrderTraversal:(BinaryNode *)root;
- (void)inOrderTraversalWithoutRecursion:(BinaryNode *)root;

/**
 * 后序遍历
 */
- (void)postOrderTraversal:(BinaryNode *)root;
- (void)postOrderTraversalWithoutRecursion:(BinaryNode *)root;

/**
 * 层序遍历
 */
- (void)levelOrderTraversal:(BinaryNode *)root;
/**
 * 翻转二叉树 （可采用前序、中序、后序遍历和层序遍历）
 */
- (void)reverse:(BinaryNode *)root;
/**
 * 求一棵树的高度
 */
- (NSUInteger)height:(BinaryNode *)root;
/**
 * 是否为空树
 */
- (BOOL)isEmpty;
/**
 * 清空树
 */
- (void)clear;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
@end

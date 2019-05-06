//
//  BinaryTree.h
//  BinaryTree
//
//  Created by sw on 2019/5/6.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BinaryNode;

@interface BinaryTree : NSObject
@property(nonatomic) NSUInteger size;
@property(nonatomic) BinaryNode *root;
/**
 * 创建一棵空数
 */
+ (instancetype)tree;
/**
 * 添加元素
 */
- (void)add:(NSObject *)data;
/**
 * 删除元素
 */
- (void)remove:(NSObject *)data;
/**
 * 前序遍历
 */
- (void)preOrderTraversal:(BinaryNode *)root;
/**
 * 中序遍历
 */
- (void)inOrderTraversal:(BinaryNode *)root;
/**
 * 后序遍历
 */
- (void)postOrderTraversal:(BinaryNode *)root;
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
/**
 * 是否包含某个元素
 */
- (BOOL)contains:(NSObject *)data;

//+ (instancetype)new NS_UNAVAILABLE;
//- (instancetype)init NS_UNAVAILABLE;
@end

//
//  BBST.h
//  Objective-C++
//
//  Created by wangsong on 2020/10/5.
//  Copyright © 2020 WS. All rights reserved.
//

#import "BinarySearchTree.h"

NS_ASSUME_NONNULL_BEGIN
/**
 *  balance binary search tree 平衡二叉搜索树
 *  这个类继承自二叉搜索树，主要扩展了旋转的功能
 */
@interface BBST : BinarySearchTree

- (void)rotateLeft:(BinaryNode *)node;
- (void)rotateRight: (BinaryNode *)node;

@end

NS_ASSUME_NONNULL_END

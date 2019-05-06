//
//  BinarySearchTree.h
//  BinarySearchTree
//
//  Created by sw on 2019/4/28.
//  Copyright © 2019 WS. All rights reserved.
//

#import "BinaryTree.h"

@interface BinarySearchTree : BinaryTree
+ (instancetype)binarySearchTree;

- (void)add:(NSObject *)data;

- (void)remove:(NSObject *)data;
//+ (instancetype)new NS_UNAVAILABLE;
//- (instancetype)init NS_UNAVAILABLE;
@end

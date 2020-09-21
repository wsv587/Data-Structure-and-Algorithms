//
//  BinarySearchTree.h
//  BinarySearchTree
//
//  Created by sw on 2019/4/28.
//  Copyright © 2019 WS. All rights reserved.
//

#import "BinaryTree.h"

@interface BinarySearchTree : BinaryTree
- (void)add:(NSObject *)data;
- (void)remove:(NSObject *)data;
- (BOOL)contains:(NSObject *)data;

- (void)remove3:(NSObject *)data;
@end

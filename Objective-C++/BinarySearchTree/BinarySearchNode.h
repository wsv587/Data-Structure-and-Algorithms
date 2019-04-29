//
//  BinarySearchNode.h
//  BinarySearchTree
//
//  Created by sw on 2019/4/28.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinarySearchNode : NSObject
@property(nonatomic) NSObject *data;
@property(nonatomic) BinarySearchNode *parent;
@property(nonatomic) BinarySearchNode *left;
@property(nonatomic) BinarySearchNode *right;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)nodeWithData:(NSObject *)data parent:(BinarySearchNode *)parent;

- (instancetype)initWithData:(NSObject *)data parent:(BinarySearchNode *)praent;
// 节点的数据必须是可以比较大小的，比如NSNumber
- (NSComparisonResult)compare:(BinarySearchNode *)node;
@end

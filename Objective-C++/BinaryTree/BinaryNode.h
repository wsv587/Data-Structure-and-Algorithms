//
//  BinaryNode.h
//  BinaryTree
//
//  Created by sw on 2019/5/6.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinaryNode : NSObject
@property(nonatomic) NSObject *data;
@property(nonatomic) BinaryNode *parent;
@property(nonatomic) BinaryNode *left;
@property(nonatomic) BinaryNode *right;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)nodeWithData:(NSObject *)data parent:(BinaryNode *)parent;

- (instancetype)initWithData:(NSObject *)data parent:(BinaryNode *)praent;
// 节点的数据必须是可以比较大小的，比如NSNumber
- (NSComparisonResult)compare:(BinaryNode *)node;
@end

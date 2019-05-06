//
//  Node.h
//  BinaryTree
//
//  Created by sw on 2019/5/6.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject
@property(nonatomic) NSObject *data;
@property(nonatomic) Node *parent;
@property(nonatomic) Node *left;
@property(nonatomic) Node *right;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)nodeWithData:(NSObject *)data parent:(Node *)parent;

- (instancetype)initWithData:(NSObject *)data parent:(Node *)praent;
// 节点的数据必须是可以比较大小的，比如NSNumber
- (NSComparisonResult)compare:(Node *)node;
@end

NS_ASSUME_NONNULL_END

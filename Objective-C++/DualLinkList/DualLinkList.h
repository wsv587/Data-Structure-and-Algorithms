//
//  DualLinkList.h
//  DualLinkList
//
//  Created by sw on 2019/4/23.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>
// 双向链表节点
NS_ASSUME_NONNULL_BEGIN

@interface DualNode: NSObject
@property(nonatomic, readonly) DualNode *next;
@property(nonatomic, readonly) DualNode *prev;
@property(nonatomic, readonly) NSObject *data;
@end

// 双向链表
@interface DualLinkList : NSObject
@property(nonatomic, readonly) NSUInteger size;     // 链表的长度

// 初始化操作
+ (instancetype)linklist;

// 基本的增删改查操作
// 添加元素
- (void)add:(NSObject *)obj;
// 移除末尾元素
- (void)pop;
// 移除指定元素
- (void)removeObject:(NSObject *)obj;
// 移除某个索引下的元素，然后返回移除的元素
- (NSObject *)removeObjectAtIndex:(NSInteger)idx;
// 插入元素
- (void)insert:(NSObject *)obj atIndex:(NSInteger)idx;
// 获取某个索引下的元素
- (NSObject *)objectAtIndex:(NSInteger)idx;
// 获取元素的索引
- (NSInteger)indexOfObject:(NSObject *)obj;
// 更新某个索引下的元素
- (NSObject *)setObject:(NSObject *)obj atIndex:(NSInteger)idx;
// 是否包含某个元素
- (BOOL)contains:(NSObject *)obj;

// 清空ArrayList
- (void)clear;

// 判断ArrayList是否为空
- (BOOL)isEmpty;
// 获取ArrayList的大小
- (NSUInteger)size;
@end

NS_ASSUME_NONNULL_END

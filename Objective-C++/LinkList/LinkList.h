//
//  LinkList.h
//  LinkList
//
//  Created by sw on 2019/4/19.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>

// 定义Node私有类（Java中叫内部类）
// 此处为了能够在category中访问，所以未把Node定义为私有类
@interface Node : NSObject
@property(nonatomic) id data;       // 节点存储的数据
@property(nonatomic) Node *next;    // 节点指向的后继节点

@end

@interface LinkList : NSObject
@property(nonatomic) Node *first;                   // 链表的头结点，此处设置为k读写是为了在category中可访问
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

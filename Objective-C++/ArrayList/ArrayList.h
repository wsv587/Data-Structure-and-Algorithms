//
//  ArrayList.h
//  ArrayList
//
//  Created by sw on 2019/4/17.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>

/* 仿Java的ArrayList */
// Java中有ArraylList和LinkList，其中ArrayList底层是顺序表，内存地址是连续的空间，LinkList底层是单链表，内存地址可以不连续。

@interface ArrayList : NSObject

// 基本的增删改查操作
// 添加元素
- (void)add:(NSObject *)obj;
// 移除末尾元素
- (void)pop:(NSObject *)obj;
// 移除所有这个元素
- (void)remove:(NSObject *)obj;
// 移除某个索引下的元素
- (void)remove:(NSObject *)obj atIndex:(NSInteger)idx;
// 插入元素
- (void)insert:(NSObject *)obj atIndex:(NSInteger)idx;
// 获取某个索引下的元素
- (NSObject *)objectAtIndex:(NSInteger)idx;
// 获取元素的索引
- (NSInteger)indexOfObject:(NSObject *)obj;
// 更新某个索引下的元素
- (void)setObject:(NSObject *)obj atIndex:(NSInteger)idx;
// 清空ArrayList
- (void)clear;

// 判断ArrayList是否为空
- (BOOL)isEmpty;
// 获取ArrayList的大小
- (NSUnteger)size;
@end

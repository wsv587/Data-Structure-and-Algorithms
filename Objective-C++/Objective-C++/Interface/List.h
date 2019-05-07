//
//  List.h
//  Objective-C++
//
//  Created by sw on 2019/5/7.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol List <NSObject>
@optional
// 当前元素个数
//@property(nonatomic) NSUInteger size;
//// 元素
//@property(nonatomic) NSMutableArray *elements;
// 基本的增删改查操作
// 添加元素
- (void)add:(NSObject *)obj;
// 移除末尾元素
- (void)pop;
// 移除指定元素
- (void)removeObject:(NSObject *)obj;
// 移除某个索引下的元素
- (void)removeObjectAtIndex:(NSInteger)idx;
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
// 获取栈顶元素
- (NSObject *)top;
// pop到栈的指定位置 返回出栈的元素
- (NSMutableArray *)popTo:(NSInteger)idx;
@end


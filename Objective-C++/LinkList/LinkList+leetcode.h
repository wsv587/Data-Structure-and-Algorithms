//
//  LinkList+leetcode.h
//  LinkList
//
//  Created by sw on 2019/4/22.
//  Copyright © 2019 WS. All rights reserved.
//

#import "LinkList.h"

NS_ASSUME_NONNULL_BEGIN

@interface LinkList (leetcode)
/**
 * 递归反转单链表
 */
- (Node *)reverseUsingRecursion:(Node *)head;
/**
 * 非递归反转单链表
 */
- (Node *)reverseUnusingRecursion:(Node *)head;

/**
 * 判断一个单链表是否有环
 */
- (BOOL)isCircleLinkList:(Node *)head;
@end

NS_ASSUME_NONNULL_END

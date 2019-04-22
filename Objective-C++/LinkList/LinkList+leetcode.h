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
- (void)reverseUnusingRecursion;
@end

NS_ASSUME_NONNULL_END

//
//  LinkList+leetcode.m
//  LinkList
//
//  Created by sw on 2019/4/22.
//  Copyright © 2019 WS. All rights reserved.
//

#import "LinkList+leetcode.h"

@implementation LinkList (leetcode)

//first -> node1 -> node2 -> node3 -> node4
//         node1 <- node2 <- node3 <- node4
//first -> node4 -> node3 -> node2 -> node1
- (Node *)reverseUsingRecursion:(Node *)head {
    if (head == nil || head.next == nil) {
        return head;
    }
    Node *newHead = [self reverseUsingRecursion:head.next];
    head.next.next = head;
    head.next = nil;
    return newHead;
}

- (void)reverseUnusingRecursion {
    
}

@end

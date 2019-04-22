//
//  LinkList+leetcode.m
//  LinkList
//
//  Created by sw on 2019/4/22.
//  Copyright © 2019 WS. All rights reserved.
//

#import "LinkList+leetcode.h"

@implementation LinkList (leetcode)

//first -> node1 -> node2 -> node3 -> node4 -> nil
//  nil <- node1 <- node2 <- node3 <- node4 <- first
//first -> node4 -> node3 -> node2 -> node1 -> nil
//1, 2, 3, 4, 5, 6
- (Node *)reverseUsingRecursion:(Node *)head {
    if (head == nil || head.next == nil) {
        return head;
    }
    Node *newHead = [self reverseUsingRecursion:head.next];
    head.next.next = head;
    head.next = nil;
    return newHead;
}

- (Node *)reverseUnusingRecursion:(Node *)head {
    if (head == nil || head.next == nil) {
        return head;
    }
    Node *newHead = nil;
    Node *tmp = nil;
    while (head != nil) {
        tmp = head.next;
        head.next = newHead;
        newHead = head;
        head = tmp;
    }
    return newHead;
}

- (BOOL)isCircleLinkList:(Node *)head {
    if (head == nil) {
        return NO;
    }
    Node *slow = head;
    Node *fast = head.next;
    while (fast != nil && fast.next != nil) {
        slow = slow.next;
        fast = fast.next.next;
        if (slow == fast) {
            return YES;
        }
    }
    return NO;
}
@end

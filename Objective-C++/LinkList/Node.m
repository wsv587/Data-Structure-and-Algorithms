//
//  Node.m
//  Objective-C++
//
//  Created by sw on 2019/4/25.
//  Copyright © 2019 WS. All rights reserved.
//

#import "Node.h"

@implementation Node
+ (instancetype)nodeWithData:(NSObject *)data next:(Node *)next {
    Node *node = [[Node alloc] init];
    node.data = data;
    node.next = next;
    return node;
}

@end

//
//  Node.h
//  Objective-C++
//
//  Created by sw on 2019/4/25.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>

// 可以定义Node为LinkList的私有类（Java中叫内部类）
// 此处为了能够在category中访问，所以未把Node定义为私有类
@interface Node : NSObject
@property(nonatomic) id data;       // 节点存储的数据
@property(nonatomic) Node *next;    // 节点指向的后继节点

+ (instancetype)nodeWithData:(NSObject *)data next:(Node *)next;
@end

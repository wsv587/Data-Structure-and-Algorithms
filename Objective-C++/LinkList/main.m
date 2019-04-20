//
//  main.m
//  LinkList
//
//  Created by sw on 2019/4/19.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        LinkList *list = [LinkList linklist];
        [list add:@"1"];
        NSLog(@"list：%@，size：%ld",list, list.size);
        [list add:@"2"];
        NSLog(@"list:%@，size：%ld",list, list.size);
        [list add:@"3"];
        NSLog(@"list:%@，size：%ld",list, list.size);
        [list add:@"4"];
        NSLog(@"list:%@，size：%ld",list, list.size);
        
        [list insert:@"0" atIndex:0];
        NSLog(@"list:%@，size：%ld",list, list.size);
        [list insert:@"0" atIndex:2];
        NSLog(@"list:%@，size：%ld",list, list.size);
        [list insert:@"6" atIndex:6];
        NSLog(@"list:%@，size：%ld",list, list.size);
        [list removeObject:@"0"];
        NSLog(@"list:%@，size：%ld",list, list.size);
        [list removeObject:@"0"];
        NSLog(@"list:%@，size：%ld",list, list.size);
        
        [list pop];
        NSLog(@"list:%@，size：%ld",list, list.size);
        
        
        NSLog(@"是否包含：%d",[list contains:@"1"]);
        
        [list clear];
        NSLog(@"清空链表：%@", list);
        
        NSLog(@"是否为空：%d", [list isEmpty]);
    }
    return 0;
}

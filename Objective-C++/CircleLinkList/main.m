//
//  main.m
//  CircleLinkList
//
//  Created by sw on 2019/4/25.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CircleLinkList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        CircleLinkList *list = [CircleLinkList linklist];
        [list add:@"1"];
        [list add:@"3"];
        [list add:@"4"];
        [list insert:@"0" atIndex:0];
        [list insert:@"2" atIndex:2];
        [list insert:@"5" atIndex:5];
        
        [list removeObject:@"0"];
        [list removeObjectAtIndex:0];
        [list removeObjectAtIndex:3];
        NSLog(@"%@",list);

    }
    return 0;
}


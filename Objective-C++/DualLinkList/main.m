//
//  main.m
//  DualLinkList
//
//  Created by sw on 2019/4/23.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DualLinkList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        DualLinkList *list = [DualLinkList linklist];
        [list add:@"1"];
        [list add:@"3"];
        [list add:@"4"];
        NSLog(@"%@",list);
        [list insert:@"2" atIndex:1];
        NSLog(@"%@",list);
        [list insert:@"0" atIndex:0];
        NSLog(@"%@",list);
        [list insert:@"5" atIndex:5];
        
//        [list removeObjectAtIndex:0];
//        NSLog(@"%@",list);
        [list removeObjectAtIndex:5];
        NSLog(@"%@",list);

//        [list clear];
        NSLog(@"%@", list);


//        int i, a[3];
//        for (i = 0; i <= 3; i++) {
//            a[i] = 0;
//        }
//
    }
    return 0;
}




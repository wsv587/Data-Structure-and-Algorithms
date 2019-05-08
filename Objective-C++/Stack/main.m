//
//  main.m
//  Stack
//
//  Created by sw on 2019/5/7.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stack.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Stack *stack = [Stack stack];
        [stack add:@"1"];
        [stack add:@"2"];
        [stack add:@"3"];
        [stack add:@"4"];
        [stack add:@"5"];
        NSLog(@"%@",stack);
        [stack pop];
        NSLog(@"%@",stack);
        NSLog(@"%@",[stack top]);

    


    }
    return 0;
}

//
//  main.m
//  SwapTwoValue
//
//  Created by sw on 2019/4/17.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>

/* 交换两个变量的值 */

void swap1(int, int);
void swap2(int, int);
void swap3(int, int);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int val1 = 10;
        int val2 = 20;
        swap1(val1, val2);
        swap2(val1, val2);
        swap3(val1, val2);
    }
    return 0;
}
// 临时变量方式
void swap1(int val1, int val2) {
    int temp = val1;
    val1 = val2;
    val2 = temp;
    NSLog(@"%d,%d", val1, val2);
}
// 数学方法方式
void swap2(int val1, int val2) {
    val1 = val1 - val2;
    val2 = val1 + val2;
    val1 = val2 - val1;
    NSLog(@"%d, %d", val1, val2);
}
// 按位异或方式
void swap3(int val1, int val2) {
    val1 = val1 ^ val2;
    val2 = val1 ^ val2;
    val1 = val1 ^ val2;
    NSLog(@"%d, %d", val1, val2);
}

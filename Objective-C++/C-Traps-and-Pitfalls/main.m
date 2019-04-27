//
//  main.m
//  C-Traps-and-Pitfalls
//
//  Created by sw on 2019/4/27.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>
int operator();

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int (*operatorPtr)(void) = operator;
        (*operatorPtr)(); // 可简写为 operatorPtr();
        
        unsigned long num = -1;
        printf("%d",num);
    }
    return 0;
}

// 下面这些操作表达式会输出什么？为什么？
int operator() {
    // 以下每个语句打印的结果分别是多少？
    // “词法分析器” 分析程序语句时遇到多字符符号时会依照词法分析中的“贪心法”，尽可能多的读入字符，直到读入的字符不能组成一个符号为止。且在读取的过程中会忽略空格。依照这个原则：
    // a---b 等同于 a-- -b 等同于 a -- - b
    // a- --b 等同于 a - --b 等同于 a - -- b
    int a = 10, b = 5;
    printf("a---b = %d\n", a---b);
    a = 10; b = 5;
    printf("a-- -b = %d\n", a-- -b);
    a = 10; b = 5;
    printf("a -- - b = %d\n", a -- - b);
    a = 10; b = 5;
    printf("a- --b = %d\n", a- --b);
    a = 10; b = 5;
    printf("a - --b = %d\n", a - --b);
    a = 10; b = 5;
    printf("a - -- b = %d\n", a - -- b);
    
    return 1;
}

// 下面这段程序会输出什么？为什么？
// 因为size 和 i 都是int类型，i= 0 ，i< size - 1 => i < -1 所以不会满足for循环语句的条件，故而不会打印任何东西
int sameDataType() {
    int size = 0;
    for (int i = 0; i < size - 1; i++) {
        NSLog(@"print...");
    }
    return 0;
}

// 下面这段程序又会输出什么？为什么？
// 因为size是无符号长整型，而i是int类型。类型不匹配,(int i = 0; i < size - 1; i++) 相当于(int i = 0;; i++)，故而会无线循环打印下去
int diffDataType() {
    unsigned long size = 0;
    for (int i = 0; i < size - 1; i++) {
        NSLog(@"print...");
    }
    return 0;
}

// 悬挂 else 问题
// 了解悬挂else的危害以及了解条件分支语句{}的重要性，避免省略if后面的{}
int hangElse() {
    if (true)
        if (true) {
            printf("true_true");
        }
    else {
        printf("second else");
    }
    return 0;
}

//
//  main.m
//  Base-C
//
//  Created by sw on 2019/4/27.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>
int baseC();

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int (*baseCptr)(void) = baseC;
        (*baseCptr)(); // 可简写为 baseCptr();
    }
    return 0;
}

int baseC() {
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

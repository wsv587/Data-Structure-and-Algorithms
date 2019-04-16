//
//  main.m
//  Fibonacci
//
//  Created by sw on 2019/4/17.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>

int fib(int);
int fib2(int);
int fib3(int);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        printf("%d\n",fib(9));
        printf("%d\n",fib2(9));
        printf("%d\n",fib3(9));
    }
    return 0;
}

// 数组方式实现 空间换时间
int fib3(int n) {
    if (n < 0) {
        return -1;
    } else if (n == 0) {
        return 0;
    } else if (n == 1 || n == 2) {
        return 1;
    }
    int fibArr[n+1];
    fibArr[0] = 0;
    fibArr[1] = fibArr[2] = 1;
    
    for (int i = 3; i <= n; i++) {
        fibArr[i] = fibArr[i - 2] + fibArr[i - 1];
    }
    return fibArr[n];
}

// for循环 临时变量方式实现 最高效
int fib2(int x) {
    if (x  < 0) {
        return - 1;
    } else if (x  == 0) {
        return 0;
    } else if (x  == 1 || x  == 2) {
        return 1;
    }
    
    int a,b,c;
    for (int i = 0; i < x; i++) {
        if (i == 0) {
            a = 0;
            b = 0;
        } else if (i == 1 || i == 2) {
            a = 1;
            b = 1;
        } else {
            c = a + b;
            a = b;
            b = c;
        }
    }
    return a + b;
}

// 递归方式实现 最低效
int fib(int n) {
    
    if (n < 0) {
        return -1;
    } else if (n <= 1) {
        return n;
    } else {
        return fib(n - 1) + fib(n - 2);
    }
}

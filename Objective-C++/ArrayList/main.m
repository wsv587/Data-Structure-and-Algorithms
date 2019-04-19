//
//  main.m
//  ArrayList
//
//  Created by sw on 2019/4/17.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArrayList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ArrayList *list = [ArrayList arraylist];
        [list add:@"1"];
        [list add:@"2"];
        [list add:@3];
        NSLog(@"list: %@, size: %ld", list, list.size);
        [list insert:@666 atIndex:1];
        NSLog(@"list: %@, size: %ld", list, list.size);
        [list removeObject:@3];
        NSLog(@"list: %@, size: %ld", list, list.size);
    }
    return 0;
}

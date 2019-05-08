//
//  Stack.h
//  Stack
//
//  Created by sw on 2019/5/7.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "List.h"

@interface Stack : NSObject<List>
@property(nonatomic) NSUInteger size;
@property(nonatomic) NSMutableArray *elements;

+ (instancetype)stack;
@end

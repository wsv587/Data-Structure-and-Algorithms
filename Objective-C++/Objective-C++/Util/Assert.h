//
//  Assert.h
//  Objective-C++
//
//  Created by sw on 2019/4/19.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>

void assertNil(id obj);
void assertBool(BOOL val);

@interface Assert : NSObject
+ (void)assertNil:(id)obj;
+ (void)assertBool:(BOOL)val;
+ (void)assertArraySize:(NSInteger)size idx:(NSInteger)idx;
@end


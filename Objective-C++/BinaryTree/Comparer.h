//
//  Comparer.h
//  BinaryTree
//
//  Created by sw on 2019/5/7.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comparer : NSObject
+ (instancetype)comparer;
- (NSComparisonResult)compare:(id)obj1 with:(id)obj2;
@end

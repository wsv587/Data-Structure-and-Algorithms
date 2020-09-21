//
//  AVLNode.h
//  Objective-C++
//
//  Created by sw on 2020/9/21.
//  Copyright © 2020 WS. All rights reserved.
//

#import "BinaryNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface AVLNode : BinaryNode
@property (nonatomic, assign) NSInteger height; // 节点的高度
@property (nonatomic, assign) NSInteger factor; // 节点的平衡因子

- (void)updateHeight;
- (BOOL)isBalance;
@end

NS_ASSUME_NONNULL_END

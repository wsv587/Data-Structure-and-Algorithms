//
//  RBNode.h
//  Objective-C++
//
//  Created by wangsong on 2020/10/5.
//  Copyright © 2020 WS. All rights reserved.
//

#import "BinaryNode.h"

NS_ASSUME_NONNULL_BEGIN
typedef BOOL RBColor;
static RBColor RED = YES;
static RBColor BLACK = NO;



@interface RBNode : BinaryNode
{
    RBColor _color;
}

//@property(nonatomic) RBColor color;

/**
 * 获取颜色
 */
- (BOOL)isRed;
- (BOOL)isBlack;
- (RBColor)color;

/**
 * 设置颜色
 */
- (void)setRed;
- (void)setBlack;
- (void)setColor:(RBColor)color;

/**
 * 获取兄弟
 */
- (RBNode *)sibiling;
/**
 * 获取叔父节点
 */
- (RBNode *)uncle;
@end

NS_ASSUME_NONNULL_END

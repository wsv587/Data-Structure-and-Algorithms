//
//  AVLTree.m
//  Objective-C++
//
//  Created by sw on 2020/9/21.
//  Copyright © 2020 WS. All rights reserved.
//

#import "AVLTree.h"

@implementation AVLTree
- (BinaryNode *)add:(NSObject *)data {
    AVLNode *node = (AVLNode *)[super add: data];
    node.height = 1;
    [self afterAdd:node];
    return node;
}

/**
 * 新添加的一定是叶子节点，叶子节点的高度是1.
 * 如果失衡也是添加的叶子节点导致的, 所以从添加的叶子节点开始递归向上查找失衡节点, 知道根节点
 * 找到失衡节点进行左旋转、右旋转操作
 * 如果当前节点未失衡则顺便更新下节点的高度和平衡因子
 */
- (void)afterAdd:(AVLNode *)node {
    while ((node = (AVLNode *)node.parent)) {
        if ([self isBalance:node]) {
            [node updateHeight];
        } else {
            [self rebalance:node];
        }
    }
}

/**
 * 恢复平衡
 * node: 失衡节点 也就是g节点
 如何判断LL、RR、LR、RL？
 1.先判断g节点（失衡节点）是L还是R?
 想知道是L、R其实就看g节点（也就是失衡节点）的失衡因子就是知道了。即g节点平衡因子 = g节点的左子树的高度 — g节点右子树的高度。平衡因子为正数说明左子树高属于L，否则右子树高属于R.
 2.然后判断是p节点（父节点也是失衡节点的子节点）是L还是R？
 在上面的基础上，求得是L或R，就可以根据L或R求p节点（失衡节点的L或R子节点）的平衡因子。即p节点平衡因子 = p节点的左子树高度 —p节点的右子树高度。平衡因子为正数说明左子树高属于L，否则右子树高属于R.
 综合一二步的结果就可以组合成LL、RR、LR、RL
 */
- (void)rebalance:(AVLNode *)node {
    AVLNode *gNode= node;
    if (gNode.factor > 0) { // L
        AVLNode *pNode = (AVLNode *)gNode.left;
        if (pNode.factor > 0) { // LL
            [self rotateRight:gNode];
        } else { // LR
            [self rotateLeft:pNode];
            [self rotateRight:gNode];
        }
    } else { // R
        AVLNode *pNode = (AVLNode *)gNode.right;
        if (pNode.factor > 0) { // RL
            [self rotateRight:pNode];
            [self rotateLeft:gNode];
        } else { // RR
            [self rotateLeft:gNode];
        }
    }
}

- (void)rotateLeft:(AVLNode *)node {
    AVLNode *p = (AVLNode *)node.right;
    AVLNode *g = node;
    g.right = p.left;
    p.left = g;
    
    // 更新parent
    g.right.parent = g;
    p.parent = g.parent;
    g.parent = p;

}

- (void)rotateRight:(AVLNode *)node {
    AVLNode *p = (AVLNode *)node.left;
    AVLNode *g = node;
    g.left = p.right;
    p.right = g;
    
    // 更新parent
    g.left.parent = g;
    p.parent = g.parent;
    g.parent = p;
}

- (BOOL)isBalance:(AVLNode *)node {
    return [node isBalance];
}
@end

//
//  RBTree.m
//  Objective-C++
//
//  Created by wangsong on 2020/10/5.
//  Copyright © 2020 WS. All rights reserved.
//

#import "RBTree.h"



@implementation RBTree

- (void)afterAdd:(RBNode *)node {
    // 默认添加的节点的颜色置成红色
    node.color = RED;
    RBNode *parent = (RBNode *)node.parent;
    RBNode *grand = (RBNode *)parent.parent;
    RBNode *uncle = (RBNode *)[node uncle];
    
    // 添加的节点是根节点,染成黑色即可
    if (node.parent == nil) {
        [node setBlack];
        return;
    }
    // 父节点是黑色则直接返回
    if ([(RBNode *)node.parent isBlack]) {
        return;
    }
    // 下面的代码处理的都是父节点是红色的情况（8种场景）
    // uncle是黑色
    if ([self isBlack:uncle]) {
        [grand setRed];
        if ([node.parent isLeftChild]) { // L
            if ([node isLeftChild]) { // LL
                // parent染黑, grand染红
                [parent setBlack];
                // [grand setRed];
                // [self rotateRight:grand];
            } else { // LR
                // 自己染黑、grand染红
                [node setBlack];
                // [grand setRed];
                [self rotateLeft:parent];
                // [self rotateRight:grand];
            }
            [self rotateRight:grand];
        } else { // R
            if ([node isLeftChild]) { // RL
                // 自己染黑、grand染红
                [node setBlack];
                // [grand setRed];
                [self rotateRight:parent];
                // [self rotateLeft:grand];
            } else { // RR
                // parent染黑, grand染红
                [parent setBlack];
                // [grand setRed];
                // [self rotateLeft:grand];
            }
            [self rotateLeft:grand];
        }
    } else { // uncle是红色(上溢)
        [parent setBlack];
        [uncle setBlack];
        [grand setRed];
        [self afterAdd:grand];
    }
    
}

- (void)afterRemove:(RBNode *)node replacement:(RBNode *)replacement {
    // 删除red节点：直接删除即可
    if ([node isRed]) {
        return;
    }
    // 用于取代node的子节点是红色
    if ([replacement isRed]) {
        [replacement setBlack];
        return;
    }
    RBNode *parent = (RBNode *)node.parent;
    // 到这里删除的节点都是black
    if (parent == nil) { // 删除的是根节点
        return;
    }
    // 删除的是黑色叶子节点【下溢】
    // 判断被删除的节点是左还是右
    BOOL isLeft = parent.left == nil || [node isLeftChild]; // [node isLeftChild]为了应付递归调用
    RBNode *sibiling = (RBNode *)(isLeft ? parent.right : parent.left);
    if (isLeft) { // 被删除的节点在左边，兄弟在右边
        if ([sibiling isRed]) { // 红兄弟
            [sibiling setBlack];
            [parent setRed];
            [self rotateLeft:parent];
            // 更换兄弟
            sibiling = (RBNode *)parent.right;
        }
        
        // 兄弟节点必然是黑色
        if ([(RBNode *)sibiling.left isBlack] && [(RBNode *)sibiling.right isBlack]) {
            // 兄弟节点没有一个红色子节点，父节点要向下跟兄弟节点合并
            BOOL parentBlack = [parent isBlack];
            [parent setBlack];
            [sibiling setRed];
            if (parentBlack) {
                [self afterRemove:parent replacement:nil];
            }
        } else {// 兄弟节点至少有一个红色子节点，向兄弟节点借元素
            // 兄弟节点的右边是黑色，兄弟要先旋转
            if ([(RBNode *)sibiling.right isBlack]) {
                [self rotateRight:sibiling];
                sibiling = (RBNode *)parent.right;
            }
            [sibiling setColor:[parent color]];
            [(RBNode *)sibiling.right setBlack];
            [parent setBlack];
            [self rotateLeft:parent];
        }
    } else { // 被删除的节点在右边，兄弟在左边
        if ([sibiling isRed]) { // 红兄弟
            [sibiling setBlack];
            [parent setRed];
            [self rotateRight:parent];
            // 更换兄弟
            sibiling = (RBNode *)parent.left;
        }
            
        // 兄弟节点必然是黑色
        if ([(RBNode *)sibiling.left isBlack] && [(RBNode *)sibiling.right isBlack]) {
            // 兄弟节点没有一个红色子节点，父节点要向下跟兄弟节点合并
            BOOL parentBlack = [parent isBlack];
            [parent setBlack];
            [sibiling setRed];
            if (parentBlack) {
                [self afterRemove:parent replacement:nil];
            }
        } else {// 兄弟节点至少有一个红色子节点，向兄弟节点借元素
            // 兄弟节点的左边是黑色，兄弟要先旋转
            if ([(RBNode *)sibiling.left isBlack]) {
                [self rotateLeft:sibiling];
                sibiling = (RBNode *)parent.left;
            }
            [sibiling setColor:[parent color]];
            [(RBNode *)sibiling.left setBlack];
            [parent setBlack];
            [self rotateRight:parent];
        }
    }
}

- (void)afterRemove2:(RBNode *)node {
    // 删除red节点：直接删除即可(与下面合并为一句)
//    if ([node isRed]) {
//        return;
//    }
    // 删除red节点 或 用于取代node的子节点是红色
    if ([node isRed]) {
        [node setBlack];
        return;
    }
    RBNode *parent = (RBNode *)node.parent;
    // 到这里删除的节点都是black
    if (parent == nil) { // 删除的是根节点
        return;
    }
    // 删除的是黑色叶子节点【下溢】
    // 判断被删除的节点是左还是右
    BOOL isLeft = parent.left == nil || [node isLeftChild]; // [node isLeftChild]为了应付递归调用
    RBNode *sibiling = (RBNode *)(isLeft ? parent.right : parent.left);
    if (isLeft) { // 被删除的节点在左边，兄弟在右边
        if ([sibiling isRed]) { // 红兄弟
            [sibiling setBlack];
            [parent setRed];
            [self rotateLeft:parent];
            // 更换兄弟
            sibiling = (RBNode *)parent.right;
        }
        
        // 兄弟节点必然是黑色
        if ([(RBNode *)sibiling.left isBlack] && [(RBNode *)sibiling.right isBlack]) {
            // 兄弟节点没有一个红色子节点，父节点要向下跟兄弟节点合并
            BOOL parentBlack = [parent isBlack];
            [parent setBlack];
            [sibiling setRed];
            if (parentBlack) {
                [self afterRemove:parent replacement:nil];
            }
        } else {// 兄弟节点至少有一个红色子节点，向兄弟节点借元素
            // 兄弟节点的右边是黑色，兄弟要先旋转
            if ([(RBNode *)sibiling.right isBlack]) {
                [self rotateRight:sibiling];
                sibiling = (RBNode *)parent.right;
            }
            [sibiling setColor:[parent color]];
            [(RBNode *)sibiling.right setBlack];
            [parent setBlack];
            [self rotateLeft:parent];
        }
    } else { // 被删除的节点在右边，兄弟在左边
        if ([sibiling isRed]) { // 红兄弟
            [sibiling setBlack];
            [parent setRed];
            [self rotateRight:parent];
            // 更换兄弟
            sibiling = (RBNode *)parent.left;
        }
            
        // 兄弟节点必然是黑色
        if ([(RBNode *)sibiling.left isBlack] && [(RBNode *)sibiling.right isBlack]) {
            // 兄弟节点没有一个红色子节点，父节点要向下跟兄弟节点合并
            BOOL parentBlack = [parent isBlack];
            [parent setBlack];
            [sibiling setRed];
            if (parentBlack) {
                [self afterRemove:parent replacement:nil];
            }
        } else {// 兄弟节点至少有一个红色子节点，向兄弟节点借元素
            // 兄弟节点的左边是黑色，兄弟要先旋转
            if ([(RBNode *)sibiling.left isBlack]) {
                [self rotateLeft:sibiling];
                sibiling = (RBNode *)parent.left;
            }
            [sibiling setColor:[parent color]];
            [(RBNode *)sibiling.left setBlack];
            [parent setBlack];
            [self rotateRight:parent];
        }
    }
}


# pragma Mark  Node
- (BOOL)isRed:(RBNode *)node {
    return [self colorOf:node] == RED;
//    return [node isRed];
}

- (BOOL)isBlack:(RBNode *)node {
    return [self colorOf:node] == BLACK;
    //    return  [node isBlack];
}

- (RBColor)colorOf:(RBNode *)node {
    return node ? [node color] : BLACK;
}

- (void)setColor:(RBColor)color WithNode:(RBNode *)node {
    return [node setColor:color];
}

- (void)setBlack:(RBNode *)node {
    return [node setBlack];
}

- (void)setRed:(RBNode *)node {
    return [node setRed];
}



@end

//
//  BinarySearchTree.m
//  BinarySearchTree
//
//  Created by sw on 2019/4/28.
//  Copyright © 2019 WS. All rights reserved.
//

#import "BinarySearchTree.h"
#import "BinaryNode.h"

@implementation BinarySearchTree

- (void)add:(NSObject *)data {
    BinaryNode *newNode = [BinaryNode nodeWithData:data parent:nil];
    if (self.size == 0) {
        self.root = newNode;
    } else {
        BinaryNode *node = self.root;
        BinaryNode *parent = self.root;
        NSComparisonResult result = NSOrderedSame;
        while (node != nil) {
            if ([node compare:newNode] == NSOrderedDescending) { // node > newNode 查找左子树
                parent = node;
                node = node.left;
                result = NSOrderedDescending;
                
            } else if ([node compare:newNode] == NSOrderedAscending) { // node < newNode 查找右子树
                parent = node;
                node = node.right;
                result = NSOrderedAscending;
            } else { //相等
                node.data = data;
                return;
            }
        }
        
        if (result == NSOrderedDescending) {
            parent.left = newNode;
        } else {
            parent.right = newNode;
        }
        newNode.parent = parent;
    }
    self.size += 1;
}

// 本质上，搜索二叉树的节点删除操作就是对度为0或1的节点的删除和转移
- (void)remove:(NSObject *)data {
    // TODO
    if (data == nil || self.size == 0) {
        return;
    }
    
    // 一.查找节点
    BinaryNode *node = [self node:data];
//    BinaryNode *delete = [BinaryNode nodeWithData:data parent:nil];    // 要删除的node
//    BinaryNode *parent = nil;                                          // 遍历到的node的parent，初始化为nil
//    BinaryNode *node = self.root;                                      // 遍历到的node
//    NSComparisonResult result = NSOrderedSame;
//
//    while(node != nil) {
//        if ([node compare:delete] == NSOrderedDescending) { // node > delete 查找左子树
//            parent = node;
//            node = node.left;
//            result = NSOrderedDescending;
//        } else if ([node compare:delete] == NSOrderedAscending) { // node < delete 查找右子树
//            parent = node;
//            node = node.right;
//            result = NSOrderedAscending;
//        } else { // node == delete 找到了
//            result = NSOrderedSame;
//        }
//    }
//
//    if (result != NSOrderedSame) { // 没找到则说明删除的节点不存在
//        return;
//    }
    
    // 二.删除节点

    // 需要区分删除的是度为0、1、2的节点
    // 1.删除度为0的节点
    // 1.1.删除的是左子节点
    // 1.2.删除的是右子节点
    // 1.3.删除的是根子节点
    
    // 2.删除度为1的节点
    // 2.1.删除的是左子节点
    // 2.2.删除的是右子节点
    // 2.3.删除的是根子节点
    
    // 3.删除度为2的节点
    // 3.1.删除的是左子节点
    // 3.2.删除的是右子节点
    // 3.3.删除的是根子节点
    
    BinaryNode *delNode = node;
    BinaryNode *parent = node.parent;
    BinaryNode *left = node.left;
    BinaryNode *right = node.right;

    /**
     * 本例中 一律不清空node对其子树&parent引用，因为node引用计数为0时会自动释放他所有引用的对象i
     */
    
    if (parent == nil) {                                    // 删除的是根节点（只有根节点无parent）
        if (left == nil && right == nil) {                  // 删除的节点是度为0的根节点
            self.root = nil;                                // root置空，空树
        } else if (left == nil || right == nil) {           // 删除的节点是度为1的根节点
            self.root = left ? node.left : node.right;      // root指向左子树或右子树
            self.root.parent = nil;                         // 清空对删除的节点的引用
        } else {                                            // 删除的节点是度为2的根节点
            // 在root左子树寻找最大的节点或在右子树寻找最小的节点作为新的root
            // 本质上就是寻找中序遍历中root的前驱或后继节点作为新的root
            // 本例中以寻找左子树最大的节点作为新的root为例
            
            // 根节点 parent = nil;所以此处和非根节点的操作一样，对nil操作无效
            
            BinaryNode *leftMax = node.left;
            while(leftMax.right) {
                leftMax = leftMax.right;
            }
            // 左子树先卸载leftMax
            BinarySearchTree *leftTree = [BinarySearchTree treeWithComparer: nil];
            leftTree.root = left;
            [leftTree remove:leftMax];
            // leftMax放到即将被删除的node的位置
            leftMax.parent = node.parent;
            if (parent.left == node) {
                parent.left = leftMax;
            } else {
                parent.right = leftMax;
            }
            // 更新新node节点的左右子树为删除的node的左右子树
            leftMax.left = left;
            leftMax.right = right;
            // 更新node左右子树的parent为新的node
            left.parent = leftMax;
            right.parent = leftMax;
            // 删除对node的引用 上面更新了parent的left、right、左右子树的parent，则node会自动被释放，此步已完成
            
            
        }
    } else {                                                        //删除的节点是非根节点
        if (left == nil && right == nil) {                          // 删除的节点是度为0的非根节点
            // 更新parent的子树（为node的子树）
            if (parent.left == node) { // 清空parent对node的引用
                parent.left = nil;
            } else {
                parent.right = nil;
            }
            
            // 等价于
            /*
            if (parent.left == node) {
                parent.left = node.left ?: node.right;
            } else {
                parent.right = node.left ?: node.right;
            }
            */
            // node.parent = nil; // 清空node对父节点的引用 (不需要这么做，node无引用会被自动释放)
        } else if (left == nil || right == nil) { // 删除的节点是度为1的非根节点
            // 更新parent的子树（为node的子树）
            if (parent.left == node) {
                parent.left = node.left ?: node.right;
            } else {
                parent.right = node.left ?: node.right;
            }
            // 更新node子树的parent（为node的parent）
            if (node.left) {
                node.left.parent = parent;
            } else {
                node.right.parent = parent;
            }
            // 注意：要修改一个节点的属性还要用到(get或set)这个节点的属性，那么先用再改，如上 node.left
        } else { // 删除的节点是度为2的非根节点
            // 在node左子树寻找最大的节点或在右子树寻找最小的节点作为新的node
            // 本质上就是寻找中序遍历中root的前驱或后继节点作为新的node
            // 本例中以寻找左子树最大的节点作为新的node为例
            BinaryNode *leftMax = node.left;
            while(leftMax.right) {
                leftMax = leftMax.right;
            }
            // 左子树先卸载leftMax
            BinarySearchTree *leftTree = [BinarySearchTree treeWithComparer: nil];
            leftTree.root = left;
            [leftTree remove:leftMax];
            // leftMax放到即将被删除的node的位置
            leftMax.parent = node.parent;
            if (parent.left == node) {
                parent.left = leftMax;
            } else {
                parent.right = leftMax;
            }
            // 更新新node节点的左右子树为删除的node的左右子树
            leftMax.left = left;
            leftMax.right = right;
            // 更新node左右子树的parent为新的node
            left.parent = leftMax;
            right.parent = leftMax;
            // 删除对node的引用 上面更新了parent的left、right、左右子树的parent，则node会自动被释放，此步已完成
            
        }
    }
    
    self.size -= 1;
}

/*
 * 本例中 一律不清空node对其子树&parent引用，因为node引用计数为0时会自动释放他所有引用的对象

 // 需要区分删除的是度为0、1、2的节点
 // 1.删除度为0的节点
 // 1.1.删除的是左子节点
 // 1.2.删除的是右子节点
 // 1.3.删除的是根子节点
 
 // 2.删除度为1的节点
 // 2.1.删除的是左子节点
 // 2.2.删除的是右子节点
 // 2.3.删除的是根子节点
 
 // 3.删除度为2的节点
 // 3.1.删除的是左子节点
 // 3.2.删除的是右子节点
 // 3.3.删除的是根子节点
 
 */

- (void)remove2:(NSObject *)data {
    if (data == nil || self.size == 0) {
        return;
    }
    
    // 一.查找节点
    BinaryNode *node = [self node:data]; // 要删除的node
    if (node == nil) {
        return;
    }
    
    // 二.删除节点
    BinaryNode *delNode = node;
    BinaryNode *parent = node.parent;
    BinaryNode *left = node.left;
    BinaryNode *right = node.right;
    
    if (left == nil && right == nil) {                          // 删除的节点是度为0的非根节点
        if (parent == nil) {    // 删除的是根节点
            self.root = nil;
        } else {                // 删除的是叶子节点
            // 更新parent的子树（为node的子树）
            if (parent.left == node) { // 清空parent对叶子节点node的引用
                parent.left = nil;
            } else {
                parent.right = nil;
            }
        }
        // 等价于
        /*
         if (parent.left == node) {
         parent.left = node.left ?: node.right;
         } else {
         parent.right = node.left ?: node.right;
         }
         */
        // node.parent = nil; // 清空node对父节点的引用 (不需要这么做，node无引用会被自动释放)
    } else if (left == nil || right == nil) { // 删除的节点是度为1的非根节点
        // 更新parent的子树（为node的子树）
        // 如果删除的是根节点，那么parent = nil; OC对nil操作无效，所以此处删除根节点和非根节点的代码可以一样
        if (parent.left == node) {
            parent.left = node.left ?: node.right;
        } else {
            parent.right = node.left ?: node.right;
        }
        // 更新node子树的parent（为node的parent）
        if (node.left) {
            node.left.parent = parent;
        } else {
            node.right.parent = parent;
        }
        
        // 如果删除的是根节点还要更新root
        if (parent == nil) {
            self.root = left ? node.left : node.right;      // root指向左子树或右子树
            self.root.parent = nil;                         // 清空对删除的节点的引用
        }
        // 注意：要修改一个节点的属性还要用到(get或set)这个节点的属性，那么先用再改，如上 node.left
    } else { // 删除的节点是度为2的非根节点
        // 在node左子树寻找最大的节点或在右子树寻找最小的节点作为新的node
        // 本质上就是寻找中序遍历中root的前驱或后继节点作为新的node
        // 本例中以寻找左子树最大的节点作为新的node为例
        
        // 如果删除的是根节点，那么parent = nil; OC对nil操作无效，所以此处删除根节点和非根节点的代码可以一样

        BinaryNode *leftMax = node.left;
        while(leftMax.right) {
            leftMax = leftMax.right;
        }
        // 左子树先卸载leftMax
        BinarySearchTree *leftTree = [BinarySearchTree treeWithComparer: nil];
        leftTree.root = left;
        [leftTree remove:leftMax.data];
        // leftMax放到即将被删除的node的位置
        leftMax.parent = node.parent;
        if (parent.left == node) {
            parent.left = leftMax;
        } else {
            parent.right = leftMax;
        }
        // 更新新node节点的左右子树为删除的node的左右子树
        leftMax.left = left;
        leftMax.right = right;
        // 更新node左右子树的parent为新的node
        left.parent = leftMax;
        right.parent = leftMax;
        // 删除对node的引用 上面更新了parent的left、right、左右子树的parent，则node会自动被释放，此步已完成
        
    }
    
    self.size -= 1;
}


- (void)remove3:(NSObject *)data {
    if (data == nil || self.root == nil) {
        return;
    }
    // 一.查找节点
    BinaryNode *node = [self node:data]; // 要删除的node
    if (node == nil) {
        return;
    }
    // 二.删除节点
    BinaryNode *parent = node.parent;
    BinaryNode *left = node.left;
    BinaryNode *right = node.right;
    
    if (left == nil && right == nil) {                          // 删除的节点是度为0的非根节点
        if (parent == nil) {                                    // 删除的是根节点
            self.root = nil;
        } else {                                                // 删除的是叶子节点
            // 更新parent的子树（为node的子树）
            if (parent.left == node) {                          // 清空parent对叶子节点node的引用
                parent.left = nil;
            } else {
                parent.right = nil;
            }
        }
        // 等价于
        /*
         if (parent.left == node) {
         parent.left = node.left ?: node.right;
         } else {
         parent.right = node.left ?: node.right;
         }
         */
        // node.parent = nil; // 清空node对父节点的引用 (不需要这么做，node无引用会被自动释放)
    } else if (left == nil || right == nil) { // 删除的节点是度为1的非根节点
        // 更新parent的子树（为node的子树）
        // 如果删除的是根节点，那么parent = nil; OC对nil操作无效，所以此处删除根节点和非根节点的代码可以一样
        if (parent.left == node) {
            parent.left = node.left ?: node.right;
        } else {
            parent.right = node.left ?: node.right;
        }
        // 更新node子树的parent（为node的parent）
        if (node.left) {
            node.left.parent = parent;
        } else {
            node.right.parent = parent;
        }
        
        // 如果删除的是根节点还要更新root
        if (parent == nil) {
            self.root = left ? node.left : node.right;      // root指向左子树或右子树
            self.root.parent = nil;                         // 清空对删除的节点的引用
        }
        // 注意：要修改一个节点的属性还要用到(get或set)这个节点的属性，那么先用再改，如上 node.left
    } else { // 删除的节点是度为2的非根节点
        // 如果删除的是根节点，那么parent = nil; OC对nil操作无效，所以此处删除根节点和非根节点的代码可以一样

        // 以node为根节点，在node左子树寻找最大的节点或在右子树寻找最小的节点作为新的node
        // 本质上就是寻找中序遍历中node的前驱或后继节点作为新的node
        // 本例中以寻找左子树最大的节点作为新的node为例
        
        // 1.查找左子树最大的节点，即中序遍历中根节点的前驱
        // 此处不能传node.left 有可能node.left是nil，这种情况需要向上查找node的父节点、祖父节点
        BinaryNode *leftMax = [self maxNode:node.left];
        // 2.左子树先卸载leftMax
        BinarySearchTree *leftTree = [BinarySearchTree treeWithComparer: [Comparer comparer]];
        leftTree.root = left;
        [leftTree remove3:leftMax.data];
        // 3.leftMax放到即将被删除的node的位置
        // 3.1.更新leftMax的父节点
        leftMax.parent = parent;
        
        // 3.3.更新新node节点leftMax的左右子树(为删除的node的左右子树)
//        leftMax.left = left;
//        leftMax.right = right;
        // 不要用上面这种写法，因为left、right有可能是已经删除的节点
        leftMax.left = node.left;
        leftMax.right = node.right;
        // 3.2.更新 parent的子节点
        if (parent.left == node) {
            parent.left = leftMax;
        } else {
            parent.right = leftMax;
        }
        // 删除的是根节点
        if (parent == nil) {
            self.root = leftMax;
        }

        // 3.4.更新node左右子树的parent为新的node leftMax
//        left.parent = leftMax;
//        right.parent = leftMax;
        // 不要用上面的这种写法，因为left、right有可能是已经删除的节点 有可能出现 parent指向自己
        node.left.parent = leftMax;
        node.right.parent = leftMax;
        // 删除对node的引用
        // 上面更新了parent的left、right、左右子树的parent，则node会自动被释放，此步已完成
    }
    
    self.size -= 1;
}

/**
 * 查找某棵树最大的节点
 */
- (BinaryNode *)maxNode:(BinaryNode *)root {
    if (root == nil) {
        return nil;
    }
    BinaryNode *node = root;
    while(node.right) {
        node = node.right;
    }
    return node;
}


/**
 * 查找某棵树最小的节点
 */
- (BinaryNode *)minNode:(BinaryNode *)root {
    if (root == nil) {
        return nil;
    }
    BinaryNode *node = root;
    while(node.left) {
        node = node.left;
    }
    return node;
}

/**
 * 查找前驱
 * root 节点
 * return root节点的前驱
 */
- (BinaryNode *)predecessor:(BinaryNode *)root {
    if (root == nil) {
        return nil;
    }
    BinaryNode *node = root;
    while(node.right) {
        node = node.right;
    }
    return node;
}

/**
 * 查找后继
 root
 */
- (BinaryNode *)successor:(BinaryNode *)root {
    if (root == nil) {
        return nil;
    }
    BinaryNode *node = root;
    while(node.left) {
        node = node.left;
    }
    return node;
}


/**
 * 是否包含某个节点
 */
- (BOOL)contains:(NSObject *)data {
    return [self node:data] != nil;
}

/**
 * 查找包含指定数据的节点
 */
- (BinaryNode *)node:(NSObject *)data {
    BinaryNode *node = self.root;
    while (node != nil) {
        NSComparisonResult res = [self.comparer compare:node.data with:data];
        if (res == NSOrderedAscending) { // 升序
            node = node.right;
        } else if (res == NSOrderedDescending) { // 降序
            node = node.left;
        } else {
            return node;
        }
    }
    return nil;
}

//- (BinaryNode *)node:(NSObject *)data {
//    // 一.查找节点
//    BinaryNode *node = [BinaryNode nodeWithData:data parent:nil];           // 查找的node
//    BinaryNode *parent = nil;                                               // 遍历到的node的parent，初始化为nil
//    BinaryNode *curNode = self.root;                                        // 遍历到的node
//
//    while(curNode != nil) {
//        if ([curNode compare:node] == NSOrderedDescending) {                // curNode > node 查找左子树
//            parent = curNode;
//            curNode = curNode.left;
//            result = NSOrderedDescending;
//        } else if ([curNode compare:node] == NSOrderedAscending) {          // curNode < node 查找右子树
//            parent = curNode;
//            curNode = curNode.right;
//        } else {                                                            // curNode == node 找到了
//            return curNode;
//        }
//    }
//    return nil; // 没找到则说明删除的节点不存在
//
//}
@end

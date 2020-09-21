//
//  main.m
//  BinarySearchTree
//
//  Created by sw on 2019/4/28.
//  Copyright © 2019 WS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinarySearchTree.h"
#import "Comparer.h"
BinarySearchTree * BST(void);

void preOrderBST(BinarySearchTree *bst);
void inOrderBST(BinarySearchTree *bst);
void postOrderBST(BinarySearchTree *bst);

// 二叉搜索树能把查找、插入、删除操作的时间复杂度降低到Olog(n)
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        preOrderBST(BST());
//        inOrderBST(BST());
//        postOrderxBST(BST());
        
        BinarySearchTree *bst = BST();
        // 删除度为0的节点
//        [bst remove3:@20];
//        [bst remove3:@18];
//        [bst remove3:@20];
//        [bst remove3:@22];
        // 删除度为1的节点
//        [bst remove3:@18];
//        [bst remove3:@22];
//        [bst remove3:@20];
//        [bst remove3:@18];
        [bst remove3:@20];

        inOrderBST(bst);
    }
    return 0;
}

BinarySearchTree * BST(){
    Comparer *cmpr = [Comparer comparer];
    BinarySearchTree *bst = [BinarySearchTree treeWithComparer:cmpr];
    [bst add:@20];
    [bst add:@18];
    [bst add:@22];
    [bst add:@16];
    [bst add:@24];
    [bst add:@19];

    return bst;
}

//BinarySearchTree * BST(){
//    Comparer *cmpr = [Comparer comparer];
//    BinarySearchTree *bst = [BinarySearchTree treeWithComparer:cmpr];
//    [bst add:@9];
//    [bst add:@11];
//    [bst add:@13];
//    [bst add:@7];
//    [bst add:@666];
//    [bst add:@1];
//    [bst add:@12];
//    return bst;
//}

void preOrderBST(BinarySearchTree *bst) {
    [bst preOrderTraversal:bst.root];
}

void inOrderBST(BinarySearchTree *bst) {
    [bst inOrderTraversal:bst.root];
}

void postOrderBST(BinarySearchTree *bst) {
    [bst postOrderTraversal:bst.root];
}

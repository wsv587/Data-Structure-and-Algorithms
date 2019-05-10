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
BinarySearchTree * BST();
void preOrderBST(BinarySearchTree *bst);

// 二叉搜索树能把查找、插入、删除操作的时间复杂度降低到Olog(n)
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        preOrderBST(BST());
    }
    return 0;
}

BinarySearchTree * BST(){
    Comparer *cmpr = [Comparer comparer];
    BinarySearchTree *bst = [BinarySearchTree treeWithComparer:cmpr];
    [bst add:@9];
    [bst add:@11];
    [bst add:@13];
    [bst add:@7];
    [bst add:@666];
    [bst add:@1];
    [bst add:@12];
    return bst;
}

void preOrderBST(BinarySearchTree *bst) {
    [bst preOrderTraversal:bst.root];
}

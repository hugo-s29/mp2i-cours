#include<stdio.h>
#include<stdbool.h>

#include "tree.h"

void main() {
	tree* t = createTree();
	node* n1 = createNode(3); insertNode(t, n1);
	node* n2 = createNode(2); insertNode(t, n2);
	node* n3 = createNode(4); insertNode(t, n3);
	node* n4 = createNode(7); insertNode(t, n4);

	infixPrint(t->root);
	printf("\n");
}

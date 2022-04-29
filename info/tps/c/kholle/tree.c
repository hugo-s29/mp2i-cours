#include<stdlib.h>
#include<stdio.h>
#include<assert.h>

#include "tree.h"

int max(int a, int b) { return a < b ? b : a; }

node* createNode(int value) {
	node* n = malloc(sizeof(node));
	assert(n != NULL);

	n->key = value;

	n->left = NULL;
	n->right = NULL;
	n->parent = NULL;

	return n;
}

tree* createTree() {
	tree* t = malloc(sizeof(tree));
	assert(t != NULL);

	t->root = NULL;

	return t;
}

void _insertNode(node* n, node* root) {
	if (n->key <= root->key) {
		if (root->left == NULL) {
			root->left = n;
			n->parent = root;
		} else
			_insertNode(n, root->left);
	}
	else {
		if (root->right == NULL) {
			root->right = n;
			n->parent = root;
		} else
			_insertNode(n , root->right);
	}
}

void insertNode(tree* t, node* n) {
	if (t->root == NULL) {
		t->root = n;
		n->parent = t->root;
	} else
		_insertNode(n, t->root);
}

node* findKeyIter(tree* t, int k) {
	node* n = t->root;

	while (n != NULL && n->key != k) {
		if (n->key < k) {
			n = n->left;
		} else {
			n = n->right;
		}
	}

	return n;
}


node* _findKeyRec(node* n, int k) {
	if (n == NULL || n->key == k)
		return n;

	if (n->key < k) {
		return _findKeyRec(n->left, k);
	} else  {
		return _findKeyRec(n->right, k);
	}
}

node* findKeyRec(tree* t, int k) {
	return _findKeyRec(t->root, k);
}

int size(node* n) {
	int sizeLeft = n->left == NULL ? 0 : size(n->left);
	int sizeRight = n->right == NULL ? 0 : size(n->right);
	return sizeLeft + sizeRight + 1;
}

int height(node* n) {
	int heightLeft = n->left == NULL ? 0 : height(n->left);
	int heightRight = n->right == NULL ? 0 : height(n->right);
	return max(heightLeft, heightRight) + 1;
}

void postfixPrint(node* n) {
	if (n->left == NULL && n->right == NULL) {
		printf("%d", n->key);
		return;
	}

	printf("(");
	if (n->left != NULL) {
		postfixPrint(n->left);
	}
	printf(") (");
	if (n->right != NULL) {
		postfixPrint(n->right);
	}
	printf(") %d", n->key);
}

void infixPrint(node* n) {
	if (n->left == NULL && n->right == NULL) {
		printf("%d", n->key);
		return;
	}

	printf("(");
	if (n->left != NULL) {
		infixPrint(n->left);
	}
	printf(") %d (", n->key);
	if (n->right != NULL) {
		infixPrint(n->right);
	}
	printf(")");
}

void prefixPrint(node* n) {
	if (n->left == NULL && n->right == NULL) {
		printf("%d", n->key);
		return;
	}

	printf("%d (", n->key);

	if (n->left != NULL) {
		prefixPrint(n->left);
	}

	printf(") (");

	if (n->right != NULL) {
		prefixPrint(n->right);
	}

	printf(")");
}

node* minimum(node* n) {
	while(n->left != NULL) {
		n = n->left;
	}

	return n;
}

node* successor(tree* t, node* x) {
	if(x->right != NULL) {
		printf("min -> ");
		infixPrint(x);
		printf("\n");
		return minimum(x->right);
	}

	node* y = x->parent;

	while (y != NULL && x == y->right) {
		x = y;
		y = y->parent;
	}

	return y;
}

void transplant(tree* t, node* u, node* v) {
	if (u->parent == NULL) {
		t->root = v;
	} else if (u == u->parent->left) {
		u->parent->left = v;
	} else {
		u->parent->right = v;
	}

	if(v != NULL) {
		v->parent = u->parent;
	}
}

void deleteNode(tree* t, node* n) {
	if (n->left == NULL) {
		transplant(t, n, n->right);
	} else if (n->right == NULL) {
		transplant(t, n, n->left);
	} else {
		node* min_r = minimum(n->right);

		if(min_r->parent != n) {
			transplant(t, min_r, min_r->right);
			min_r->right = n->right;
			min_r->right->parent = min_r;
		}

		transplant(t, n, min_r);
		min_r->left = n->left;
		min_r->left->parent = n->left;
	}
}



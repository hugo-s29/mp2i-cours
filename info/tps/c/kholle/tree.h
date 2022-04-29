// Hugo SALOU MP2I
// 04/04/2022
// Désolé pour le code pas super, future moi

typedef struct _node {
	int key;
	struct _node* left;
	struct _node* right;
	struct _node* parent;
} node;

typedef struct _tree {
	node* root;
} tree;

node* createNode(int value);
tree* createTree();
void insertNode(tree* t, node* n);
void deleteNode(tree* t, node* n);
node* findKeyIter(tree* t, int k);
node* findKeyRec(tree* t, int k);
int size(node* n);
int height(node* n);
void transplant(tree* t, node* u, node* v);

void postfixPrint(node* n);
void infixPrint(node* n);
void prefixPrint(node* n);
node* minimum(node* root);
node* successor(tree* t, node* n);

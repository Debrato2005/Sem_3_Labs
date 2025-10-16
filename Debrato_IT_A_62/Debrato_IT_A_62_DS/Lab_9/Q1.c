#include <stdio.h>
#include <stdlib.h>

struct Node {
    int data;
    struct Node *left;
    struct Node *right;
};

struct StackNode {
    struct Node *treeNode;
    struct StackNode *next;
};

void push(struct StackNode** top, struct Node* treeNode) {
    struct StackNode* newStackNode = (struct StackNode*)malloc(sizeof(struct StackNode));
    newStackNode->treeNode = treeNode;
    newStackNode->next = *top;
    *top = newStackNode;
}

struct Node* pop(struct StackNode** top) {
    if (*top == NULL) {
        return NULL;
    }
    struct StackNode* temp = *top;
    *top = (*top)->next;
    struct Node* popped = temp->treeNode;
    free(temp);
    return popped;
}

int isStackEmpty(struct StackNode* top) {
    return top == NULL;
}

void inorderTraversal(struct Node* root) {
    struct Node* current = root;
    struct StackNode* stack = NULL;

    while (current != NULL || !isStackEmpty(stack)) {
        while (current != NULL) {
            push(&stack, current);
            current = current->left;
        }

        current = pop(&stack);
        printf("%d ", current->data);

        current = current->right;
    }
}

void postorderTraversal(struct Node* root) {
    if (root == NULL)
        return;

    struct StackNode* stack1 = NULL;
    struct StackNode* stack2 = NULL;
    push(&stack1, root);

    while (!isStackEmpty(stack1)) {
        struct Node* node = pop(&stack1);
        push(&stack2, node);

        if (node->left)
            push(&stack1, node->left);
        if (node->right)
            push(&stack1, node->right);
    }

    while (!isStackEmpty(stack2)) {
        struct Node* node = pop(&stack2);
        printf("%d ", node->data);
    }
}


void preorderTraversal(struct Node* root) {
    if (root == NULL)
        return;

    struct StackNode* stack = NULL;
    push(&stack, root);

    while (!isStackEmpty(stack)) {
        struct Node* node = pop(&stack);
        printf("%d ", node->data);

        if (node->right)
            push(&stack, node->right);
        if (node->left)
            push(&stack, node->left);
    }
}

void printParent(struct Node* root, int key) {
    if (root == NULL) {
        return;
    }

    struct Node* parent = NULL;
    struct Node* current = root;

    while (current != NULL && current->data != key) {
        parent = current;
        if (key < current->data) {
            current = current->left;
        } else {
            current = current->right;
        }
    }

    if (current != NULL) {
        if (parent != NULL) {
            printf("Parent of %d is %d\n", key, parent->data);
        } else {
            printf("%d is the root node.\n", key);
        }
    } else {
        printf("Node with value %d not found.\n", key);
    }
}


int depth(struct Node* root) {
    if (root == NULL) {
        return 0;
    } else {
        int lDepth = depth(root->left);
        int rDepth = depth(root->right);

        if (lDepth > rDepth) {
            return (lDepth + 1);
        } else {
            return (rDepth + 1);
        }
    }
}

int printAncestors(struct Node* root, int key) {
    if (root == NULL) {
        return 0;
    }

    if (root->data == key) {
        return 1;
    }

    if (printAncestors(root->left, key) || printAncestors(root->right, key)) {
        printf("%d ", root->data);
        return 1;
    }

    return 0;
}

int countLeafNodes(struct Node* root) {
    if (root == NULL) {
        return 0;
    }
    if (root->left == NULL && root->right == NULL) {
        return 1;
    } else {
        return countLeafNodes(root->left) + countLeafNodes(root->right);
    }
}

struct Node* newNode(int data) {
    struct Node* node = (struct Node*)malloc(sizeof(struct Node));
    node->data = data;
    node->left = NULL;
    node->right = NULL;
    return node;
}
int main() {
    struct Node *root = newNode(1);
    root->left = newNode(2);
    root->right = newNode(3);
    root->left->left = newNode(4);
    root->left->right = newNode(5);
    root->right->left = newNode(6);
    root->right->right = newNode(7);

    printf("Inorder traversal: ");
    inorderTraversal(root);
    printf("\n");

    printf("Postorder traversal: ");
    postorderTraversal(root);
    printf("\n");

    printf("Preorder traversal: ");
    preorderTraversal(root);
    printf("\n\n");

    printParent(root, 5);
    printParent(root, 1);
    printf("\n");


    printf("Depth of the tree: %d\n\n", depth(root));


    printf("Ancestors of 5 are: ");
    printAncestors(root, 5);
    printf("\n\n");

    printf("Number of leaf nodes: %d\n", countLeafNodes(root));

    return 0;
}


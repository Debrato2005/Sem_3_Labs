
#include <stdio.h>
#include <stdlib.h>

struct Node {
    int data;
    struct Node* left;
    struct Node* right;
};

struct Node* createBinaryTree() {
    int data;
    printf("Enter data (-1 for no node): ");
    scanf("%d", &data);

    if (data == -1) {
        return NULL;
    }

    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data = data;

    printf("Enter left child of %d:\n", data);
    newNode->left = createBinaryTree();

    printf("Enter right child of %d:\n", data);
    newNode->right = createBinaryTree();

    return newNode;
}

int height(struct Node* node) {
    if (node == NULL) {
        return 0;
    } else {
        int lheight = height(node->left);
        int rheight = height(node->right);

        if (lheight > rheight) {
            return (lheight + 1);
        } else {
            return (rheight + 1);
        }
    }
}

void printCurrentLevel(struct Node* root, int level) {
    if (root == NULL) {
        return;
    }
    if (level == 1) {
        printf("%d ", root->data);
    } else if (level > 1) {
        printCurrentLevel(root->left, level - 1);
        printCurrentLevel(root->right, level - 1);
    }
}

void printLevelOrder(struct Node* root) {
    int h = height(root);
    int i;
    for (i = 1; i <= h; i++) {
        printCurrentLevel(root, i);
        printf("\n");
    }
}
int main() {
    struct Node* root = NULL;

    root = createBinaryTree();

    printf("\nLevel order traversal of the created tree:\n");
    printLevelOrder(root);

    return 0;
}

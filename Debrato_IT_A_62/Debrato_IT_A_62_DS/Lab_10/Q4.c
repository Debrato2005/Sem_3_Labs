#include <stdio.h>
#include <stdlib.h>

struct Node {
    int key;
    struct Node *left;
    struct Node *right;
};

struct Node* newNode(int item) {
    struct Node* temp = (struct Node*)malloc(sizeof(struct Node));
    if (temp == NULL) {
        printf("Memory allocation failed\n");
        exit(1);
    }
    temp->key = item;
    temp->left = temp->right = NULL;
    return temp;
}

struct Node* insert(struct Node* node, int key) {
    if (node == NULL) {
        return newNode(key);
    }
    if (key < node->key) {
        node->left = insert(node->left, key);
    } else if (key > node->key) {
        node->right = insert(node->right, key);
    }
    return node;
}

struct Node* findMin(struct Node* node) {
    if (node == NULL) {
        return NULL;
    }
    struct Node* current = node;
    while (current->left != NULL) {
        current = current->left;
    }
    return current;
}

struct Node* findMax(struct Node* node) {
    if (node == NULL) {
        return NULL;
    }
    struct Node* current = node;
    while (current->right != NULL) {
        current = current->right;
    }
    return current;
}

int main() {
    struct Node* root = NULL;
    root = insert(root, 50);
    insert(root, 30);
    insert(root, 20);
    insert(root, 40);
    insert(root, 70);
    insert(root, 60);
    insert(root, 80);

    struct Node* minNode = findMin(root);
    if (minNode != NULL) {
        printf("The minimum element in the BST is: %d\n", minNode->key);
    } else {
        printf("The BST is empty.\n");
    }

    struct Node* maxNode = findMax(root);
    if (maxNode != NULL) {
        printf("The maximum element in the BST is: %d\n", maxNode->key);
    } else {
        printf("The BST is empty.\n");
    }

    return 0;
}

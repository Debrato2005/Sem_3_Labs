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


struct Node* search(struct Node* root, int key) {
    if (root == NULL || root->key == key) {
       return root;
    }

    if (root->key < key) {
       return search(root->right, key);
    }

    return search(root->left, key);
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

    int key_to_find;
    struct Node* result = NULL;

    key_to_find = 40;
    result = search(root, key_to_find);
    if (result != NULL) {
        printf("Key %d found in the BST.\n", key_to_find);
    } else {
        printf("Key %d not found in the BST.\n", key_to_find);
    }

    key_to_find = 90;
    result = search(root, key_to_find);
    if (result != NULL) {
        printf("Key %d found in the BST.\n", key_to_find);
    } else {
        printf("Key %d not found in the BST.\n", key_to_find);
    }

    key_to_find = 50;
    result = search(root, key_to_find);
    if (result != NULL) {
        printf("Key %d found in the BST.\n", key_to_find);
    } else {
        printf("Key %d not found in the BST.\n", key_to_find);
    }

    return 0;
}

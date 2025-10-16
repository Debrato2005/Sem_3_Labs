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

void inorder(struct Node* root) {
    if (root != NULL) {
        inorder(root->left);
        printf("%d ", root->key);
        inorder(root->right);
    }
}

struct Node* minValueNode(struct Node* node) {
    struct Node* current = node;

    while (current && current->left != NULL) {
        current = current->left;
    }
    return current;
}


struct Node* deleteNode(struct Node* root, int key) {

    if (root == NULL) {
        return root;
    }


    if (key < root->key) {
        root->left = deleteNode(root->left, key);
    } else if (key > root->key) {
        root->right = deleteNode(root->right, key);
    }

    else {
        if (root->left == NULL) {
            struct Node* temp = root->right;
            free(root);
            return temp;
        } else if (root->right == NULL) {
            struct Node* temp = root->left;
            free(root);
            return temp;
        }


        struct Node* temp = minValueNode(root->right);


        root->key = temp->key;


        root->right = deleteNode(root->right, temp->key);
    }
    return root;
}


int main() {
    struct Node* root = NULL;
    root = insert(root, 50);
    root = insert(root, 30);
    root = insert(root, 20);
    root = insert(root, 40);
    root = insert(root, 70);
    root = insert(root, 60);
    root = insert(root, 80);

    printf("Original BST (Inorder traversal): ");
    inorder(root);
    printf("\n\n");


    printf("Deleting leaf node 20...\n");
    root = deleteNode(root, 20);
    printf("Inorder traversal after deleting 20: ");
    inorder(root);
    printf("\n\n");


    printf("Deleting node with one child 30...\n");
    root = deleteNode(root, 30);
    printf("Inorder traversal after deleting 30: ");
    inorder(root);
    printf("\n\n");


    printf("Deleting node with two children 50...\n");
    root = deleteNode(root, 50);
    printf("Inorder traversal after deleting 50: ");
    inorder(root);
    printf("\n\n");

    return 0;
}

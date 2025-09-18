/*4. Create a queue of structures (e.g., queue of patients with name, age, and priority).*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define NAME_LEN 50

typedef struct {
    char name[NAME_LEN];
    int age;
    int priority;
} Patient;

typedef struct Node {
    Patient data;
    struct Node* next;
} Node;

typedef struct {
    Node* front;
    Node* rear;
} Queue;

Node* createNode(Patient p) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    if (!newNode) {
        printf("Memory allocation failed\n");
        exit(EXIT_FAILURE);
    }
    newNode->data = p;
    newNode->next = NULL;
    return newNode;
}

void initQueue(Queue* q) {
    q->front = q->rear = NULL;
}

int isEmpty(Queue* q) {
    return q->front == NULL;
}

void enqueue(Queue* q, Patient p) {
    Node* newNode = createNode(p);
    if (q->rear == NULL) {
        q->front = q->rear = newNode;
        return;
    }
    q->rear->next = newNode;
    q->rear = newNode;
}

Patient dequeue(Queue* q) {
    if (isEmpty(q)) {
        printf("Queue is empty! Cannot dequeue.\n");
        exit(EXIT_FAILURE);
    }
    Node* temp = q->front;
    Patient p = temp->data;
    q->front = q->front->next;

    if (q->front == NULL) {
        q->rear = NULL;
    }
    free(temp);
    return p;
}

void display(Queue* q) {
    Node* current = q->front;
    printf("Queue:\n");
    while (current) {
        Patient p = current->data;
        printf("Name: %s, Age: %d, Priority: %d\n", p.name, p.age, p.priority);
        current = current->next;
    }
    if (isEmpty(q)) {
        printf("(empty)\n");
    }
}

int main() {
    Queue q;
    initQueue(&q);

    Patient p1 = {"Alice", 30, 2};
    Patient p2 = {"Bob", 45, 1};
    Patient p3 = {"Charlie", 25, 3};

    enqueue(&q, p1);
    enqueue(&q, p2);
    enqueue(&q, p3);

    display(&q);

    printf("\nDequeued patient:\n");
    Patient dequeuedPatient = dequeue(&q);
    printf("Name: %s, Age: %d, Priority: %d\n", dequeuedPatient.name, dequeuedPatient.age, dequeuedPatient.priority);

    printf("\nQueue after dequeue:\n");
    display(&q);

    return 0;
}

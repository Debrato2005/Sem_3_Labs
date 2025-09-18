/*Array-Based Queue Implementation:
1. Write a C program to simulate a printer queue where tasks arrive randomly and are
processed in order.
i. Tasks (with a document ID and name) arrive at random (simulate using
random function or user input).
ii. Enqueue each print job.
iii. Dequeue in FIFO order to simulate printing*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define MAX_QUEUE_SIZE 100
#define MAX_NAME_LENGTH 50

typedef struct {
    int documentID;
    char documentName[MAX_NAME_LENGTH];
} PrintJob;

typedef struct {
    PrintJob queue[MAX_QUEUE_SIZE];
    int front;
    int rear;
} PrinterQueue;

void initializeQueue(PrinterQueue* pq) {
    pq->front = 0;
    pq->rear = -1;
}

int isFull(PrinterQueue* pq) {
    return pq->rear == MAX_QUEUE_SIZE - 1;
}

int isEmpty(PrinterQueue* pq) {
    return pq->front > pq->rear;
}

void enqueue(PrinterQueue* pq, PrintJob job) {
    if (isFull(pq)) {
        printf("Printer queue is full. Cannot enqueue job.\n");
        return;
    }
    pq->rear++;
    pq->queue[pq->rear] = job;
    printf("Enqueued: [%d] %s\n", job.documentID, job.documentName);
}

PrintJob dequeue(PrinterQueue* pq) {
    PrintJob emptyJob = {-1, ""};
    if (isEmpty(pq)) {
        printf("Printer queue is empty. Cannot dequeue.\n");
        return emptyJob;
    }
    PrintJob job = pq->queue[pq->front];
    pq->front++;
    return job;
}

void generateRandomName(char* name) {
    const char* baseNames[] = {"Doc", "File", "Report", "Invoice", "Note"};
    int index = rand() % 5;
    int number = rand() % 1000;
    sprintf(name, "%s_%d", baseNames[index], number);
}

int main() {
    PrinterQueue pq;
    initializeQueue(&pq);
    srand(time(NULL));

    int choice, numJobs, idCounter = 1;

    while (1) {
        printf("\n--- Printer Queue Simulation ---\n");
        printf("1. Add random print jobs\n");
        printf("2. Process (dequeue) next print job\n");
        printf("3. Show queue status\n");
        printf("4. Exit\n");
        printf("Enter choice: ");
        scanf("%d", &choice);

        if (choice == 1) {
            printf("How many jobs to add? ");
            scanf("%d", &numJobs);
            for (int i = 0; i < numJobs; i++) {
                PrintJob job;
                job.documentID = idCounter++;
                generateRandomName(job.documentName);
                enqueue(&pq, job);
            }
        } else if (choice == 2) {
            PrintJob job = dequeue(&pq);
            if (job.documentID != -1) {
                printf("Printing job: [%d] %s\n", job.documentID, job.documentName);
            }
        } else if (choice == 3) {
            if (isEmpty(&pq)) {
                printf("Queue is empty.\n");
            } else {
                printf("Current queue:\n");
                for (int i = pq.front; i <= pq.rear; i++) {
                    printf("  [%d] %s\n", pq.queue[i].documentID, pq.queue[i].documentName);
                }
            }
        } else if (choice == 4) {
            printf("Exiting...\n");
            break;
        } else {
            printf("Invalid choice. Try again.\n");
        }
    }

    return 0;
}

#include <stdio.h>
#include <stdlib.h>

#define MAX_VERTICES 50

struct Node {
    int dest;
    struct Node* next;
};

struct Graph {
    int V;
    struct Node** adjLists;
    int* visited;
};

struct Node* createNode(int dest) {
    struct Node* newNode = malloc(sizeof(struct Node));
    newNode->dest = dest;
    newNode->next = NULL;
    return newNode;
}

struct Graph* createGraph(int vertices) {
    struct Graph* graph = malloc(sizeof(struct Graph));
    graph->V = vertices;
    graph->adjLists = malloc(vertices * sizeof(struct Node*));
    graph->visited = malloc(vertices * sizeof(int));
    for (int i = 0; i < vertices; i++) {
        graph->adjLists[i] = NULL;
        graph->visited[i] = 0;
    }
    return graph;
}

void addEdge(struct Graph* graph, int src, int dest) {
    struct Node* newNode = createNode(dest);
    newNode->next = graph->adjLists[src];
    graph->adjLists[src] = newNode;

    newNode = createNode(src);
    newNode->next = graph->adjLists[dest];
    graph->adjLists[dest] = newNode;
}

int queue[MAX_VERTICES];
int front = -1, rear = -1;

void enqueue(int value) {
    if (rear == -1)
        front = 0;
    rear++;
    queue[rear] = value;
}

int dequeue() {
    int item = queue[front];
    front++;
    if (front > rear) {
        front = rear = -1;
    }
    return item;
}

int isQueueEmpty() {
    return rear == -1;
}

void bfs(struct Graph* graph, int startVertex) {
    graph->visited[startVertex] = 1;
    enqueue(startVertex);

    while (!isQueueEmpty()) {
        int currentVertex = dequeue();
        printf("%d ", currentVertex);

        struct Node* temp = graph->adjLists[currentVertex];
        while (temp) {
            int adjVertex = temp->dest;
            if (graph->visited[adjVertex] == 0) {
                graph->visited[adjVertex] = 1;
                enqueue(adjVertex);
            }
            temp = temp->next;
        }
    }
}

int main() {
    struct Graph* graph = createGraph(6);
    addEdge(graph, 0, 1);
    addEdge(graph, 0, 2);
    addEdge(graph, 1, 3);
    addEdge(graph, 1, 4);
    addEdge(graph, 2, 4);
    addEdge(graph, 3, 4);
    addEdge(graph, 3, 5);
    addEdge(graph, 4, 5);

    printf("Breadth First Search starting from vertex 0:\n");
    bfs(graph, 0);
    printf("\n");

    return 0;
}

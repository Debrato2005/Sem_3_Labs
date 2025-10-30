#include <stdio.h>
#include <stdlib.h>

struct AdjListNode {
    int dest;
    struct AdjListNode* next;
};

struct AdjList {
    struct AdjListNode *head;
};

struct Graph {
    int V;
    struct AdjList* array;
};

struct AdjListNode* newAdjListNode(int dest) {
    struct AdjListNode* newNode = (struct AdjListNode*) malloc(sizeof(struct AdjListNode));
    newNode->dest = dest;
    newNode->next = NULL;
    return newNode;
}

struct Graph* createGraph(int V) {
    struct Graph* graph = (struct Graph*) malloc(sizeof(struct Graph));
    graph->V = V;
    graph->array = (struct AdjList*) malloc(V * sizeof(struct AdjList));
    for (int i = 0; i < V; ++i)
        graph->array[i].head = NULL;
    return graph;
}

void addEdge(struct Graph* graph, int src, int dest, int isUndirected) {
    struct AdjListNode* newNode = newAdjListNode(dest);
    newNode->next = graph->array[src].head;
    graph->array[src].head = newNode;

    if (isUndirected) {
        newNode = newAdjListNode(src);
        newNode->next = graph->array[dest].head;
        graph->array[dest].head = newNode;
    }
}

void printGraph(struct Graph* graph) {
    for (int v = 0; v < graph->V; ++v) {
        struct AdjListNode* pCrawl = graph->array[v].head;
        printf("Adjacency list of vertex %d\n head ", v);
        while (pCrawl) {
            printf("-> %d", pCrawl->dest);
            pCrawl = pCrawl->next;
        }
        printf("\n");
    }
}

int main() {
    int V = 5;

    struct Graph* graphUndirected = createGraph(V);
    addEdge(graphUndirected, 0, 1, 1);
    addEdge(graphUndirected, 0, 4, 1);
    addEdge(graphUndirected, 1, 2, 1);
    addEdge(graphUndirected, 1, 3, 1);
    addEdge(graphUndirected, 1, 4, 1);

    printf("Adjacency List for Undirected Graph:\n");
    printGraph(graphUndirected);

    printf("\n---------------------------------------\n\n");

    struct Graph* graphDirected = createGraph(V);
    addEdge(graphDirected, 0, 1, 0);
    addEdge(graphDirected, 0, 4, 0);
    addEdge(graphDirected, 1, 3, 0);
    addEdge(graphDirected, 3, 2, 0);
    addEdge(graphDirected, 4, 1, 0);

    printf("Adjacency List for Directed Graph:\n");
    printGraph(graphDirected);

    return 0;
}

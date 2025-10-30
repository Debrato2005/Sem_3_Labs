#include <stdio.h>

#define V 5

void init(int arr[][V]) {
    for (int i = 0; i < V; i++) {
        for (int j = 0; j < V; j++) {
            arr[i][j] = 0;
        }
    }
}

void addEdgeUndirected(int arr[][V], int src, int dest) {
    arr[src][dest] = 1;
    arr[dest][src] = 1;
}

void addEdgeDirected(int arr[][V], int src, int dest) {
    arr[src][dest] = 1;
}

void printAdjMatrix(int arr[][V]) {
    for (int i = 0; i < V; i++) {
        for (int j = 0; j < V; j++) {
            printf("%d ", arr[i][j]);
        }
        printf("\n");
    }
}

int main() {
    int adjMatrixUndirected[V][V];
    int adjMatrixDirected[V][V];

    init(adjMatrixUndirected);
    init(adjMatrixDirected);

    addEdgeUndirected(adjMatrixUndirected, 0, 1);
    addEdgeUndirected(adjMatrixUndirected, 0, 4);
    addEdgeUndirected(adjMatrixUndirected, 1, 2);
    addEdgeUndirected(adjMatrixUndirected, 1, 3);
    addEdgeUndirected(adjMatrixUndirected, 1, 4);
    addEdgeUndirected(adjMatrixUndirected, 2, 3);
    addEdgeUndirected(adjMatrixUndirected, 3, 4);

    printf("Adjacency Matrix for Undirected Graph:\n");
    printAdjMatrix(adjMatrixUndirected);

    printf("\n---------------------------------------\n\n");

    addEdgeDirected(adjMatrixDirected, 0, 1);
    addEdgeDirected(adjMatrixDirected, 0, 4);
    addEdgeDirected(adjMatrixDirected, 1, 3);
    addEdgeDirected(adjMatrixDirected, 3, 2);
    addEdgeDirected(adjMatrixDirected, 3, 4);
    addEdgeDirected(adjMatrixDirected, 4, 1);

    printf("Adjacency Matrix for Directed Graph:\n");
    printAdjMatrix(adjMatrixDirected);

    return 0;
}

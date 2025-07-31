/*Implement a C program to read, display, and find the product of two matrices using
functions with appropriate parameters.
• The matrices must be created using dynamic memory allocation (malloc or
calloc).
• Access matrix elements using array dereferencing (i.e., *(*(mat + i) + j)
style).*/
#include<stdio.h>
#include<stdlib.h>
void readmatrix(int **mat,int r,int c)
{
    for(int i=0;i<r;i++)
{
for(int j=0;j<c;j++)
{
scanf("%d",(*(mat+i)+j));
}
}
}
void displaymatrix(int **mat,int r,int c)
{
for(int i=0;i<r;i++)
{
for(int j=0;j<c;j++)
{
printf(" %d ",*(*(mat+i)+j));
}
printf("\n");
}
}
int main()
{ int r1, c1, r2,c2;
printf("Enter the rows and columns of Mat1:");
scanf("%d,%d",&r1,&c1);
printf("Enter the rows and columns of Mat2:");
scanf("%d,%d",&r2,&c2);
if(c1!=r2)
{
printf("Matrix multiplication not possible...");
}

int **mat1=(int**)malloc(r1*sizeof(int*));
for(int i=0;i<r1;i++)
{
mat1[i]=(int*)malloc(c1*sizeof(int));
}

int **mat2=(int**)malloc(r2*sizeof(int*));
for(int i=0;i<r2;i++)
{
mat2[i]=(int*)malloc(c2*sizeof(int));
}

int **res=(int**)malloc(r1*sizeof(int*));
for(int i=0;i<r1;i++)
{
res[i]=(int*)malloc(c2*sizeof(int));
}

printf("Enter elements for Mat1:");
readmatrix(mat1,r1,c1);
printf("Enter elements for Mat2:");
readmatrix(mat2,r2,c2);

for(int i=0;i<r1;i++)
{
for(int j=0;j<c2;j++)
{
for(int k=0;k<c1;k++)
{
*(*(res+i)+j)+=*(*(mat1+i)+k) * *(*(mat2+k)+j);
}
}
}
printf("Mat1: \n ");
displaymatrix(mat1,r1,c1);
printf("Mat2: \n ");
displaymatrix(mat2,r2,c2);
printf("Product res: \n ");
displaymatrix(res,r1,c2);

for(int i=0;i<r1;i++)
{
free(mat1[i]);
}
free(mat1);

for(int i=0;i<r2;i++)
{
free(mat2[i]);
}
free(mat2);

for(int i=0;i<r1;i++)
{
free(res[i]);
}
free(res);

return 0;
}


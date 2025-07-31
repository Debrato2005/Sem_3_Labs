/*2. Write a recursive C program to implement Selection Sort using pointers.
• The recursive function should sort the array using the Selection Sort algorithm.
• Access and manipulate the array elements using pointers (i.e., avoid using arr[i]
style directly).
• The program should read the array from the user in the main function, call the
recursive sorting function, and display the sorted array.*/
#include<stdio.h>
#include<stdlib.h>
int findminin(int *arr,int start, int n)
{
int minin=start;
for(int i=start+1;i<n;i++)
{
if(*(arr+i)<*(arr+minin))
minin=i;
}
return minin;
}
void selsorrec(int *arr,int start, int n)
{
if(start>n)
{
return;
}
int minin=findminin(arr,start,n);
if(start!=minin)
{
int temp=*(arr+start);
*(arr+start)=*(arr+minin);
*(arr+minin)=temp;
}
selsorrec(arr,start+1,n);
}
int main()
{
int n;
printf("Enter the number of elements:");
scanf("%d",&n);
int *arr=(int*)malloc(n*sizeof(int));
if(arr==NULL)
{
printf("Memory allocation failed...");
}
printf("Enter the elements:");
for(int i=0;i<n;i++)
{
scanf("%d",arr+i);
}
selsorrec(arr,0,n);
printf("Sorted elements are:");
for(int i=0;i<n;i++)
{
printf("%d \n",*(arr+i));
}
free(arr);
return 0;
}

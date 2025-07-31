/*1. Write a small function to find the smallest element in an array using pointers.
In the main function, create a dynamically allocated array, read the values from the
keyboard, and pass the array to the function.
Display the result (smallest element) in the main function.*/
#include<stdio.h>
#include<stdlib.h>
int findsmall(int *arr,int n)
{
int *ptr=arr;
int smallest=*ptr;
for(int i=1;i<n;i++)
{
ptr=arr+i;
if(*ptr<smallest)
smallest=*ptr;
}
return smallest;
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
printf("The smallest element in the given array is : %d",findsmall(arr,n));
free(arr);
return 0;
}


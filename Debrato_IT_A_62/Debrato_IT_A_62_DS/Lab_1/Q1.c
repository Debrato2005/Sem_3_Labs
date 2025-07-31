//1. Given an array of n integers and a key element, write a C program to search the element using linear search.
#include <stdio.h>
#include <stdlib.h>

int main()
{
int c=0,in=0,n,b;
    printf("Enter the number of elements:");
    scanf("%d",&n);
    int arr[n];
    printf("Enter elements:");
    for(int i=0;i<n;i++)
    {
    scanf("%d",&arr[i]);
    }

    printf("Elements are:");
    for(int i=0;i<n;i++)
    {
    printf("%d \n",arr[i]);
    }

    printf("Enter the number to be searched:");
    scanf("%d",&b);

    for(int i=0;i<n;i++)
    {
    if(arr[i]==b)
    {
    in=i;
    c++;
    printf("%d found at index %d and position %d.\n",b,in,(in+1));
    }
    }

    if(c==0)
    {
    printf("%d not found.",b);
    }
    }

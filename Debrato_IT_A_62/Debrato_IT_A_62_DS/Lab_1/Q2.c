// Given an array of integers, implement binary search to find the position of a given key.
#include <stdio.h>
#include <stdlib.h>

int main()
{
int c=0,n,b,temp,mid;
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

    for(int i=0;i<n;i++)
    {
    for(int j=0;j<n-i-1;j++)
    {
    if(arr[j]>arr[j+1])
    {
    temp=arr[j];
    arr[j]=arr[j+1];
    arr[j+1]=temp;
    }
    }
    }
    printf("Sorted elements are:");
    for(int i=0;i<n;i++)
    {
    printf("%d \n",arr[i]);
    }

    printf("Enter the number to be searched:");
    scanf("%d",&b);
    int low=0;
    int high=n-1;
    while(high>=low)
    {
    mid=low +(high-low)/2;
    if (arr[mid]==b)
    {
    c++;
    printf("%d found");
    break;
    }
    else if(b>arr[mid])
    {
    low=mid+1;
    }
    else if(b<arr[mid])
    {
    high=mid-1;
    }
    }
    if(c==0)
    {
    printf("%d not found.",b);
    }
    }

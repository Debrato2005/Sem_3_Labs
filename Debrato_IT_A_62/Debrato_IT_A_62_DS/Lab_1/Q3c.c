//Insertion Sort

#include <stdio.h>
#include <stdlib.h>
int main()
{
int n,temp,key;
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
    for(int i=1;i<n;i++)
    {
    key=arr[i];
    int j=i-1;
    while(j>=0 && arr[j]>key)
    {
    arr[j+1]=arr[j];
    j--;
    }
    arr[j+1]=key;
    }
     printf("\n Sorted elements are:");
    for(int i=0;i<n;i++)
    {
    printf("%d \n",arr[i]);
    }
    }



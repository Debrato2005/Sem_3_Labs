//Bubble Sort

#include <stdio.h>
#include <stdlib.h>
int main()
{
int n,temp;
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
    }

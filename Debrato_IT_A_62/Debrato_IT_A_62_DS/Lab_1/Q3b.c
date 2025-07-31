//Selection Sort

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

    for(int i=0;i<n-1;i++)
    {
    int minin=i;
    for(int j=i+1;j<n;j++)
    {
    if(arr[minin]>arr[j])
    {
    minin=j;
    }
    }
    temp=arr[minin];
    arr[minin]=arr[i];
    arr[i]=temp;
    }
    printf("Sorted elements are:");
    for(int i=0;i<n;i++)
    {
    printf("%d \n",arr[i]);
    }
    }






/*2. Write a C program to define a student structure with the data members to store name,
roll no and grade of the student. Also write the required functions to read, display, and
sort student information according to the roll number of the student. All the member
functions will have array of objects as arguments.*/
#include<stdio.h>
#include<string.h>
struct student
{
char name[50];
int roll;
char grade;
};
void read(struct student s[],int n)
{
for(int i=0;i<n;i++)
{
printf("enter name,roll,grade: \n");
scanf("%s %d %c",s[i].name,&s[i].roll, &s[i].grade);
}
}
void display(struct student s[],int n)
{
for(int i=0;i<n;i++)
{
printf("name: %s | roll: %d | grade: %c \n",s[i].name,s[i].roll, s[i].grade);
}
}
void sort(struct student s[],int n)
{
struct student temp;
for(int i=0;i<n-1;i++)
{
for(int j=i+1;j<n;j++)
{
if(s[i].roll>s[j].roll)
{
temp=s[i];
s[i]=s[j];
s[j]=temp;
}
}
}
}
int main()
{
int n;
printf("enter no. of students: \n");
scanf("%d",&n);
struct student stu[n];
read(stu,n);
printf("before sort \n");
display(stu,n);
sort(stu,n);
printf("after sort \n");
display(stu,n);
}

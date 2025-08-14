/*3. Define a structure Student with the following members:
char name [50] – to store student name as a string
int roll_no – to store roll number
float marks – to store marks
Write a C program that:
i. Reads the details of ‘n’ students using a function that uses pointer to structure
as an argument.
ii. Displays the details of all students using a separate function.
iii. Finds and displays the student with the highest marks using pointer-based
access.*/
#include<stdio.h>
#include<string.h>
struct student
{
char name[50];
int roll;
float marks;
};
void read(struct student *s,int n)
{
for(int i=0;i<n;i++)
{
printf("enter name,roll,marks:");
scanf("%s %d %f",(s+i)->name,&(s+i)->roll, &(s+i)->marks);
}
}
void display(struct student *s,int n)
{
for(int i=0;i<n;i++)
{
printf("name: %s | roll: %d | marks: %f \n",(s+i)->name,(s+i)->roll, (s+i)->marks);
}
}
void highest(struct student *s,int n)
{
int max=0;
for(int i=1;i<n;i++)
{
if((s+i)->marks>(s+max)->marks)
{
max=i;
}
}
printf("student with highest marks: \n name: %s | roll: %d | marks: %f \n",(s+max)->name,(s+max)->roll, (s+max)->marks);
}
int main()
{
int n;
printf("enter no. of students: \n");
scanf("%d",&n);
struct student stu[n];
read(stu,n);
display(stu,n);
highest(stu,n);
}

/*1. Write a program to perform following string operations without using string
handling functions:
a.) length of the string
b.) string concatenation
c.) string comparison
d.) to insert a sub string
e.) to delete a substring*/

#include<stdio.h>
int length(char *str)
{
int n=0;
while(str[n]!='\0')
{
n++;
}
return n;
}
void concat(char *s1, char *s2)
{
int i=length(s1);
int j=0;
while(s2[j]!='\0')
{
s1[i++]=s2[j++];
}
s1[i]='\0';
}
int compare(char *s1, char *s2)
{
int i=0;
while(s1[i]!='\0'&&s2[i]!='\0')
{
if(s1[i]!=s2[i])
{
return 0;
}
i++;
}
return 1;
}
void insert(char *str, char *sub, int pos)
{
char temp[100];
int i=0;
int len=length(str);
int sublen=length(sub);
for(i=0;i<pos;i++)
{temp[i]=str[i];}
for(int j=0;j<sublen;j++)
{
temp[i++]=sub[j];}
int k = pos;
while(str[k] != '\0')
{
temp[i++] = str[k++];
}
temp[i]='\0';
i=0;
while(temp[i]!='\0')
{
str[i]=temp[i];
i++;
}
}
/*void delete(char *str, char *sub)
{
char temp[100];
int i=0; int j=0;int f=0; int pos=0;
int len=length(str);
int sublen=length(sub);
int var=sublen;
for(i=0;i<len;i++)
{ int c=0; j=i;
if(str[i]==sub[i])
{
while(var!=0)
{
if(str[j]!=sub[j])
{
c++;
f++;
break;
}
for(j=i;j<(sublen+i);j++)
j++;
var--;
}
if(c==0&&f==0)
{
pos=i;
break;
}
}
}
if(f==0)
{ for(i=0;i<pos;i++)
{temp[i]=str[i];}
var=sublen;
i=len;
while(var!=0)
{str[i]='\0';
i++;
var--;
}
for(i=pos;i<len;i++)
{
temp[i]=str[i+sublen];
}
for(i=0;i<(len-pos);i++)
{
str[i]=temp[i];
}
}
else{
printf("substring not found");}
}*/
void delete(char *str, char *sub)
{
    int len = length(str);
    int sublen = length(sub);
    int i, j;
    int found = 0;
    int pos = -1;
    for(i = 0; i <= len - sublen; i++) {
        int match = 1;
        for(j = 0; j < sublen; j++) {
            if(str[i+j] != sub[j]) {
                match = 0;
                break;
            }
        }
        if(match) {
            pos = i;
            found = 1;
            break;
        }
    }

    if(!found) {
        printf("substring not found\n");
        return;
    }
    char temp[200];
    int idx = 0;
    for(i = 0; i < pos; i++) {
        temp[idx++] = str[i];
    }
    for(i = pos + sublen; i < len; i++) {
        temp[idx++] = str[i];
    }
    temp[idx] = '\0';
    for(i = 0; i <= idx; i++) {
        str[i] = temp[i];
    }
}

int main()
{ int a;int pos;  char s1[200], s2[200];
printf("enter 1 for length , 2 to concat, 3 to compare, 4 to insert , 5 to delete, 0 to exit:");
do
{
scanf("%d",&a);
switch(a)
{
case 1:
{
printf("enter string");
scanf("%s", s1);
printf("length= %d",length(s1));
break;
}
case 2:
{
printf("enter 2 strings");
scanf("%s %s", s1,s2);
concat(s1,s2);
printf("concat= %s",s1);
break;
}
case 3:
{
printf("enter 2 strings");
scanf("%s %s", s1,s2);
printf("comparison= %d",compare(s1,s2));
break;
}
case 4:
{
printf("enter 2 strings and pos");
scanf("%s %s %d", s1,s2,&pos);
insert(s1,s2,pos);
printf("inserted= %s",s1);
break;
}
case 5:
{
printf("enter 2 strings");
scanf("%s %s", s1,s2);
delete(s1,s2);
printf("deleted= %s",s1);
break;
}
}
}
while(a!=0);
}

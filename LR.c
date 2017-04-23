#include<stdio.h>
#include<string.h>

void lr(char[][50],int);
int main()
{
	char input[10][50];
	int n,i;

	printf("Enter the number of Productions: ");
	scanf("%d",&n);

	printf("Enter the Productions\n");
	for (i = 0; i < n; ++i)
		scanf("%s",input[i]);
	
	for (i = 0; i < n; ++i)
		lr(input,i);
}

void lr(char input[][50], int k)
{
	char *l,*r,*temp,tempprod[20],productions[25][50];
    int i=0,j=0,flag=0;
    l = strtok(input[k],"->");
    r = strtok(NULL,"->");
    temp = strtok(r,"|");
    printf("\nProduction:%s\n",input[k]);
    while(temp)  {
        if(temp[0] == l[0])  {
            flag = 1;
            sprintf(productions[i++],"%s'->%s%s'",l,temp+1,l);
        }
        else
            sprintf(productions[i++],"%s->%s%s'",l,temp,l);
        temp = strtok(NULL,"|");
    }
    sprintf(productions[i++],"%s'->epsilon\n",l);
    if(flag == 0)
        printf("The given productions don't have Left Recursion\n");
    else
        for(j=0;j<i;j++)  {
            printf("\n%s",productions[j]);
}
}

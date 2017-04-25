/* Program to recognize and count the number of identifiers in a given input file using flex tool*/
%{
#include<stdio.h>
int count=0;
%}
op [+\-\*\/\=\^\%\<\>]
letter [a-zA-Z_]
digit [0-9]+
id {letter}+({letter}|{digit})*

%%
[%\t()]+ ;
auto|double|if|static|break|else|int|struct|case|enum|long|switch|char|extern|near|typedef|const|float|continue|register|union|unsigned|void|while|default|do|goto|signed|while|signed|unsigned {printf("%s is a keyword\n",yytext);}
{op} {printf("%s is an operator\n",yytext);}
{id} {printf("%s is an identifier\n",yytext);count++;}
{digit} {printf("%s is not an identifier\n",yytext);}

%%
int main()
{
FILE *fp;
char file[10];
printf("Enter the filename: ");
scanf("%s",file);
fp=fopen(file,"r");
yyin=fp;
yylex();
printf("Total Number of identifiers are = %d\n",count);
return 0;
}

/* Program to recognize and count the number of identifiers in a given input file using flex tool*/
%{
#include<stdio.h>
int count=0;
%}
op [+-*/]
letter [a-zA-Z]
digit [0-9]
id {letter}+({letter}|{digit})*
notid {digit}+{id}

%%
[\t\n]+ ;
("int")|("float")|("char")|("case")|("default")|("if")|(“else”)|(“then”)|(“while”)|("for")|("printf")|("scanf") {printf("%s IS A KEYWORD\n",yytext);}
{id} {printf("%s IS AN IDENTIFIER\n",yytext);count++;}
{notid} {printf("%s IS NOT AN IDENTIFIER\n",yytext);}

%%
int main()
{
FILE *fp;
char file[10];
printf("ENTER THE FILENAME:\n");
scanf("%s",file);
fp=fopen(file,"r");
yyin=fp;
yylex();
printf("TOTAL IDENTIFIERS ARE=%d\n",count);
return 0;
}

/*program to count no. of vowels and consonents in agiven string using flex tool */
%{
#include<stdio.h>
int vowels = 0;
int consonants = 0;
%}

%%
[ \t\n]+ ;
[aeiouAEIOU] vowels++;
[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ] consonants++;

%%
void main()
{
yylex();
printf("The Number of vowels = %d\n", vowels);
printf("The Number of consonants = %d \n", consonants);
}

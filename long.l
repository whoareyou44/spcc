/*find a longest word in a program using flex tool*/
%{
#include <strings.h>
int longest = 0;
char longword[60];
%}

%%
[a-zA-Z]+ { if (yyleng > longest) {
			longest = yyleng;
			strcpy (longword, yytext);
			}
		}

%%
int main (int argc[],char**argv[]) {
yyin = fopen("sample.txt","r");
yylex ();
printf ("The longest word was \"%s\" \nwhich was %d characters long.\n",
longword, longest);
return 0;
}

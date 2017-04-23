%{
    #include<stdio.h>
    int flag=0;
%}

%token NUMBER
%left '+' '-'
%%
ArithmeticExpression: E{
         printf("\nResult=%d\n",$$);
         return 0;
        }
E:E'+'E {$$=$1+$3;}
 |E'-'E {$$=$1-$3;}
 | NUMBER {$$=$1;}
;

%%
void main()
{
   printf("Enter Any Arithmetic Expression which can have operations Addition, Subtraction:");
   yyparse();
  if(flag==0)
   printf("Entered arithmetic expression is Valid\n");
}
void yyerror()
{
   printf("Entered arithmetic expression is Invalid\n");
   flag=1;
}

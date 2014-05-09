%option noyywrap
%{
#include<stdio.h>
int chars = 0;
int lines = 0;
%}

%%
. {
	++chars;
}
\n {
	++lines;
	++chars;
}


%%

int main(int arc, char *argv[])
{
	printf("Ctrl+C to stop input.\n");
	yylex();
	printf("lines:%d chars:%d\n",lines,chars);
	return 0;
}

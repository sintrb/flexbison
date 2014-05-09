%option noyywrap yylineno caseless
%{
#include "calculator.h"


#define RTK(tk)	D(#tk); D(" ");return tk;
%}

%%


"+" {
	O("+");
	RTK(ADD);
}

"-" {
	O("-");
	RTK(SUB);
}

"*" {
	O("*");
	RTK(MUL);
}

"/" {
	O("/");
	RTK(DIV);
}

"=" {
	O("=");
	RTK(EQU);
}

[0-9]+\.[0-9]+ {
	O(yytext);
	RTK(NUM);
}

[0-9]+ {
	O(yytext);
	RTK(NUM);
}

[a-zA-Z]+ {
	O(yytext);
	RTK(VAR);
}

[ t] {
	
}

[\n] {
	RTK(BR);
}

%%

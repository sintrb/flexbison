%option noyywrap yylineno caseless
%{
#include "calculator.h"


#define RTK(tk)	D(#tk); D(" ");return tk;
%}

%%


"+" {
	RTK(ADD);
}

"=" {
	RTK(EQU);
}

[0-9]+ {
	RTK(NUM);
}

[a-zA-Z]+ {
	RTK(VAR);
}

[ t] {
	
}

[\n] {
	D("\n");
}

%%

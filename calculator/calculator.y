%{
#include "calculator.h"
%}

%token ADD NUM VAR EQU

%%

lines
	: line
	| lines line
;

line
	: set
	| exp
;

set
	: VAR EQU NUM {

	}
;

exp
	: NUM ADD NUM {

	}

	| exp ADD NUM {

	}
;
%%

int main(){
	yyparse();
	return 0;
}

void yyerror(char *e){
	printf("%s:%d\n",e,yylineno);
}


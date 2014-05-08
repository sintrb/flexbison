%{
#include "calculator.h"
%}


%union{
	t_var num;
	char * var;
}

%token <t_var> NUM
%token <var> VAR
%token ADD EQU BR

%type <num> term exp varline

%type <var> name;

%%

lines
	: line
	| lines line
;

line
	: set
	| varline
;

set
	: name EQU term {
		var_set($1, $3);
	}
;

term
	: NUM {
		$$ = atoi(yytext);
	}
;

name
	: VAR {
		$$ = str_clone(yytext);
	}
;

exp
	: term ADD term {
		$$ = $1 + $3;
	}

	| exp ADD term {
		$$ = $1 + $3;
	}
;

varline
	: exp BR {
		printf("%d\n", $$);
	}
%%

int main(){
	yyparse();
	return 0;
}

void yyerror(char *e){
	printf("%s:%d\n",e,yylineno);
}


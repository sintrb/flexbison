%{
#include "calculator.h"
%}


%union{
	t_var num;
	char * var;
}

%token <t_var> NUM
%token <var> VAR
%token EQU BR

%token ADD SUB MUL DIV BL BR

%type <num> exp
%type <var> varname


%left ADD SUB
%left MUL DIV

%%

lines
	: line
	| lines line
;

line
	: BR
	| exp BR {
		O("=%d\n", $1);
	}
	| varname EQU exp {
		var_set($1, $3);
		free($1);
		$1=NULL;
		O("\n");
	}
;

varname
	: VAR {
		$$ = str_clone(yytext);
	}
;

exp
	: NUM {
		$$ = atoi(yytext);
	}
	
	| BL exp BR {
		$$ = $2;
	}

	| varname {
		$$ = var_val($1);
	}

	| exp ADD exp {
		$$ = $1 + $3;
	}

	| exp SUB exp {
		$$ = $1 - $3;
	}

	| exp MUL exp {
		$$ = $1 * $3;
	}

	| exp DIV exp {
		$$ = $1 / $3;
	}
;

%%

int main(){
	yyparse();
	return 0;
}

void yyerror(char *e){
	E("%s:%d\n",e,yylineno);
}


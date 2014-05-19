%option yylineno caseless

%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#define MAX_INCLUDE_DEEP	20	// max deep of include file

#define ERR(fmt,args...)	printf(fmt, ##args)
extern "C" int yywrap(void);

YY_BUFFER_STATE stas[MAX_INCLUDE_DEEP];
int sta_index = -1;

void incfile(const char *filename){
	FILE *fp = NULL;
	if(sta_index < MAX_INCLUDE_DEEP){
		++sta_index;
		fp = fopen(filename, "r");
		if(fp){
			yyin = fp;
			stas[sta_index] = yy_create_buffer(yyin, YY_BUF_SIZE);
			yy_switch_to_buffer(stas[sta_index]);
			yyrestart(yyin);
		}
		else{
			ERR("open %s failed", filename);
		}
	}
}

int yywrap(){
	if(sta_index>0){
		yy_delete_buffer(YY_CURRENT_BUFFER);
		--sta_index;
		yy_switch_to_buffer(stas[sta_index]);
		return 0;
	}
	else{
		return 1;
	}
}

%}

%%

. {
	// output
	if(yytext[0]>='a' && yytext[0]<='z')
		yytext[0] = yytext[0]+ 'A' - 'a';
	printf("%s", yytext);
}

#include[ \t][a-zA-Z0-9_\.]+ {
	// using flex & bison maybe more usefull.
	// but nothing, it's just a demo
	char *filename = yytext + 8; // offset of len("#include")
	while(*filename && (*filename==' ' || *filename=='\t'))
		++filename;
	incfile(filename);
}

%%

int main(int arc, char *argv[])
{
	if(arc>1)
		incfile(argv[1]);
	yylex();
	return 0;
}

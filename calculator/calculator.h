#ifndef ALL_H
#define ALL_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// #define D printf
#define D 
#define O printf
// #define O
#define E(_fmt,args...) fprintf(stderr, _fmt, ##args)
#define MAX_VAR_SIZE	100

void yyerror(char *e);
int yylex();

extern int yylineno;
extern char * yytext;

typedef int t_var;



extern char *var_names[MAX_VAR_SIZE];
extern t_var var_vals[MAX_VAR_SIZE];


char * str_clone(const char *s);

int var_inx(const char *name);
t_var var_val(const char *name);
t_var var_valof(int ix);
int var_set(const char *name, t_var val);

#include "calculator.tab.h"
#endif



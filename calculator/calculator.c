#include "calculator.h"



char *var_names[MAX_VAR_SIZE] = {NULL};
t_var var_vals[MAX_VAR_SIZE] = {0};



char * str_clone(const char *s){
	char *rs = (char *)malloc(strlen(s)+1);
	strcpy(rs, s);
	return rs;
}

int var_inx(const char *name){
	int i;
	for (i = 0; i < MAX_VAR_SIZE; ++i){
		if (var_names[i] && strcmp(var_names[i], name)==0)
			return i;
	}
	D("no(%s)", name);
	return -1;
}
t_var var_valof(int ix){
	if(ix>=0 && ix<MAX_VAR_SIZE)
		return var_vals[ix];
	else{
		D("no(%d)", ix);
		return 0;
	}
}
int var_set(const char *name, t_var val){
	int i;
	for (i = 0; i < MAX_VAR_SIZE; ++i){
		if (!var_names[i]){
			var_names[i] = str_clone(name);
			var_vals[i] = val;
			return i;
		}
	}
	return -1;
}


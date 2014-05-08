del *.tab.c
del *.tab.h
del lex.yy.c
del *.exe

win_bison -d calculator.y
win_flex calculator.l

gcc -o calculator.exe *.c
type test.txt | calculator.exe



del lex.yy.c
del *.exe

win_flex upper.l
gcc -o upper.exe *.c

upper.exe test.txt

REM pause
del lex.yy.c
del *.exe

win_flex wc.l
gcc -o wc.exe *.c

type test.txt | wc.exe

pause
object:
	yacc -d whileCheck.yacc
	lex whileCheck.lex
	cc lex.yy.c y.tab.c -o obj

clean:
	rm lex.yy.c
	rm y.tab.c
	rm y.tab.h
	rm obj

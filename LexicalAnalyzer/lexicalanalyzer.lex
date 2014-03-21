%{

/*
Name: Karthik Gopalakrishnan
Roll: 1101CS21

Compilers Lab Assignment 2: Question 3
*/

%}

letter [a-zA-Z]
digit [0-9]
intDataType (int|INT)
floatDataType (float|FLOAT)
keyword (if|for|while|read|print|main)
parenthesis \(|\)|\{|\}
semicolon \;
operator ("+"|"-"|"*"|"/"|"%"|"="|"=="|">"|"<")
identifier ({letter}|_)({letter}|{digit}|_)*
intVal ({digit})+
floatVal (({digit})*"."({digit})|({digit})*"."({digit})({digit}))

%%

{intDataType} { printf("Integer Data Type: %s\n", yytext); }
{floatDataType} { printf("Float Data Type: %s\n", yytext); }
{keyword} { printf("Keyword: %s\n", yytext); }
{parenthesis} { printf("Parenthesis: %s\n", yytext); }
{semicolon} { printf("Semicolon: %s\n", yytext); }
{operator} { printf("Operator: %s\n", yytext); }
{identifier} { printf("Identifier: %s\n", yytext); }
{intVal} { printf("Integer: %s\n", yytext); }
{floatVal} { printf("Float: %s\n", yytext); }
. ;

%%

int main()
{
	yylex();
	return 0;
}


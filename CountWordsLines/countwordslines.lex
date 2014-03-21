%{
int noOfLines = 0;
int noOfWords = 0;
%}

line \n
word [^ \t\n]+
space [ ]

%%

{line} {noOfLines++;}
{word} {noOfWords++;}
{space} {}

%%

int main()
{
	yylex();
	printf("Number of lines in the input file: %d\n", noOfLines);
	printf("Number of words in the input file: %d\n", noOfWords);
	return 0;
}


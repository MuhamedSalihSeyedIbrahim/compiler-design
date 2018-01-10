%{
/* C declarations */
#define LT 256
#define LE 257
#define EQ 258
#define NE 259
#define GT 260
#define GE 261
#define RELOP 262
#define ID 263
#define NUM 264
#define IF 265
#define THEN 266
#define ELSE 267
#define WS 268
int attribute;
%}
delim [ \t\n]
ws {delim}+
letter [A-Za-z]
digit [0-9]
id {letter}({letter}|{digit})*
num {digit}+(\.{digit}+)?(E[+\-]?{digit}+)?
%%
{ws} {return(WS);}
if { return(IF); }
then { return(THEN); }
else { return(ELSE); }
{id} { return(ID); }
{num} { return(NUM); }
"<" { attribute = LT; return(RELOP); }
"<=" { attribute = LE; return(RELOP); }
"<>" { attribute = NE; return(RELOP); }
"=" { attribute = EQ; return(RELOP); }
">" { attribute = GT; return(RELOP); }
">=" { attribute = GE; return(RELOP); }
%%
int yywrap() /* lex expects this function -- it is */
{ /* called whenever EOF is read*/
return 1;
}
int main()
/* main function for the scanner*/
{
	int token;
	while(token = yylex()) {
  	  //printf("(%s - %d, ",yytext, token);
	  switch(token) {
		case ID: 
			printf("(ID - %s - %d )\n", yytext,token);
			break;
		case NUM:
			printf("(NUM - %s - %d )\n",yytext, token);
			break;
		case RELOP:
			printf("(RELOP - %s - %d )\n", yytext,attribute);
			break;
		case WS:
		    	break;
		default:
			printf("(%s - %d )\n",yytext,token);
			break;
	  }
	}
	return 0;
}

/*
Execution Steps:
$lex ex3.lex.l
$gcc lex.yy.c
$./a.out
SAMPLE INPUT & OUTPUT
Sample input:
   if (a<=10)
Sample output:
if (a<=10)
(if - 265 )
((ID - a - 263 )
(RELOP - <= - 257 )
(NUM - 10 - 264 )
)
*/

/* Alunos: Marlon Baptista de Quadros */
%%

%{
  private int comment_count = 0;

  private AsdrSample yyparser;

  public Yylex(java.io.Reader r, AsdrSample yyparser) {
    this(r);
    this.yyparser = yyparser;
  }
%}

%integer
%line
%char

WHITE_SPACE_CHAR=[\n\r\ \t\b\012]

%%

"$TRACE_ON"   { yyparser.setDebug(true); }
"$TRACE_OFF"  { yyparser.setDebug(false); }

"data"	{ return AsdrSample.DATA; }
"prova"	 	{ return AsdrSample.PROVA; }
[0-9][0-9][0-9]\-[0-9]		  { return AsdrSample.MATR; }

[:jletter:][:jletterdigit:]* { return AsdrSample.IDENT; }

[0-9]+(\.[0-9]+)* 	{ return AsdrSample.NUM; }


"." |
"," |
"(" |
")"    	{ return yytext().charAt(0); }


{WHITE_SPACE_CHAR}+ { }

. { System.out.println("Erro lexico: caracter invalido: <" + yytext() + ">"); }

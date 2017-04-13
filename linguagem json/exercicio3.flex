%%


%public
%class AnalisadorJSON
%integer
%unicode
%line
%ignorecase


%{

public static int STRING = 257;
public static int NUMBER = 258;
public static int O_BEGIN = 259;
public static int O_END = 260;
public static int A_BEGIN = 261;
public static int A_END = 262;
public static int COMMA = 263;
public static int COLON = 264;


/**
   * Runs the scanner on input files.
   *
   * This is a standalone scanner, it will print any unmatched
   * text to System.out unchanged.
   *
   * @param argv   the command line, contains the filenames to run
   *               the scanner on.
   */
  public static void main(String argv[]) {
    AnalisadorJSON scanner;
    if (argv.length == 0) {
      try {        
          scanner = new AnalisadorJSON( System.in );
	  int line;
          while ( !scanner.zzAtEOF ){
		line = scanner.yyline+1;
	        System.out.println("Line: "+line+" token: "+scanner.yylex()+"\t<"+scanner.yytext()+">");
	  }
        }
        catch (Exception e) {
          System.out.println("Unexpected exception:");
          e.printStackTrace();
        }
        
    }
    else {
      for (int i = 0; i < argv.length; i++) {
        scanner = null;
        try {
          scanner = new AnalisadorJSON( new java.io.FileReader(argv[i]) );
	  int line;
          while ( !scanner.zzAtEOF ){
		line = scanner.yyline+1;
                System.out.println("Line: "+line+" token: "+scanner.yylex()+"\t<"+scanner.yytext()+">");
	  }
        }
        catch (java.io.FileNotFoundException e) {
          System.out.println("File not found : \""+argv[i]+"\"");
        }
        catch (java.io.IOException e) {
          System.out.println("IO error scanning file \""+argv[i]+"\"");
          System.out.println(e);
        }
        catch (Exception e) {
          System.out.println("Unexpected exception:");
          e.printStackTrace();
        }
      }
    }
  }

%}

DIGIT1to9= [1-9] /* Digitos de 1 até 9 */
DIGIT= [0-9] /* Digitos de 0 até 9 */
DIGITS= {DIGIT}+ /* Sequência de Digitos de 0 até 9 */
INT= {DIGIT}|{DIGIT1to9}{DIGITS}|-{DIGIT}|-{DIGIT1to9}{DIGITS} /* Números inteiros, incluindo positivos e negativos */
FRAC= [.]{DIGITS} /* Números fracionados */
HEX_DIGIT= [0-9a-f]
NUMBER= {INT}|{INT}{FRAC} /* Números */
UNESCAPEDCHAR= [ -!#-\[\]-~]
ESCAPEDCHAR= [\/bfnrt]
UNICODECHAR= \\u{HEX_DIGIT}{HEX_DIGIT}{HEX_DIGIT}{HEX_DIGIT}
CHAR= {UNESCAPEDCHAR}|{ESCAPEDCHAR}|{UNICODECHAR}
CHARS= {CHAR}+
DBL_QUOTE= [\"]
WHITESPACE= [ \t\n]+ /* ignore whitespace */

%%



{DBL_QUOTE}{DBL_QUOTE} |
{DBL_QUOTE}{CHARS}{DBL_QUOTE} {
    return STRING;
}
{NUMBER} {
    return NUMBER;
}
\{ {
    return O_BEGIN;
}

\} {
    return O_END;
}

\[ {
    return A_BEGIN;
}

\] {
    return A_END;
}

, {
    return COMMA;
}
: {
    return COLON;
}
{WHITESPACE}*               { }
. {System.out.println(yyline+1 + ": caracter invalido: "+yytext());}


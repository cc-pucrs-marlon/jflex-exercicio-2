JFLEX  = java -jar JFlex.jar
JAVAC  = javac
JAVARUN = java -cp .

# targets:

all: AsdrSample.class

clean:
	rm -f *~ *.class Yylex.java

AsdrSample.class: AsdrSample.java Yylex.java
	$(JAVAC) AsdrSample.java

Yylex.java: asdr_lex.flex
	$(JFLEX) asdr_lex.flex

# Exemplos corretos:
# teste01.txt
# teste02.txt
# teste03.txt
# teste04.txt
# teste05.txt

test:
	$(JAVARUN) AsdrSample teste01.txt
	$(JAVARUN) AsdrSample teste02.txt
	$(JAVARUN) AsdrSample teste03.txt
	$(JAVARUN) AsdrSample teste04.txt
	$(JAVARUN) AsdrSample teste05.txt

# Exemplos com erros:
# teste06.txt
# teste07.txt
# teste08.txt
# teste09.txt
# teste10.txt

test-fail:
	$(JAVARUN) AsdrSample teste06.txt

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

test:
	$(JAVARUN) AsdrSample teste01.txt
	$(JAVARUN) AsdrSample teste02.txt
	$(JAVARUN) AsdrSample teste03.txt
	$(JAVARUN) AsdrSample teste04.txt

test-fail:
	$(JAVARUN) AsdrSample teste05.txt

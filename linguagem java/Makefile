JFLEX  = java -jar JFlex.jar
JAVAC  = javac
JAVA  = java

# targets:

all: AsdrSample.class

clean:
	rm -f *~ *.class Yylex.java

success:
	$(JAVA) -cp . AsdrSample tests_success/$(filename)

fail:
	$(JAVA) -cp . AsdrSample tests_fail/$(filename)

AsdrSample.class: AsdrSample.java Yylex.java
	$(JAVAC) AsdrSample.java

Yylex.java: asdr_lex.flex
	$(JFLEX) asdr_lex.flex

#! /bin/bashecho "STARTING JFLEX COMPILING"
echo "STARTING JFLEX COMPILING"
java -jar jflex-full-1.9.1.jar -d ../../java/org/example lexer.jflex

echo "STARTING CUP COMPILING"
java -jar java-cup-11b.jar -parser Parser parser.cup

mv Parser.java ../../java/org/example/Parser.java

mv sym.java ../../java/org/example/sym.java

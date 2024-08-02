package org.example;

import java.io.StringReader;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        Lexer lexer = new Lexer(new StringReader("110,111,1000,1001,1011"));
        Parser parser = new Parser(lexer);
        try {
            parser.parse();
        } catch (Exception e) {
            System.out.println("error");
            System.out.println(e.getMessage());
        }
    }
}
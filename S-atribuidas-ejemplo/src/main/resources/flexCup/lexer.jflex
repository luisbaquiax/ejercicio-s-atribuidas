
/* codigo de usuario */
package org.example;

import java.util.*;
import java.io.StringReader;

import java_cup.runtime.*;

%% //separador de area

%class Lexer
%public
%cup
%full
%line
%column
//%char

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace     = {LineTerminator} | [ \t\f]+

    /* comments */
Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}

TraditionalComment   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
    // Comment can be the last line of the file, without line terminator.
 EndOfLineComment     = "//" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/**" {CommentContent} "*"+ "/"
CommentContent       = ( [^*] | \*+ [^/*] )*

/* expresiones regulares */
UNO = "1"
CERO = "0"
COMA = ","

%{

    private Symbol symbol(int type) {
        return new Symbol(type, yyline+1, yycolumn+1);
    }

    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline+1, yycolumn+1, value);
    }

    private Symbol symbol(int type, Object value, int row, int col) {
        return new Symbol(type, row+1, col+1, value);
    }


  private void error(String message) {
    System.out.println("Error en linea line "+(yyline+1)+", columna "+(yycolumn+1)+" : "+message);
  }

%}

%% // separador de areas

/* reglas lexicas */

<YYINITIAL>  {COMA} { return symbol(sym.COMA, yytext()); }
<YYINITIAL>  {UNO} { return symbol(sym.UNO, yytext()); }
<YYINITIAL>  {CERO} { return symbol(sym.CERO, yytext()); }

<YYINITIAL>    {Comment}                       {/* ignoramos */}

<YYINITIAL>    {WhiteSpace} 	                {/* ignoramos */}


/* error fallback */

[^]                              { System.out.println("error-lexico: " + yytext()); }

<<EOF>>                 { return symbol(sym.EOF); }

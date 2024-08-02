package org.example;

public class Reduccion {
    private int value;
    private int exponente;
    private int decimal;

    public Reduccion() {
    }

    public Reduccion(int value, int exponente, int decimal) {
        this.value = value;
        this.exponente = exponente;
        this.decimal = decimal;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public int getExponente() {
        return exponente;
    }

    public void setExponente(int exponente) {
        this.exponente = exponente;
    }

    public int getDecimal() {
        return decimal;
    }

    public void setDecimal(int decimal) {
        this.decimal = decimal;
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 *
 * @author Pedro Ventola
 */
public class Carrinho {

    private String id = UUID.randomUUID().toString();
    private int idAlimento = 0;
    private float valorTotal;
    private String idUsuario = "";

    // Construtor
    public Carrinho(float valotTotal, String idUsuario, int idAlimento) {
        this.idAlimento = idAlimento;
        this.idUsuario = idUsuario;
        this.valorTotal = valorTotal;
    }

    public Carrinho() {
        this.idAlimento = 0;
        this.idUsuario="";
        this.valorTotal = 0f;
    }

    public int getIdAlimento() {
        return idAlimento;
    }

    public void setIdAlimento(int idAlimento) {
        this.idAlimento = idAlimento;
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
    }

    public float getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(float valorTotal) {
        this.valorTotal = valorTotal;
    }

    public String getId() {
        return id;
    }
}

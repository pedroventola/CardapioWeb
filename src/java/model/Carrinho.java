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
    private List<Alimento> itens;
    private float valorTotal;

    // Construtor
    public Carrinho(List<Alimento> itens, float valotTotal) {
        this.itens = itens;
        this.valorTotal = valorTotal;
    }  

    public Carrinho() {
        this.itens = new ArrayList<Alimento>();
        this.valorTotal = 0f;
    }
    
//get e set
    public List<Alimento> getItens() {
        return itens;
    }

    public void setItens(List<Alimento> itens) {
        this.itens = itens;
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

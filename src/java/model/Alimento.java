/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
/**
 *
 * @author Pedro Ventola
 */

//atributos
public class Alimento{
    
    private int Id;
    private String nome;
    private String descricao;
    private String imagem;
    private float valor;
    
    // Construtor
    public Alimento(String nome, String descricao, String imagem, float valor,int id) {
       this.Id = id;
        this.nome = nome;
        this.descricao = descricao;
        this.imagem = imagem;
        this.valor = valor;
        
    }
    
    public Alimento() {
        this.Id = 0;
        this.nome = "";
        this.descricao = "";
        this.imagem = "";
        this.valor = 0f;
       
    }
//get e set

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }


    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }


    
 
    
}
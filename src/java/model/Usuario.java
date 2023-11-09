/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.UUID;

/**
 *
 * @author Pedro Ventola
 */
public class Usuario {

    String id = UUID.randomUUID().toString();
    private String nome;
    private String senha;
    private String email;
    private String endereco;

    // Construtor
    public Usuario(String nome, String senha, String email, String endereco) {
        this.nome = nome;
        this.senha = senha;
        this.email = email;
        this.endereco = endereco;
    }

    public Usuario() {
        this.nome = "";
        this.senha = "";
        this.email = "";
        this.endereco = "";
    }
//get e set

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;
import java.sql.*;
import model.Carrinho;
import model.Usuario;
import util.ConectaDB;

/**
 *
 * @author alunos
 */
// Data Access Object
public class CarrinhoDAO {
    //Atrib.

    //Métodos
    public boolean adicionar(Carrinho carrinho) {
        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
           

            //INSERT into funcionario(matric, nome, cargo, end_cep, end_comp) values('123','Garibaldi','Diretor', 'Av. Japão','Predio A - n.1234');            
            String sql = "INSERT into carrinho(id_carrinho,id_alimento, valorTotal, id_usuario) "
                    + "values('" + carrinho.getId()+ "','" + carrinho.getIdAlimento()+ "','" + carrinho.getValorTotal()
                    + "', '" + carrinho.getIdUsuario()  + "')";

            stmt.executeUpdate(sql); // Insert, Delete ou Update            
            System.out.println(" Registro Inserido! ");
            conexao.close();
            return true;

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(" Exception: " + ex.toString());
            return false;
        }
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Carrinho;
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
                    + "values('" + carrinho.getId() + "','" + carrinho.getIdAlimento() + "','" + carrinho.getValorTotal()
                    + "', '" + carrinho.getIdUsuario() + "')";

            stmt.executeUpdate(sql); // Insert, Delete ou Update            
            System.out.println(" Registro Inserido! ");
            conexao.close();
            return true;

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(" Exception: " + ex.toString());
            return false;
        }
    }

    public List<Carrinho> consultarPorUsuario(String idUsuario) {
        Connection conexao = null;
        List<Carrinho> carrinhos = new ArrayList<>();

        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();

            String sql = "SELECT * FROM carrinho WHERE id_usuario = '" + idUsuario + "'";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Carrinho carrinho = new Carrinho();
                carrinho.setIdAlimento(rs.getInt("id_alimento"));
                carrinho.setValorTotal(rs.getFloat("valorTotal"));
                carrinho.setIdUsuario(rs.getString("id_usuario"));
                carrinhos.add(carrinho);
            }

            conexao.close();
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Exception: " + ex.toString());
        }

        return carrinhos;
    }

    public boolean excluirPorUsuario(String idUsuario) {
        Connection conexao = null;
        PreparedStatement pstmt = null;

        try {
            conexao = ConectaDB.conectar();

            // Use PreparedStatement para evitar SQL injection
            String sql = "DELETE FROM carrinho WHERE id_usuario = ?";
            pstmt = conexao.prepareStatement(sql);

            // Defina o valor do parâmetro
            pstmt.setString(1, idUsuario);

            // Execute a atualização
            pstmt.executeUpdate();

            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(" Exception: " + ex.toString());
            return false;
        } finally {
            // Certifique-se de fechar a conexão e o PreparedStatement no bloco finally
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conexao != null) {
                    conexao.close();
                }
            } catch (SQLException e) {
                System.out.println("Erro ao fechar recursos de banco de dados: " + e.toString());
            }
        }
    }

}

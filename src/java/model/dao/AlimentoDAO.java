/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Alimento;
import util.ConectaDB;

/**
 *
 * @author Pedro Ventola
 */
public class AlimentoDAO {

    // Métodos
    public List<Alimento> consultarTodos() throws ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * from alimento";
            ResultSet rs = stmt.executeQuery(sql);
            List<Alimento> alimentos = new ArrayList<>();
           
            while (rs.next()) {
                Alimento alimento = new Alimento();
                alimento.setNome(rs.getString("nome"));
                alimento.setDescricao(rs.getString("descricao"));
                alimento.setImagem(rs.getString("imagem"));
                alimento.setValor(rs.getFloat("valor"));
                alimentos.add(alimento);
            }
            conexao.close();

            if (alimentos.isEmpty()) {
                return null;
            } else {
                return alimentos;
            }
        } catch (SQLException ex) {
            System.out.println(" Exception: " + ex.toString());
            return null;
        }
    }
}

package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Pedido;
import util.ConectaDB;

public class PedidoDAO {

    public Pedido consultarPorId(String id) throws ClassNotFoundException, SQLException {
        Connection conexao = null;
        Pedido pedido = new Pedido();
        try {
            conexao = ConectaDB.conectar();
            
            // Utilizando PreparedStatement para evitar SQL Injection
            String sql = "SELECT * FROM pedido WHERE id_usuario = ?";
            try (PreparedStatement stmt = conexao.prepareStatement(sql)) {
                stmt.setString(1, id);

                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    pedido.setId(rs.getString("id_pedido"));
                }
            }
            return pedido;
        } catch (SQLException ex) {
            System.out.println("Exception: " + ex.toString());
            throw ex;
        } finally {
            if (conexao != null) {
                conexao.close();
            }
        }
    }
}

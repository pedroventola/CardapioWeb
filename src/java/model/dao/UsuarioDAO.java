package model.dao;

import java.sql.*;
import model.Usuario;
import util.ConectaDB;

/**
 *
 * @author alunos
 */
// Data Access Object
public class UsuarioDAO {
    //Atrib.

    //Métodos
    public boolean cadastrar(Usuario usuario) {
        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();

            //INSERT into funcionario(matric, nome, cargo, end_cep, end_comp) values('123','Garibaldi','Diretor', 'Av. Japão','Predio A - n.1234');            
            String sql = "INSERT into usuario(id_usuario,nome, email, senha,endereco) "
                    + "values('" + usuario.getId() + "','" + usuario.getNome() + "','" + usuario.getEmail()
                    + "', '" + usuario.getSenha() + "','" + usuario.getEndereco() + "')";

            stmt.executeUpdate(sql); // Insert, Delete ou Update            
            System.out.println(" Registro Inserido! ");
            conexao.close();
            return true;

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(" Exception: " + ex.toString());
            return false;
        }
    }

    public Usuario buscarUsuario(String email, String senha) {
        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();

            String sql = "SELECT * FROM usuario WHERE email = '" + email + "' AND senha = '" + senha + "'";

            ResultSet rs = stmt.executeQuery(sql);

            
                if (rs.next()) {
                    Usuario usuario = new Usuario();
                    usuario.setId(rs.getString("id_usuario"));
                    usuario.setNome(rs.getString("nome"));
                    usuario.setEmail(rs.getString("email"));
                    usuario.setSenha(rs.getString("senha"));
                    usuario.setEndereco(rs.getString("endereco"));

                    conexao.close();
                    return usuario;                  
                } else {
                    conexao.close();
                    return null;
                }

            }catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Exception: " + ex.toString());
            return null;
        }
        }

    }

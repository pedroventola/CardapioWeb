/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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
                    + "values('" + usuario.getId()+ "','" + usuario.getNome() + "','" + usuario.getEmail()
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
   /*
    public boolean alterarSenha(Usuario usuario) {
        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();

            //UPDATE funcionario SET nome='João', cargo='Estagiário',end_cep='08544-225',end_comp='Casa 132' WHERE 123            
            String sql = "UPDATE funcionario SET nome='" + funcionario.getNome() + "', cargo='" + funcionario.getCargo()
                    + "',end_cep='" + funcionario.getEnderecoCep() + "',end_comp='" + funcionario.getEnderecoComp()
                    + "' WHERE matric = '" + funcionario.getMatric() + "'";

            stmt.executeUpdate(sql); // Insert, Delete ou Update        
            //System.out.println(" SQL: " + sql);

            System.out.println(" Registro Alterardo com sucesso! ");
            conexao.close();
            return true;

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(" Erro: " + ex.toString());
            return false;
        }
    }
*/
}

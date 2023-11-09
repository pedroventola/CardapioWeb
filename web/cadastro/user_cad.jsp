
<%@page import="model.dao.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h1>Cadastro Usuario</h1>
        
        <%       
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String endereco = request.getParameter("end");
        String senha = request.getParameter("senha");
        
        Usuario usuario = new Usuario();
        String idFormated = usuario.getId().substring(0,7).toUpperCase();
        usuario.setId(idFormated);
        usuario.setNome(nome);
        usuario.setEmail(email);
        usuario.setEndereco(endereco);
        usuario.setSenha(senha);
        
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        
        if (usuarioDAO.cadastrar(usuario) == true){
            out.println("<br> Funcionario cadastrado com sucesso!");
        }else{
            out.println("<br> <b>Funcionario não cadastrado! <b>");
        }       
        
        %>
        
    </body>
</html>

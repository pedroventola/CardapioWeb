<%@page import="model.dao.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <script>
            window.onload = function () {
                
                window.location.href = "../login/index_login.jsp";
            };
        </script>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');

            * {
                font-family: Roboto;
                border: 0;
                margin: 0;
            }

            body {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 100vh;
                position: relative; /* Adicionado para referenciar a posição dos elementos filhos */
            }
            </style>
    </head>
    <body>
        <h1>Cadastro de Usuario</h1>
    
        <%
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String endereco = request.getParameter("endereco");
            String senha = request.getParameter("senha");

            Usuario usuario = new Usuario();
            String idFormated = usuario.getId().substring(0, 7).toUpperCase();
            usuario.setId(idFormated);
            usuario.setNome(nome);
            usuario.setEmail(email);
            usuario.setEndereco(endereco);
            usuario.setSenha(senha);

            UsuarioDAO usuarioDAO = new UsuarioDAO();

            if (usuarioDAO.cadastrar(usuario) == true) {
                out.println("<br> Usuário cadastrado com sucesso!");
                request.getSession().setAttribute("usuario", usuario);
            } else {
                out.println("<br> <b>Usuário não cadastrado! <b>");
            }

        %>

    </body>
</html>

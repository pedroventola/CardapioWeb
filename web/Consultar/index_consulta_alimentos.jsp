<%@page import="model.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.dao.AlimentoDAO"%>
<%@page import="model.Alimento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <style>
            @import url('https://fonts.googleapis.com/css2?family=Sora:wght@100&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Sora:wght@400&display=swap');
            @import url('https://fonts.googleapis.com/css2?family=Sora:wght@600&display=swap');

            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                font-family: 'Sora';
            }

            body {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: start;
                height: 100vh;
            }

            .erro404 {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                text-align: center;
            }

            @media (min-width: 601px) {
                .proximo {
                    display: none;
                }

                .erro404 {
                    display: block;
                }
            }

            .bloco_fundo {
                width: 375px;
                flex-shrink: 0;
                background: linear-gradient(241deg, #131313 0%, #313131 100%);
                padding: 20px;
                box-sizing: border-box;
                display: flex;
                flex-direction: column;
                align-items: center;
                overflow: hidden;
                margin-bottom: 20px;
            }

            .foto_perfil {
                width: 44px;
                height: 44px;
                border-radius: 25%;
            }

            h1,
            h2 {
                font-style: normal;
                line-height: normal;
                margin: 0;
            }

            h1 {
                color: #B7B7B7;
                font-size: 12px;
                font-weight: 400;
                letter-spacing: 0.12px;
                margin-bottom: 5px;
            }

            h2 {
                color: #DDD;
                font-size: 14px;
                font-weight: 600;
            }

            .pesquisa {
                width: 315px;
                height: 52px;
                border-radius: 16px;
                background: #313131;
                box-sizing: border-box;
                margin-top: 20px;
            }

            img {
                width: 155.324px;
                height: 125.727px;
                flex-shrink: 0;
                border-radius: 16px;
                background: cover no-repeat;
            }

            .cardapio {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
            }

            .item-cardapio {
                display: flex;
                flex-direction: column;
                align-items: start;
                margin: 10px;
                background-color: rgb(238, 238, 238);
                border-radius: 15px;
            }

            .valor-cardapio {
                display: flex;
                align-items: center;
            }

            .detalhe-cardapio {
                display: flex;
                justify-items: end;
                flex-direction: column;
                padding-right: 12px;
                padding-left: 12px;
                padding-bottom: 12px;
                gap: 8px;
                width: 100%;
            }

            .botao {
                width: 35.251px;
                height: 30.479px;
                padding: 8px;
                border: none;
                border-radius: 10px;
                background: #C67C4E;
                color: white;
                font-size: 16px;
                cursor: pointer;
                text-align: center;
            }

            .botao-carrinho {
                overflow: hidden;
                position: fixed;
                bottom: -1px;
                border-radius: 24px;
                width: 100%;
                border: none;
                background-color: #C67C4E;
                box-shadow: 0px -10px 24px 0px rgba(228, 228, 228, 0.25);
                align-items: center;
                height: 10%;
            }

            .descricao-comida {
                margin-top: 10px;
            }

            .descricao-comida p:nth-child(1) {
                color: #2F2D2C;
                font-size: 16px;
                font-weight: 600;
            }

            .descricao-comida p:nth-child(2) {
                color: #9B9B9B;
                font-size: 12px;
                font-weight: 400;
            }

            .descricao-comida p:nth-child(3) {
                color: #2F4B4E;
                font-size: 18px;
                font-weight: 600;
            }

            .valor-cardapio p:nth-child(1) {
                color: #2F4B4E;
                font-size: 18px;
                font-weight: 600;
                width: 100%;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cardápio</title>
    </head>

    <body>
        <script>
            function adicionarAoCarrinho(id) {
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "/Cardapio/menu", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
                        alert("Produto adicionado ao carrinho.");
                    }
                };
                xhr.send("idAlimento=" + id);
            }
        </script>
        <script>
            function redirecionarParaTelaPedido() {
                // Adapte o caminho da URL conforme necessário
                window.location.href = "/Cardapio/Consultar/index_carrinho.jsp";
            }
        </script>
        <%
            // Obtendo o usuário da sessão
            Usuario usuario = (Usuario) session.getAttribute("usuario");

            // Se o usuário não estiver na sessão, redirecione para a página de login
            if (usuario == null) {
                response.sendRedirect("../login/index_login.jsp");
            }

            String nomeUsuario = (String) session.getAttribute("nomeUsuario");
        %>
        <div class="erro404">
            <p>Não é possível acessar no computador: Erro 404</p>
        </div>
        <div class="bloco_fundo">
            <img src="../assets/Image.png" class="foto_perfil">
            <h1>Bem-vindo(a)</h1>
            <h2><%=nomeUsuario%></h2>
            <input type="text" class="pesquisa">
        </div>

        <div class="cardapio">

            <%

                AlimentoDAO alimentoDAO = new AlimentoDAO();

                List<Alimento> alimentos = alimentoDAO.consultarTodos();

                for (Alimento alimento : alimentos) {


            %>
            <div class="item-cardapio">
                <img src="..<%= alimento.getImagem()%>">
                <div class="detalhe-cardapio">
                    <div class="descricao-comida">
                        <p><%= alimento.getNome()%></p>
                        <p><%= alimento.getDescricao()%></p>
                    </div>
                    <div class="valor-cardapio">
                        <p><%= alimento.getValor()%></p>
                        <button onclick="adicionarAoCarrinho('<%=alimento.getId()%>')" class="botao">+</button>
                    </div>
                </div>
            </div>

            <%
                }
            %>
        </div>    
        <a>a</a>
        <a>a</a>
        <a>a</a>
        <button onclick="redirecionarParaTelaPedido()" class="botao-carrinho">
            <image style="height: 48px; width: 48px;" src="../assets/carrinho.png"></image>
        </button>
        <script>
            if (window.innerWidth > 600) {
                document.querySelector('.proximo').style.display = 'none';
                document.querySelector('.erro404').style.display = 'block';
            }
        </script>
    </body>
</html>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Usuario"%>
<%@page import="model.dao.UsuarioDAO"%>
<%@page import="model.dao.AlimentoDAO"%>
<%@page import="model.Alimento"%>
<%@page import="java.util.*"%>

<html lang="pt-BR" data-bs-theme="auto">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tela Cardápio</title>
    </head>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Roboto, sans-serif;
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
            align-items: center;
            margin: 10px;
            background-color: rgb(238, 238, 238);
            border-radius: 15px;
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
            margin-top: 10px;
        }

        .descricao-comida {
            text-align: center;
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
    </style>

    <body>
        <div class="erro404">
            <p>Não é possível acessar no computador: Erro 404</p>
        </div>
        <%
            // Obtendo o usuário da sessão
            Usuario usuario = (Usuario) session.getAttribute("usuario");

            // Se o usuário não estiver na sessão, redirecione para a página de login
            if (usuario == null) {
                response.sendRedirect("../login/index_login.jsp");
            }
           
            String nomeUsuario = (String) session.getAttribute("nomeUsuario");
        %>


        <div class="bloco_fundo">
            <img src="assets/Image.png" class="foto_perfil">
            <h1>Bem-vindo(a)</h1>

            <h2><%= usuario.getNome()%></h2>

            <input type="text" class="pesquisa" onclick="">
        </div>
        <div class="cardapio">
            <div class="item-cardapio">
                <img src="assets/tortellini.png">
                <div class="descricao-comida">
                    <p>Tortellini</p>
                    <p>Com brodo</p>
                    <p>R$79,99</p>
                </div>
                <button class="botao">+</button>
            </div>
            <div class="item-cardapio">
                <img src="assets/conchiglione.png">
                <div class="descricao-comida">
                    <p>Conchiglione</p>
                    <p>Ao molho sugo</p>
                    <p>R$60,90</p>
                </div>
                <button class="botao">+</button>
            </div>
            <div class="item-cardapio">
                <img src="assets/drinkvoglio.png">
                     <div class="descricao-comida">
                <p>Drink</p>
                <p>Voglio laurearmi</p>
                <p>R$40,50</p>
            </div>
            <button class="botao">+</button>
        </div>
        <div class="item-cardapio">
            <img src="assets/drinkblue.png">
            <div class="descricao-comida">
                <p>Drink</p>
                <p>Laguna Blu</p>
                <p>R$39,90</p>
            </div>
            <button class="botao">+</button>
        </div>
        <div class="item-cardapio">
            <img src="assets/tiramisu.png">
            <div class="descricao-comida">
                <p>Tiramisu</p>
                <p>Com mascarpone</p>
                <p>R$39.99</p>
            </div>
            <button class="botao">+</button>
        </div>
        <div class="item-cardapio">
            <img src="assets/pizza.png">
            <div class="descricao-comida">
                <p>Pizza</p>
                <p>Tradicional Italiano</p>
                <p>R$72.50</p>
            </div>
            <button class="botao">+</button>
        </div>
    </div>
 <a href="/Cardapio/logout" target="_top">Sair</a> 
    <script>
        if (window.innerWidth > 600) {
            document.querySelector('.proximo').style.display = 'none';
            document.querySelector('.erro404').style.display = 'block';
        }
    </script>
</body>

</html>
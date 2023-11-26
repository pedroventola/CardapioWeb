<%@page import="model.dao.AlimentoDAO"%>
<%@page import="model.Carrinho"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.dao.CarrinhoDAO"%>
<%@page import="model.Alimento"%>
<%@page import="model.Usuario"%>
<%@page import="model.dao.UsuarioDAO"%>
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
                padding-left: 30px;
                padding-right: 30px;
                padding-bottom: 30px;
                padding-top: 16px;
            }

            .container {
                display: flex;
                flex-direction: column;
                gap: 16px;
                height: 100%;
            }

            .title {
                color: #2F2D2C;
                text-align: center;
                font-size: 18px;
                font-style: normal;
                font-weight: 600;
                line-height: normal;
            }

            .sub-title {
                color: #2F2D2C;
                font-size: 16px;
                font-style: normal;
                font-weight: 600;
                line-height: normal;
            }

            .container-endereco {
                display: flex;
                flex-direction: column;
                gap: 8px;
            }

            .text-bold {
                color: #303336;
                font-size: 14px;
                font-style: normal;
                font-weight: 600;
                line-height: normal;
            }

            .text-default {
                color: #808080;
                font-size: 12px;
                font-style: normal;
                font-weight: 400;
                line-height: normal;
            }

            .container-alimentos {
                display: flex;
                gap: 12px;
                align-items: center;
            }

            .container-descricao-alimentos {
                display: flex;
                flex-direction: column;
                gap: 4px;
            }

            .imagem {
                border-radius: 16px;
                width: 54px;
                height: 54px;
            }

            .sub-titlePreco {
                color: #2F2D2C;
                font-size: 14px;
                font-style: normal;
                font-weight: 400;
                line-height: normal;
            }

            .subTitle-alimento {
                color: #9B9B9B;
                font-size: 12px;
                font-style: normal;
                font-weight: 400;
                line-height: normal;
            }

            .botao-carrinho {
                overflow: hidden;
                position: fixed;
                bottom: 30px;
                border-radius: 16px;
                width: 315px;
                border: none;
                background-color: #C67C4E;
                align-items: center;
                padding: 21px 109px;
                color: #FFF;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cardápio</title>
    </head>

<% 
    UsuarioDAO usuarioDAO = new UsuarioDAO(); 
    Usuario usuario = usuarioDAO.obterUsuarioPorId(session.getAttribute("idUsuario").toString());
%>


    <body>
        <script>
            function finalizarPedido() {
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "/Cardapio/finalizarPedido", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (this.readyState === XMLHttpRequest.DONE) {
                        if (this.status === 200) {
                            // Pedido finalizado com sucesso
                            alert(this.responseText);
                            // Redirecionar para a página de pedido finalizado
                            window.location.href = "/Cardapio/tela_pedido.jsp";
                        } else {
                            // Erro ao finalizar o pedido
                            alert("Erro ao finalizar o pedido. Tente novamente.");
                        }
                    }
                };
                xhr.send(); // Não há dados a serem enviados no corpo da requisição
            }
        </script>
        <div style="display: flex; flex-direction: column;">
            <div class="container">
                <h1 class="title">Carrinho</h1>
                <p class="sub-title">Endereço de entrega</p>
                <div class="container-endereco">
<p class="text-bold"><%= usuario.getEndereco() %></p>
                </div>

                <%
                    
                    CarrinhoDAO carrinhoDAO = new CarrinhoDAO();
                    List<Carrinho> resultados = carrinhoDAO.consultarPorUsuario(session.getAttribute("idUsuario").toString());
                    Alimento alimento = new Alimento();
                    AlimentoDAO alimentoDAO = new AlimentoDAO();
                    double totalPagamento = 0;
                    for (Carrinho carrinho : resultados) {
                        int idAlimento = carrinho.getIdAlimento();
                        alimento = alimentoDAO.consultarPorId(idAlimento);

                        totalPagamento += alimento.getValor();                        
                %>

                <div class="container-alimentos">
                    <img src="..<%= alimento.getImagem()%>" class="imagem"><img>
                    <div class="container-descricao-alimentos">
                        <p class="sub-title"><%= alimento.getNome()%></p>
                        <p class="subTitle-alimento"><%= alimento.getDescricao()%></p>
                    </div>
                </div>

                <%
                    }
                %>
            </div>
        </div> 
        <div style="position: fixed;bottom: 150px; width: 85%;">
            <p class="sub-title">Total do pagamento</p>
            <div style="display: flex; width: 100%;">
                <p class="sub-titlePreco">Preço</p>
                <div style="display: flex; width: 100%; justify-content: end;">
                    <p class="sub-titlePreco">R$ <%=String.format("%.2f", totalPagamento)%></p>
                </div>
            </div>
        </div>
        <button onclick="finalizarPedido()" class="botao-carrinho">
            Finalizar Pedido
        </button>        


    </body>
</html>

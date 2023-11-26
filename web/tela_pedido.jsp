<%-- 
    Author    
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.dao.PedidoDAO"%>
<%@page import="model.Pedido"%>
<%@page import="model.Carrinho"%>

<!DOCTYPE html>
<html lang="pt-BR" data-bs-theme="auto">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pedido Finalizado</title>

        <style>
            @import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');

            * {
                font-family: Roboto;
                border: 0;
                margin: 0;
            }
            body {
                background-color: #C67C4E;
                color: black;
                text-align: center;
            }
            .header {
                margin-top: 50px;
                font-size: 24px;
            }
            .order-code {
                margin-top: 20px;
                font-size: 20px;
            }
            img {
                width: 250px;
                height: auto;
                margin-top: 60px;
            }
            .footer {
                margin-top: 150px;
                font-size: 18px;
            }
        </style>
    </head>
</head>
<body>
    <div class="header">Pedido finalizado!</div>
    <%
        try {
            PedidoDAO pedidoDAO = new PedidoDAO();
            Pedido pedido = pedidoDAO.consultarPorId(session.getAttribute("idUsuario").toString());
    %>
    <div class="order-code">Seu código é: <%= pedido.getId().substring(0, 8).toUpperCase()%></div>
    <img src="assets/giphy.gif" alt="Scooter Image">
    <div class="footer"><b>Muito bem! Agora é só aguardar que já será entregue o seu pedido.</b></div>
    <%
    } catch (Exception e) {
        e.printStackTrace();  // Adicione ou registre a exceção para análise
    %>
    <div class="footer"><b>Ocorreu um erro ao processar o pedido.</b></div>
    <%
        }
    %>

</body>
</html>
</html>

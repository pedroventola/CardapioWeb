<%@page import="model.dao.AlimentoDAO"%>
<%@page import="model.Carrinho"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.dao.CarrinhoDAO"%>
<%@page import="model.Alimento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Gabarito:wght@500&display=swap');
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cardápio</title>
    </head>

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
                            window.location.href = "/Cardapio/pedidoFinalizado.jsp";
                        } else {
                            // Erro ao finalizar o pedido
                            alert("Erro ao finalizar o pedido. Tente novamente.");
                        }
                    }
                };
                xhr.send(); // Não há dados a serem enviados no corpo da requisição
            }
        </script>


        <%

            CarrinhoDAO carrinhoDAO = new CarrinhoDAO();
            List<Carrinho> resultados = carrinhoDAO.consultarPorUsuario(session.getAttribute("idUsuario").toString());
            Alimento alimento = new Alimento();
            AlimentoDAO alimentoDAO = new AlimentoDAO();

            for (Carrinho carrinho : resultados) {
                int idAlimento = carrinho.getIdAlimento();
                alimento = alimentoDAO.consultarPorId(idAlimento);


        %>
        <img src="..<%= alimento.getImagem()%>"/>
        <!-- <input type="button" value="+"> -->


        <%
            }
        %>
        <a href="/Cardapio/logout" target="_top">Sair</a> 
        <button onclick="finalizarPedido()">Finalizar Pedido</button>

    </body>
</html>

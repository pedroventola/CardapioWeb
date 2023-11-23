<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.dao.AlimentoDAO"%>
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
            function adicionarAoCarrinho(id) {
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "/Cardapio/menu", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
                        alert(this.responseText);
                    }
                };
                xhr.send("idAlimento=" + id);
            }
        </script>
        

        <%

            AlimentoDAO alimentoDAO = new AlimentoDAO();

            List<Alimento> alimentos = alimentoDAO.consultarTodos();

            for (Alimento alimento : alimentos) {


        %>
        <img src="..<%= alimento.getImagem()%>"/>
        <!-- <input type="button" value="+"> -->
        <button onclick="adicionarAoCarrinho('<%=alimento.getId()%>')">+</button>

        <%
            }
        %>
        <a href="/Cardapio/logout" target="_top">Sair</a> 

    </body>
</html>

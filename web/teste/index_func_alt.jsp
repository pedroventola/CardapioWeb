
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.AlimentoDAO"%>
<%@page import="model.Alimento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Gabarito:wght@500&display=swap');
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Academia [Funcionário]</title>
    </head>

    <body>
        <%

            AlimentoDAO alimentoDAO = new AlimentoDAO();

            List<Alimento> alimentos = alimentoDAO.consultarTodos();

            for (Alimento alimento : alimentos) {
                out.println(alimento.getImagem());
            }
           
        %>

    </body>
</html>

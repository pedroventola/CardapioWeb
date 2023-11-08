<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.AlimentoDAO"%>
<%@page import="model.Alimento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Academia [Aluno]</title>
    </head>
    <body>
        <h1>StrongDuck - Alterar Aluno</h1>

        <%         
            
            AlimentoDAO alimentoDAO = new AlimentoDAO();

              List<Alimento> alimentos = alimentoDAO.consultarTodos();
              
              out.println(alimentos.toString());
        %>

    </body>
</html>

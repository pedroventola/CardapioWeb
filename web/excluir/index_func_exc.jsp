<%-- 
    Document   : index
    Created on : 23/08/2023, 20:27:33
    Author     : alunos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clínica [Funcionário]</title>
    </head>
    <body>
        <h1>Clínica - Excluir Funcionário</h1>
        <form name="FormCliExc" method="post" action="func_exc_id.jsp">
            Matrícula: <input type="text" name="matric"> <p>
            <input type="reset" value="Limpar"> 
            <input type="submit" value="Excluir"> <p>
        </form>
    </body>
</html>

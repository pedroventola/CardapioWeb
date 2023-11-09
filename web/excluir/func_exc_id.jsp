<%-- 
    Document   : func_cad_id.jsp
    Created on : 30 de ago. de 2023, 19:55:43
    Author     : adils
--%>

<%@page import="model.dao.FuncionarioDAO"%>
<%@page import="model.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clínica [Funcionário]</title>
    </head>
    <body>
        <h1>Clínica - Excluir Funcionário</h1>
        
        <%
        String matric = request.getParameter("matric");
        
        Funcionario funcionario = new Funcionario();
        funcionario.setMatric(matric);
        
        FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
        
        if (funcionarioDAO.excluir(funcionario) == true){
            out.println("<br> Funcionario excluído com sucesso!");
        }else{
            out.println("<br> <b>Funcionario não excluído! <b>");
        }       
        
        %>
        
    </body>
</html>

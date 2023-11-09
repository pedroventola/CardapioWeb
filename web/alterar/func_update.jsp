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
        <h1>Clínica - Alterar Funcionário</h1>
        
        <%
        String matric = request.getParameter("matric");
        String nome = request.getParameter("nome");
        String cargo = request.getParameter("cargo");
        String end_cep = request.getParameter("end_cep");
        String end_comp = request.getParameter("end_comp");
        
        Funcionario funcionario = new Funcionario();
        funcionario.setMatric(matric);
        funcionario.setNome(nome);
        funcionario.setCargo(cargo);
        funcionario.setEnderecoCep(end_cep);
        funcionario.setEnderecoComp(end_comp);
        
        FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
        
        if (funcionarioDAO.alterar(funcionario) == true){
            out.println("<br> Funcionario Alterado com sucesso!");
        }else{
            out.println("<br> <b>Funcionario não Alterado! <b>");
        }       
        
        %>
        
    </body>
</html>

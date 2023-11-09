<%-- 
    Document   : funcionario_cons_id.jsp
    Created on : 23/08/2023, 21:06:22
    Author     : alunos
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
        
        Funcionario funcionario = new Funcionario();
        funcionario.setMatric(matric);
        
        FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
        
        if (funcionarioDAO.consultarMatric(funcionario) != null){
        %>
            <h1>Funcionario: [Alteração]</h1> 
            <form name="frmAltFunc" method="post" action="func_update.jsp">
                Matric: <input type="text" name="matric" readonly="true" value="<%= funcionario.getMatric() %>"> <p>
                Nome: <input type="text" name="nome" value="<%= funcionario.getNome() %>"> <p>
                Cargo: <input type="text" name="cargo" value="<%= funcionario.getCargo() %>"> <p>
                CEP: <input type="text" name="end_cep" value="<%= funcionario.getEnderecoCep()%>"> <p>    
                Complemento: <input type="text" name="end_comp" value="<%= funcionario.getEnderecoComp()%>"> <p>                  
                <br><br>
                <input type="reset" value="Limpar">
                <input type="submit" value="Alterar!" name="alterar"> <p>                   
            </form>
        <%          
        }else{
            out.println("<br> <b>Funcionario não encontrado! <b>");
        }       
        
        %>
        
    </body>
</html>

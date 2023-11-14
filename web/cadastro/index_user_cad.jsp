<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clínica [Funcionário]</title>
    </head>
    <body>
        <h1>Clínica - Cadastro Funcionário</h1>
        <form name="FormUserCad" method="post" action="user_cad.jsp"> 
                Nome completo*: <input type="text" name="nome"> <p>
                Email*: <input type="email" name="email"> <p>
                Endereço*: <input type="text" name="end"> <p>    
                Senha*: <input type="password" name="senha"> <p>    
                <input type="reset" value="Limpar"> 
            <input type="submit" value="Salvar"> <p>
        </form>
    </body>
</html>

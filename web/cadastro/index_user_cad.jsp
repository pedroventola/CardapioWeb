<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cardápio - Cadastro</title>

        <style>
            @import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');

            * {
                font-family: Roboto;
                border: 0;
                margin: 0;
            }

            body {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 100vh;
                position: relative; /* Adicionado para referenciar a posição dos elementos filhos */
            }
            .titulo {
                color: #2F2D2C;
                text-align: center;
                font-family: Roboto;
                font-size: 18px;
                font-style: normal;
                font-weight: 600;
                line-height: normal;
                position: absolute;
                top: 10px;
            }

            input {
                border-radius: 10px;
                background: #F6F6F6;
                box-shadow: 0px 4px 4px 2px rgba(0, 0, 0, 0.25);
                width: 316px;
                height: 34px;
                flex-shrink: 0;
            }
            
            .enviar{
                display: flex;
                padding: 21px 109px;
                justify-content: center;
                align-items: center;
                gap: 10px;
                flex-shrink: 0;
                color: #fff;
                border-radius: 16px;
                font-size: 20px;
                background: #C67C4E;
            }

             .cadastro {
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <h1 class="titulo">Crie seu cadastro</h1>
        <form name="FormUserCad" method="post" action="user_cad.jsp"> 
            <div class="cadastro">
            <label for="email"><b>E-mail *</b></label>
            <input type="text" placeholder="Digite seu e-mail" name="email" required>
            
            <label for="senha"><b>Senha *</b></label>
            <input type="password" placeholder="Digite sua senha" name="senha" required>

            <label for="nome"><b>Nome Completo *</b></label>
            <input type="text" placeholder="Digite seu nome completo" name="nome" required>

            <label for="endereco"><b>Endereço *</b></label>
            <input type="text" placeholder="Digite seu endereço" name="endereco" required> 
            </div>

            <button class="enviar" type="submit">Criar sua conta</button>
        </form>
    </body>
</html>


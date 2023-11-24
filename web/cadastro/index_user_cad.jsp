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
            position: fixed;
            top: 15px;
            width: 100%;
            margin-bottom: 15px;
            z-index: 1;
           
        }

            input {
                border-radius: 10px;
                background: #F6F6F6;
                box-shadow: 0px 4px 4px 2px rgba(0, 0, 0, 0.25);
                width: 316px;
                height: 34px;
                flex-shrink: 0;
                margin-bottom: 20px;
            }

            .enviar{
                display: flex;
                width: 215px;
                height: 55px;
                justify-content: center;
                align-items: center;
                gap: 10px;
                flex-shrink: 0;
                color: #fff;
                border-radius: 16px;
                font-size: 20px;
                background: #C67C4E;
                margin-left: 85px;
            }

            .cadastro {
                margin-bottom: 0px;
                margin-top: 60px;
                padding: 0 30px;
               
            }
            label{
                color: #2F2D2C;
                font-family: Roboto;
                font-size: 20px;
                font-style: normal;
                font-weight: 600;
                line-height: normal;
            }
            .check{
                padding: 27px;
            }
            .checkbox{
                width: 20px;
                height: 20px;
                background: #F6F6F6;
                box-shadow: 0px 4px 0px 0px rgba(0, 0, 0, 0.0);

            }
        </style>
    </head>
    <body>
        <h1 class="titulo">Crie seu cadastro</h1>
        <form name="FormUserCad" method="post" action="user_cad.jsp"> 

            <div class="cadastro">
                <label for="email">E-mail *</label>
                <input type="text" placeholder="Digite seu e-mail" name="email" required>

                <label for="senha"><br>Senha *</label>
                <input type="password" placeholder="Digite sua senha" name="senha" required>

                <label for="nome"><br>Nome Completo *</label>
                <input type="text" placeholder="Digite seu nome completo" name="nome" required>

                <label for="endereco">Endereço *</label>
                <input type="text" placeholder="Digite seu endereço" name="endereco" required> 
            </div>

            <div class="check">
                <br><input class="checkbox" type="checkbox" checked="checked" name="termos"> Declaro que li e concordo com os termos e condições sobre o restaurante
                <br><input class="checkbox" type="checkbox" checked="checked" name="newsletter"> Desejo receber newsletters do restaurante
                <br><input class="checkbox" type="checkbox" checked="checked" name="newsletter"> Desejo receber e-mails promocionais

            </div>

            <button class="enviar" type="submit">Criar sua conta</button>
        </form>
    </body>
</html>


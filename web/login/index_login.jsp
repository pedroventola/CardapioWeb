<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <title>Login</title>
    </head>
    <body>
        <script>
            function efetuarLogin() {
                var email = document.getElementById('email').value;
                var senha = document.getElementById('senha').value;
                if (!email || !senha) {
                    alert('Por favor, preencha todos os campos.');
                    return;
                }
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "/Cardapio/logar", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (this.readyState === XMLHttpRequest.DONE) {
                        if (this.status === 200) {
                            // A resposta foi bem-sucedida, redirecione para a página desejada
                            window.location.href = "/Cardapio/tela_cardapio.jsp";
                        } else {
                            // A resposta não foi bem-sucedida, você pode exibir uma mensagem de erro se necessário
                            alert("Erro ao efetuar login. Por favor, verifique suas credenciais.");
                        }
                    }
                };
                xhr.send("email=" + email + "&senha=" + senha);
            }

        </script>

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

            .login {
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

            .email,
            .senha {
                margin-bottom: 20px;
            }

            a {
                width: 315px;
                color: #878788;
                font-family: Roboto;
                font-size: 18px;
                font-style: normal;
                font-weight: 400;
                line-height: normal;
                justify-content: center;
                display: flex;
                padding: 15px;
            }

            input {
                border-radius: 10px;
                background: #F6F6F6;
                box-shadow: 0px 4px 4px 2px rgba(0, 0, 0, 0.25);
                width: 316px;
                height: 34px;
                flex-shrink: 0;
            }

            h1 {
                color: #2F2D2C;
                font-family: Roboto;
                font-size: 20px;
                font-style: normal;
                font-weight: 600;
                line-height: normal;
            }

            .cadastro {
                text-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
                text-align: center;
                font-family: Roboto;
                font-size: 18px;
                font-style: normal;
                font-weight: 435;
                line-height: normal;
                position: absolute;
                bottom: 10px;
                left: 50%;
                transform: translateX(-50%);
                justify-content: center;
                display: flex;
            }

        </style>
    <body>
        <div class="titulo">
            <h2>Faça seu login</h2>
        </div>
        <div class="email">
            <h1>E-mail</h1>

            <input type="text" id="email" placeholder="Digite seu Email" required>
        </div>
        <div class="senha">
            <h1>Senha</h1>

            <input type="password" id="senha" placeholder="Digite sua Senha" required>
        </div>

        <div class="esqueceu">
            <a href="">Esqueceu sua senha?</a>
        </div>

        <div>
            <button class="login" onclick="efetuarLogin()">Entrar</button>
        </div>

        <div>
            <a class="cadastro" href="../cadastro/index_user_cad.jsp">Não tem uma conta? Faça seu Cadastro</a>
        </div>
    </body>

</html>





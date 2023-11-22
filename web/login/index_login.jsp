<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
                    if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
                        alert(this.responseText);
                    }
                };
                xhr.send("email=" + email + "&senha=" + senha);
            }
        </script>
        <h2>Login</h2>
        <div class="container">
            <label for="email"><b>Email</b></label>
            <input type="text" id="email" placeholder="Digite seu Email" required>

            <label for="senha"><b>Senha</b></label>
            <input type="password" id="senha" placeholder="Digite sua Senha" required>

            <button onclick="efetuarLogin()">Login</button>
        </div>

       
    </body>
</html>


<!--<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body>
         <script>
            function efetuarLogin() {
                var email = document.getElementById('email').value;
                var senha = document.getElementById('senha').value;
                if (!email || !senha) {
                    document.getElementById('mensagem').innerText = 'Por favor, preencha todos os campos.';
                    return;
                }

                fetch('/Cardapio/logar', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: 'email=' + email + '&senha=' + senha
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Erro ao realizar login.');
                    }
                    return response.text();
                })
                .then(data => {
                    document.getElementById('mensagem').innerText = data;
                })
                .catch(error => {
                    document.getElementById('mensagem').innerText = error.message;
                });
            }
        </script>
        <h2>Login</h2>
        <div class="container">
            <label for="email"><b>Email</b></label>
            <input type="text" id="email" placeholder="Digite seu Email" required>

            <label for="senha"><b>Senha</b></label>
            <input type="password" id="senha" placeholder="Digite sua Senha" required>

            <button onclick="efetuarLogin()">Login</button>

            <div id="mensagem"></div>
        </div>
    </body>
</html>-->

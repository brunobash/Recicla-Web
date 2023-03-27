<?php
require_once '../Controller/GerenciadorLogin.php';
$gererenciadorLogin = new GerenciadorLogin();

$id = "";
$nome = "";
$login = "";
$senha = "";
$email = "";
$telefone = "";
$dataNasc = "";
$cpf = "";
$genero = "";


$acao = "inserir";
$botao = "Cadastrar";
$msg = "";
?>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Login</title>
    </head>
    <body>
        <?php
            if (isset($_GET["msg"])) {
                echo'<script>alert("'.$_GET["msg"].'");</script>';
            }
        ?>

        <div class="con_form">
            <div class="toggle">
                <a href="telaCadastro.php" style="text-decoration:none" color="white">Criar Conta</a>
            </div>
            
            <div class="formulario">
                <h2>Iniciar sessão</h2>
                <form method="POST" action="../Controle/controladorLogin.php?acao=logar">
                    <input name="login" type="text" placeholder="Login" value="" required>
                    <input name="senha" type="password" placeholder="Senha" value="" required>
                    <input type="submit" value="Iniciar sessão">
                    
                    <!--
                    <div class="reset-password">
                        <a href="#">Esqueci minha senha?</a>
                    </div>
                    -->
                    
                </form>
            </div>
        </div>

    </div>
    <script src="/CentroOlimpico/materialize/js/jquery-3.2.1.min.js"></script>
    <script src="/CentroOlimpico/materialize/js/materialize.min.js"></script>
</body>
</html>


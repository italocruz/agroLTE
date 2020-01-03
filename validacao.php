<?php

// Verifica se houve POST e se o usuário ou a senha é(são) vazio(s)
if (!empty($_POST) AND ( empty($_POST['usuario']) OR empty($_POST['senha']))) {
    header("Location: index.php");
    exit;
}

include 'banco.php';
$pdo = Banco::conectar();

$usuario = $_POST['usuario'];
$senha = $_POST['senha'];

// Validação do usuário/senha digitados
$sql = "SELECT `id`, `nome`, `nivel` FROM `usuarios` WHERE (`usuario` = '" . $usuario . "') AND (`senha` = '" . sha1($senha) . "') ";
$q = $pdo->prepare($sql);
$q->execute(array($usuario, $senha));

$resultado = $q->fetchAll();

$count = $q->rowCount();

if ($count > 0) {

    if (!isset($_SESSION))
        session_start();

    foreach ($resultado as $row) {
        // Salva os dados encontrados na sessão
        $_SESSION['UsuarioID'] = $row['id'];
        $_SESSION['UsuarioNome'] = $row['nome'];
        $_SESSION['UsuarioNivel'] = $row['nivel'];
    }

    // Redireciona o visitante
    header("Location: index.php");
    exit;
} else {
    echo "Login inválido!";
    exit;
}

Banco::desconectar();
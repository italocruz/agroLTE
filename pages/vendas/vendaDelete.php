<?php

include '../../banco.php';

$id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
if(!empty($id)){
	$pdo = Banco::conectar();
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $sql = "DELETE FROM venda where id = ?";
    $q = $pdo->prepare($sql);
    $q->execute(array($id));    
    header("Location: venda.php");
    Banco::desconectar();
}  

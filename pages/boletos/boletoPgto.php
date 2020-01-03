<?php

include '../../banco.php';

$id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
if(!empty($id)){
    $pdo = Banco::conectar();
    
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $sql = "SELECT * FROM boleto where id = ?";
    $q = $pdo->prepare($sql);
    $q->execute(array($id));
    $stmt = $q->fetch(PDO::FETCH_ASSOC);
    
    //$dataVcto = $stmt['dataVcto'];
    $valor = $stmt['valor'];
    $credor = $stmt['credor'];
    $obs = $stmt['obs'];
    //$status = $stmt['status'];
    
    
    //ALTERANDO STATUS DO BOLETO PARA PAGO
    $sqlU = "UPDATE boleto  set status = ? WHERE id = ?";
    $qU = $pdo->prepare($sqlU);
    $status = "1";
    $qU->execute(array($status, $id));
    
    
    //INCLUINDO BOLETO PAGO NA TABELA PAGAMENTO
    $hoje = date("Y-m-d");
    $descricao = "Credor: " . $credor . " - Obs: " . $obs;
    $tipoPagamento = "2"; //BOLETO
    $sqlI = "INSERT INTO pagamento (data, valor, descricao, tipoPagamento, idBoleto) VALUES(?,?,?,?,?)";
    $qI = $pdo->prepare($sqlI);
    $qI->execute(array($hoje, $valor, $descricao, $tipoPagamento, $id));
    
      
    header("Location: boletosAbertos.php");
    Banco::desconectar();
}
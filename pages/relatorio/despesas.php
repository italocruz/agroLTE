<?php
include '../../sessao.php';
?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
        
        <title>Central Agro</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
        <!-- Google Font: Source Sans Pro -->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

        <!-- DataTables -->
        <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.css">  
        
        <!-- daterange picker -->
        <link rel="stylesheet" href="../../plugins/daterangepicker/daterangepicker.css">
        
        <link rel="shortcut icon" href="../../dist/img/favicon.ico" type="image/x-icon" />
    </head>
    <body class="hold-transition sidebar-mini">
        <div class="wrapper">

            <!-- MENU -->
            <?php include '../../menu.php'; ?>
            <!-- MENU -->

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Faturamento</h1>
                            </div>
                        </div>
                    </div><!-- /.container-fluid -->
                </section>

                <section class="content">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Relatório de detalhamento de despesas de acordo com o período selecionado abaixo:</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form action="despesas.php" method="post">
                            <div class="card-body">
                                
                                <div class="row">
                                    <div class="col-4">
                                        <!-- Date and time range -->
                                        <div class="form-group">
                                            <label>Data:</label>

                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">
                                                        <i class="far fa-calendar-alt"></i>
                                                        <i class="fas fa-caret-down"></i>
                                                    </span>
                                                </div>
                                                <input type="text" class="form-control float-right" id="daterange-btn" name="periodo">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.form group -->
                                
                                <div class="modal-footer justify-content-between">
                                    <button type="submit" class="btn btn-success swalDefaultSuccess">Gerar</button>
                                    <a href="faturamento.php" class="btn btn-warning" >Limpar</a>
                                </div>
                            </div>

                        </form>
                    </div>
                    <!-- /.card -->
                    
                </section>

                <?php
                include '../../banco.php';

                if (!empty($_POST)) { 
                    $periodo = $_POST['periodo'];
                    
                    $I = substr($periodo, 0, 10);
                    $dI = substr($I, 0, 2);
                    $mI = substr($I, 3, 2);
                    $aI = substr($I, 6, 10);
                    $dataI = $aI.'-'.$mI.'-'.$dI;
                    
                    $F = substr($periodo, 13, 22);
                    $dF = substr($F, 0, 2);
                    $mF = substr($F, 3, 2);
                    $aF = substr($F, 6, 10);
                    $dataF = $aF.'-'.$mF.'-'.$dF;   
                    
                    $dataInicia = date("d/m/Y", strtotime($dataI));
                    $dataFinal = date("d/m/Y", strtotime($dataF));
                    
                    //Inserindo no Banco:
                    $pdo = Banco::conectar();
                    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                    ?>

                        <!--
                <section class="content">
                    <div class="card card-primary">
                        <div class="modal-footer justify-content-between">
                            <button type="submit" class="btn btn-info swalDefaultSuccess">Detalhar Despesas</button>
                        </div>
                    </div>
                </section>
                -->
                
                <section class="content">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Detalhe das Depesas no Período de <b><?php echo $dataInicia; ?></b> a <b><?php echo $dataFinal ?></b></h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="relatorio" class="table table-bordered table-striped">
                                
                                <tbody>
                                    <?php
                                        $sqlDD = 'SELECT d.valor, d.descricao, d.data, r.nome, r.id FROM despesa d, requerente r WHERE r.id = d.requerente AND d.data BETWEEN ? AND ? AND d.requerente = 1';
                                        $qDD = $pdo->prepare($sqlDD);
                                        $qDD->execute(array($dataI, $dataF));
                                        $resultDD = $qDD->fetchAll();
                                        
                                        if (!empty($resultDD)) {
                                            foreach ($resultDD as $rowA) {
                                                 $totalD = $totalD + $rowA['valor'];
                                            }
                                            echo '<tr> <th colspan="4" style="text-align: center">Depósito - R$ '. number_format($totalD, 2, ',', '.') .'</th> </tr>';
                                            echo '<tr> <th colspan="2" style="text-align: center">Descrição</th> ';
                                            echo '<th colspan="1" style="text-align: center">Valor</th> ';
                                            echo '<th colspan="1" style="text-align: center">Data</th> </tr>';
                                            foreach ($resultDD as $rowA) {
                                                echo '<tr> <th colspan="2">'. $rowA['descricao'] .'</th colspan="1"> <th>R$ '. number_format($rowA['valor'], 2, ',', '.') .'</th> <th colspan="1"> '. date("d/m/Y", strtotime($rowA['data'])) .'</th> </tr>';
                                            }
                                        }
                                        
                                        $sqlDA = 'SELECT d.valor, d.descricao, d.data, r.nome, r.id FROM despesa d, requerente r WHERE r.id = d.requerente AND d.data BETWEEN ? AND ? AND d.requerente = 2';
                                        $qDA = $pdo->prepare($sqlDA);
                                        $qDA->execute(array($dataI, $dataF));
                                        $resultDA = $qDA->fetchAll();
                                        
                                        if (!empty($resultDA)) {
                                            foreach ($resultDA as $rowA) {
                                                 $totalA = $totalA + $rowA['valor'];
                                            }
                                            echo '<tr> <th colspan="4" style="text-align: center">Aparecida - R$ '. number_format($totalA, 2, ',', '.') .'</th> </tr>';
                                            echo '<tr> <th colspan="2" style="text-align: center">Descrição</th> ';
                                            echo '<th colspan="1" style="text-align: center">Valor</th> ';
                                            echo '<th colspan="1" style="text-align: center">Data</th> </tr>';
                                            foreach ($resultDA as $rowA) {
                                                echo '<tr> <th colspan="2">'. $rowA['descricao'] .'</th colspan="1"> <th>R$ '. number_format($rowA['valor'], 2, ',', '.') .'</th> <th colspan="1"> '. date("d/m/Y", strtotime($rowA['data'])) .'</th> </tr>';
                                            }
                                        }
                                        
                                        $sqlDJ = 'SELECT d.valor, d.descricao, d.data, r.nome, r.id FROM despesa d, requerente r WHERE r.id = d.requerente AND d.data BETWEEN ? AND ? AND d.requerente = 3';
                                        $qDJ = $pdo->prepare($sqlDJ);
                                        $qDJ->execute(array($dataI, $dataF));
                                        $resultDJ = $qDJ->fetchAll();
                                        
                                        if (!empty($resultDJ)) {
                                            foreach ($resultDJ as $rowA) {
                                                 $totalJ = $totalJ + $rowA['valor'];
                                            }
                                            echo '<tr> <th colspan="4" style="text-align: center">José - R$ '. number_format($totalJ, 2, ',', '.') .'</th> </tr>';
                                            echo '<tr> <th colspan="2" style="text-align: center">Descrição</th> ';
                                            echo '<th colspan="1" style="text-align: center">Valor</th> ';
                                            echo '<th colspan="1" style="text-align: center">Data</th> </tr>';
                                            foreach ($resultDJ as $rowA) {
                                                echo '<tr> <th colspan="2">'. $rowA['descricao'] .'</th colspan="1"> <th>R$ '. number_format($rowA['valor'], 2, ',', '.') .'</th> <th colspan="1"> '. date("d/m/Y", strtotime($rowA['data'])) .'</th> </tr>';
                                            }
                                        }
                                        
                                        $sqlDP = 'SELECT d.valor, d.descricao, d.data, r.nome, r.id FROM despesa d, requerente r WHERE r.id = d.requerente AND d.data BETWEEN ? AND ? AND d.requerente = 4';
                                        $qDP = $pdo->prepare($sqlDP);
                                        $qDP->execute(array($dataI, $dataF));
                                        $resultDP = $qDP->fetchAll();
                                        
                                        if (!empty($resultDP)) {
                                            foreach ($resultDP as $rowA) {
                                                 $totalP = $totalP + $rowA['valor'];
                                            }
                                            echo '<tr> <th colspan="4" style="text-align: center">Priscila - R$ '. number_format($totalP, 2, ',', '.') .'</th> </tr>';
                                            echo '<tr> <th colspan="2" style="text-align: center">Descrição</th> ';
                                            echo '<th colspan="1" style="text-align: center">Valor</th> ';
                                            echo '<th colspan="1" style="text-align: center">Data</th> </tr>';
                                            foreach ($resultDP as $rowA) {
                                                echo '<tr> <th colspan="2">'. $rowA['descricao'] .'</th colspan="1"> <th>R$ '. number_format($rowA['valor'], 2, ',', '.') .'</th> <th colspan="1"> '. date("d/m/Y", strtotime($rowA['data'])) .'</th> </tr>';
                                            }
                                        }
                                        
                                        $sqlDI = 'SELECT d.valor, d.descricao, d.data, r.nome, r.id FROM despesa d, requerente r WHERE r.id = d.requerente AND d.data BETWEEN ? AND ? AND d.requerente = 5';
                                        $qDI = $pdo->prepare($sqlDI);
                                        $qDI->execute(array($dataI, $dataF));
                                        $resultDI = $qDI->fetchAll();
                                        
                                        if (!empty($resultDI)) {
                                            foreach ($resultDI as $rowA) {
                                                 $totalI = $totalI + $rowA['valor'];
                                            }
                                            echo '<tr> <th colspan="4" style="text-align: center">Ítalo - R$ '. number_format($totalI, 2, ',', '.') .'</th> </tr>';
                                            echo '<tr> <th colspan="2" style="text-align: center">Descrição</th> ';
                                            echo '<th colspan="1" style="text-align: center">Valor</th> ';
                                            echo '<th colspan="1" style="text-align: center">Data</th> </tr>';
                                            foreach ($resultDI as $rowA) {
                                                echo '<tr> <th colspan="2">'. $rowA['descricao'] .'</th colspan="1"> <th>R$ '. number_format($rowA['valor'], 2, ',', '.') .'</th> <th colspan="1"> '. date("d/m/Y", strtotime($rowA['data'])) .'</th> </tr>';
                                            }
                                        }
                                        
                                        $sqlDO = 'SELECT d.valor, d.descricao, d.data, r.nome, r.id FROM despesa d, requerente r WHERE r.id = d.requerente AND d.data BETWEEN ? AND ? AND d.requerente = 6';
                                        $qDO = $pdo->prepare($sqlDO);
                                        $qDO->execute(array($dataI, $dataF));
                                        $resultDO = $qDO->fetchAll();
                                        
                                        if (!empty($resultDO)) {
                                            foreach ($resultDO as $rowA) {
                                                 $totalO = $totalO + $rowA['valor'];
                                            }
                                            echo '<tr> <th colspan="4" style="text-align: center">Outro - R$ '. number_format($totalO, 2, ',', '.') .'</th> </tr>';
                                            echo '<tr> <th colspan="2" style="text-align: center">Descrição</th> ';
                                            echo '<th colspan="1" style="text-align: center">Valor</th> ';
                                            echo '<th colspan="1" style="text-align: center">Data</th> </tr>';
                                            foreach ($resultDO as $rowA) {
                                                echo '<tr> <th colspan="2">'. $rowA['descricao'] .'</th colspan="1"> <th>R$ '. number_format($rowA['valor'], 2, ',', '.') .'</th> <th colspan="1"> '. date("d/m/Y", strtotime($rowA['data'])) .'</th> </tr>';                                            }
                                        }
                                        
                                        
                                        $sqlDC = 'SELECT valor, tipoPagamento, '
                                        . 'CASE tipoPagamento '
                                        . 'when 1 then "Carga" '
                                        . 'when 2 then "Boleto" '
                                        . 'when 3 then "Funcionário" '
                                        . 'when 4 then "Estiva" '
                                        . 'END AS tp, '
                                        . 'descricao, '
                                        . 'data '
                                        . 'FROM pagamento WHERE data BETWEEN ? AND ? AND tipoPagamento = 1';
                                        $qDC = $pdo->prepare($sqlDC);
                                        $qDC->execute(array($dataI, $dataF));
                                        $resultDC = $qDC->fetchAll();
                                        
                                        if (!empty($resultDC)) {
                                            foreach ($resultDC as $rowA) {
                                                 $totalC = $totalC + $rowA['valor'];
                                            }
                                            echo '<tr> <th colspan="4" style="text-align: center">Carga - R$ '. number_format($totalC, 2, ',', '.') .'</th> </tr>';
                                            echo '<tr> <th colspan="2" style="text-align: center">Descrição</th> ';
                                            echo '<th colspan="1" style="text-align: center">Valor</th> ';
                                            echo '<th colspan="1" style="text-align: center">Data</th> </tr>';
                                            foreach ($resultDC as $rowA) {
                                                echo '<tr> <th colspan="2">'. $rowA['descricao'] .'</th colspan="1"> <th>R$ '. number_format($rowA['valor'], 2, ',', '.') .'</th> <th colspan="1"> '. date("d/m/Y", strtotime($rowA['data'])) .'</th> </tr>';
                                            }
                                        }
                                        
                                        $sqlDB = 'SELECT valor, tipoPagamento, '
                                        . 'CASE tipoPagamento '
                                        . 'when 1 then "Carga" '
                                        . 'when 2 then "Boleto" '
                                        . 'when 3 then "Funcionário" '
                                        . 'when 4 then "Estiva" '
                                        . 'END AS tp, '
                                        . 'descricao, '
                                        . 'data '
                                        . 'FROM pagamento WHERE data BETWEEN ? AND ? AND tipoPagamento = 2';
                                        $qDB = $pdo->prepare($sqlDB);
                                        $qDB->execute(array($dataI, $dataF));
                                        $resultDB = $qDB->fetchAll();
                                        
                                        if (!empty($resultDB)) {
                                            foreach ($resultDB as $rowA) {
                                                 $totalB = $totalB + $rowA['valor'];
                                            }
                                            echo '<tr> <th colspan="4" style="text-align: center">Boleto - R$ '. number_format($totalB, 2, ',', '.') .'</th> </tr>';
                                            echo '<tr> <th colspan="2" style="text-align: center">Descrição</th> ';
                                            echo '<th colspan="1" style="text-align: center">Valor</th> ';
                                            echo '<th colspan="1" style="text-align: center">Data</th> </tr>';
                                            foreach ($resultDB as $rowA) {
                                                echo '<tr> <th colspan="2">'. $rowA['descricao'] .'</th colspan="1"> <th>R$ '. number_format($rowA['valor'], 2, ',', '.') .'</th> <th colspan="1"> '. date("d/m/Y", strtotime($rowA['data'])) .'</th> </tr>';
                                            }
                                        }
                                        
                                        $sqlDF = 'SELECT valor, tipoPagamento, '
                                        . 'CASE tipoPagamento '
                                        . 'when 1 then "Carga" '
                                        . 'when 2 then "Boleto" '
                                        . 'when 3 then "Funcionário" '
                                        . 'when 4 then "Estiva" '
                                        . 'END AS tp, '
                                        . 'descricao, '
                                        . 'data, '
                                        . 'idFuncionario, '
                                        . 'f.nome '
                                        . 'FROM pagamento, funcionario f WHERE data BETWEEN ? AND ? AND tipoPagamento = 3 AND f.id = idFuncionario';
                                        $qDF = $pdo->prepare($sqlDF);
                                        $qDF->execute(array($dataI, $dataF));
                                        $resultDF = $qDF->fetchAll();
                                        
                                        if (!empty($resultDF)) {
                                            foreach ($resultDF as $rowA) {
                                                 $totalF = $totalF + $rowA['valor'];
                                            }
                                            echo '<tr> <th colspan="4" style="text-align: center">Funcionário - R$ '. number_format($totalF, 2, ',', '.') .'</th> </tr>';
                                            echo '<tr> <th colspan="2" style="text-align: center">Descrição</th> ';
                                            echo '<th colspan="1" style="text-align: center">Valor</th> ';
                                            echo '<th colspan="1" style="text-align: center">Data</th> </tr>';
                                            foreach ($resultDF as $rowA) {
                                                echo '<tr> <th colspan="2">'. $rowA['descricao'] . ' - ' . $rowA['nome'] .'</th colspan="1"> <th>R$ '. number_format($rowA['valor'], 2, ',', '.') .'</th> <th colspan="1"> '. date("d/m/Y", strtotime($rowA['data'])) .'</th> </tr>';
                                            }
                                        }
                                        
                                        $sqlDE = 'SELECT valor, tipoPagamento, '
                                        . 'CASE tipoPagamento '
                                        . 'when 1 then "Carga" '
                                        . 'when 2 then "Boleto" '
                                        . 'when 3 then "Funcionário" '
                                        . 'when 4 then "Estiva" '
                                        . 'END AS tp, '
                                        . 'descricao, '
                                        . 'data '
                                        . 'FROM pagamento WHERE data BETWEEN ? AND ? AND tipoPagamento = 4';
                                        $qDE = $pdo->prepare($sqlDE);
                                        $qDE->execute(array($dataI, $dataF));
                                        $resultDE = $qDE->fetchAll();
                                        
                                        if (!empty($resultDE)) {
                                            foreach ($resultDE as $rowA) {
                                                 $totalE = $totalE + $rowA['valor'];
                                            }
                                            echo '<tr> <th colspan="4" style="text-align: center">Estiva - R$ '. number_format($totalE, 2, ',', '.') .'</th> </tr>';
                                            echo '<tr> <th colspan="2" style="text-align: center">Descrição</th> ';
                                            echo '<th colspan="1" style="text-align: center">Valor</th> ';
                                            echo '<th colspan="1" style="text-align: center">Data</th> </tr>';
                                            foreach ($resultDE as $rowA) {
                                                echo '<tr> <th colspan="2">'. $rowA['descricao'] .'</th colspan="1"> <th>R$ '. number_format($rowA['valor'], 2, ',', '.') .'</th> <th colspan="1"> '. date("d/m/Y", strtotime($rowA['data'])) .'</th> </tr>';
                                            }
                                        }
                                    ?>
                                </tbody>
                            </table>
                        </div>

                        <!-- /.card-body -->
                        <!--
                        <div class="modal-footer justify-content-md-center">
                            <a href="venda.php" class="btn btn-default" >Salvar</a>
                        </div>
                        -->
                    </div>
                    <!-- /.card -->
                </section>

                        <?php
                    } 
                    Banco::desconectar();
                ?> 
                <!-- Main content -->

            </div>
            <!-- /.content-wrapper -->
            <footer class="main-footer">
                <div class="float-right d-none d-sm-block">
                    <b>Version</b> <?php echo $_SESSION['versao'] ?>
                </div>
                <strong>Copyright &copy; 2015-<?php echo date("Y") ?> <a href="#">Central Grãos</a>.</strong>
            </footer>

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- /.control-sidebar -->
        </div>
        <!-- ./wrapper -->

        <!-- jQuery -->
        <script src="../../plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="../../dist/js/adminlte.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="../../dist/js/demo.js"></script>
        <!-- DataTables -->
        <script src="../../plugins/datatables/jquery.dataTables.js"></script>
        <script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
        
        <!-- Select2 -->
        <script src="../../plugins/select2/js/select2.full.min.js"></script>
        <!-- InputMask -->
        <script src="../../plugins/moment/moment.min.js"></script>
        <script src="../../plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>
        <!-- date-range-picker -->
        <script src="../../plugins/daterangepicker/daterangepicker.js"></script>
        
        <!-- page script -->
        <?php include '../util/js.html'; ?>

    </body>
</html>
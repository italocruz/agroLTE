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
                            <h3 class="card-title">Relatório de faturamento de acordo com o período selecionado abaixo:</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form action="faturamento.php" method="post">
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
                    $sqlV = 'SELECT valorVenda,tipo FROM venda WHERE data BETWEEN ? AND ? ORDER BY tipo';
                    $qV = $pdo->prepare($sqlV);
                    $qV->execute(array($dataI, $dataF));
                    $resultV = $qV->fetchAll();
                    
                    $sqlD = 'SELECT d.valor, r.nome, r.id FROM despesa d, requerente r WHERE r.id = d.requerente AND d.data BETWEEN ? AND ? ORDER BY d.requerente';
                    $qD = $pdo->prepare($sqlD);
                    $qD->execute(array($dataI, $dataF));
                    $resultD = $qD->fetchAll();
                    
                    $sqlP = 'SELECT valor, tipoPagamento, '
                            . 'CASE tipoPagamento '
                            . 'when 1 then "Carga" '
                            . 'when 2 then "Boleto" '
                            . 'when 3 then "Funcionário" '
                            . 'when 4 then "Estiva" '
                            . 'END AS tp '
                            . 'FROM pagamento WHERE data BETWEEN ? AND ? ORDER BY tipoPagamento';
                    $qP = $pdo->prepare($sqlP);
                    $qP->execute(array($dataI, $dataF));
                    $resultP = $qP->fetchAll(); 

                    if (count($resultV)) { ?>

                        <section class="content">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">Faturamento do Período de <b><?php echo $dataInicia; ?></b> a <b><?php echo $dataFinal ?></b></h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table id="relatorio" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th colspan="3" style="text-align: center">Vendas</th>
                                            </tr>
                                            <tr>
                                                <th>Milho</th>
                                                <th>Ração</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <?php
                                            foreach ($resultV as $row) {
                                                if ($row['tipo'] == 'Milho') {
                                                    $totalMilho = $totalMilho + $row['valorVenda'];
                                                }
                                                if ($row['tipo'] == 'Ração') {
                                                    $totalRacao = $totalRacao + $row['valorVenda'];
                                                }
                                            }
                                            
                                            echo '<td> <b>R$ ' . number_format($totalMilho, 2, ',', '.') . '</b> </td>';
                                            echo '<td> <b>R$ ' . number_format($totalRacao, 2, ',', '.') . '</b> </td>';
                                            echo '<td> <b>R$ ' . number_format(($totalMilho + $totalRacao), 2, ',', '.') . '</b> </td>';

                                            if (count($resultD) || count($resultP)) {
                                                echo '<tr> <th colspan="3" class="bg-light" style="text-align: center"></th> </tr>';
                                                echo '<tr> <th colspan="3" style="text-align: center">Despesas</th> </tr>';
                                                
                                                $Deposito = 1; $Aparecida = 2; $Jose = 3; 
                                                $Priscila = 4; $Italo = 5; $Outro = 6;
                                                
                                                foreach ($resultD as $row) {
                                                    if ($row['id'] == $Deposito) {
                                                        $totalD = $totalD + $row['valor'];
                                                    }
                                                    if ($row['id'] == $Aparecida) {
                                                        $totalA = $totalA + $row['valor'];
                                                    }
                                                    if ($row['id'] == $Jose) {
                                                        $totalJ = $totalJ + $row['valor'];
                                                    }
                                                    if ($row['id'] == $Priscila) {
                                                        $totalP = $totalP + $row['valor'];
                                                    }
                                                    if ($row['id'] == $Italo) {
                                                        $totalI = $totalI + $row['valor'];
                                                    }
                                                    if ($row['id'] == $Outro) {
                                                        $totalO = $totalO + $row['valor'];
                                                    }
                                                }
                                                
                                                foreach ($resultP as $row) {
                                                    if ($row['tipoPagamento'] == '1') {
                                                        $totalCarga = $totalCarga + $row['valor'];
                                                    }
                                                    if ($row['tipoPagamento'] == '2') {
                                                        $totalBoleto = $totalBoleto + $row['valor'];
                                                    }
                                                    if ($row['tipoPagamento'] == '3') {
                                                        $totalFuncionario = $totalFuncionario + $row['valor'];
                                                    }
                                                    if ($row['tipoPagamento'] == '4') {
                                                        $totalEstiva = $totalEstiva + $row['valor'];
                                                    }
                                                }
                                                
                                                
                                                if ($totalD > 0) {
                                                    echo '<tr> <th colspan="2">Depósito</th> <th>R$ '.number_format($totalD, 2, ',', '.').'</th> </tr>';
                                                }
                                                if ($totalA > 0) {
                                                    echo '<tr> <th colspan="2">Aparecida</th> <th>R$ '.number_format($totalA, 2, ',', '.').'</th> </tr>';
                                                }
                                                if ($totalJ > 0) {
                                                    echo '<tr> <th colspan="2">José</th> <th>R$ '.number_format($totalJ, 2, ',', '.').'</th> </tr>';
                                                }
                                                if ($totalP > 0) {
                                                    echo '<tr> <th colspan="2">Priscila</th> <th>R$ '.number_format($totalP, 2, ',', '.').'</th> </tr>';
                                                }
                                                if ($totalI > 0) {
                                                    echo '<tr> <th colspan="2">Ítalo</th> <th>R$ '.number_format($totalI, 2, ',', '.').'</th> </tr>';
                                                }
                                                if ($totalO > 0) {
                                                    echo '<tr> <th colspan="2">Outro</th> <th>R$ '.number_format($totalO, 2, ',', '.').'</th> </tr>';
                                                }
                                                
                                                if ($totalCarga > 0) {
                                                    echo '<tr> <th colspan="2">Pagamento Carga Milho</th> <th>R$ '.number_format($totalCarga, 2, ',', '.').'</th> </tr>';
                                                }
                                                if ($totalBoleto > 0) {
                                                    echo '<tr> <th colspan="2">Boletos</th> <th>R$ '.number_format($totalBoleto, 2, ',', '.').'</th> </tr>';
                                                }
                                                if ($totalFuncionario > 0) {
                                                    echo '<tr> <th colspan="2">Funcionário</th> <th>R$ '.number_format($totalFuncionario, 2, ',', '.').'</th> </tr>';
                                                }
                                                if ($totalEstiva > 0) {
                                                    echo '<tr> <th colspan="2">Estiva</th> <th>R$ '.number_format($totalEstiva, 2, ',', '.').'</th> </tr>';
                                                }
                                                
                                                $totalDespesas = ($totalD + $totalA + $totalJ + $totalP + $totalI + $totalO + $totalCarga + $totalBoleto + $totalFuncionario + $totalEstiva);
                                                if ($totalDespesas > 0) {
                                                    echo '<tr> <th colspan="2">Total Despesas</th> <th>R$ '.number_format($totalDespesas, 2, ',', '.').'</th> </tr>';
                                                }
                                                
                                                echo '<tr> <th colspan="3" class="bg-light" style="text-align: center"></th> </tr>';
                                                
                                                $balanco = ($totalMilho + $totalRacao) - $totalDespesas;
                                                if ($balanco < 0) {
                                                    $style = 'style="color:#ff0000;"';
                                                } else {
                                                    $style = 'style="color:#0461F9;"';
                                                }
                                                echo '<tr> <th colspan="2">Resultado no Período de ' . $dataInicia . ' a ' . $dataFinal . ' </th> <th '.$style.'>R$ '.number_format($balanco, 2, ',', '.').'</th> </tr>';
                                                
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
                    } else {
                        echo '<div class="card-header">';
                        echo '<h3 class="card-title">Nenhum resultado retornado.</h3>';
                        echo '</div>';
                    }
                    Banco::desconectar();
                }
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
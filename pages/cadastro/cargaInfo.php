<?php
include '../../sessao.php';

include '../../banco.php';

$id = null;
if (!empty($_GET['id'])) {
    $id = $_REQUEST['id'];
}

if (null == $id) {
    header("Location: index.php");
}

$pdo = Banco::conectar();
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$sql = "SELECT * FROM carga where id = ?";
$q = $pdo->prepare($sql);
$q->execute(array($id));
$stmt = $q->fetch(PDO::FETCH_ASSOC);
$data = $stmt['data'];
$peso = $stmt['peso'];
$motorista = $stmt['motorista'];
$valorSaca = number_format($stmt['valorSaca'], 2, ',', '.');
$qtdSacas50 = $stmt['qtdSacas50'];
$qtdSacas25 = $stmt['qtdSacas25'];

$sqlP = "SELECT valor FROM pagamento where idCarga = ? AND tipoPagamento = '1'";
$qP = $pdo->prepare($sqlP);
$qP->execute(array($id));
$result = $qP->fetchAll();

if (count($result)) {
    foreach ($result as $row) {
        $valorP = $valorP + $row['valor'];
    }
}

$v = str_replace(".", "", $peso);
$sc = number_format(intval($v) / 60, 2, ',', '');
$vsc = str_replace(',', '.', $sc);
$preco = ( $vsc * intval($valorSaca) );

$sqlD = "SELECT valor FROM pagamento where idCarga = ? AND tipoPagamento = '4'";
$qD = $pdo->prepare($sqlD);
$qD->execute(array($id));
$res = $qD->fetchAll();

if (count($res)) {
    foreach ($res as $row) {
        $valorD = $valorD + $row['valor'];
    }
}

Banco::desconectar();
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
                                <h1>Resumo da Carga</h1>
                            </div>
                        </div>
                    </div><!-- /.container-fluid -->
                </section>

                <section class="content">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title"></h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form action="carga.php" method="post">
                            <div class="card-body">

                                <div class="row">
                                    <div class="col-4">
                                        <div class="form-group">
                                            <label>Data</label>  
                                            <input type="date" class="form-control" name="data" required="" disabled="" value="<?php echo!empty($data) ? $data : date("Y-m-d"); ?>"> 
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <label>Peso</label>
                                        <input type="text" class="form-control" placeholder="Peso" name="peso" disabled="" onkeypress="return onlynumber();" required="" value="<?php echo!empty($peso) ? $peso : ''; ?>">
                                    </div>
                                    <div class="col-4">
                                        <label>Motorista</label>
                                        <input type="text" class="form-control" placeholder="Motorista" name="motorista" disabled="" required="" value="<?php echo!empty($motorista) ? $motorista : ''; ?>">
                                    </div>
                                </div>

                                <div class="row"> 
                                    <div class="col-4">
                                        <label>Valor da Saca</label>
                                        <input type="text" class="form-control" placeholder="Valor da Saca" name="valorSaca" disabled="" onkeypress="return onlynumber();" required="" value="<?php echo!empty($valorSaca) ? $valorSaca : ''; ?>">
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group">
                                            <label>Total Sacas 50 kg</label>
                                            <input type="text" class="form-control" placeholder="Total Sacas 50 kg" name="qtdSacas50" disabled="" onkeypress="return onlynumber();" required="" value="<?php echo!empty($qtdSacas50) ? $qtdSacas50 : ''; ?>">
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group">
                                            <label>Total Sacas 25 kg</label>
                                            <input type="text" class="form-control" placeholder="Total Sacas 25 kg" name="qtdSacas25" disabled="" onkeypress="return onlynumber();" required="" value="<?php echo!empty($qtdSacas25) ? $qtdSacas25 : ''; ?>">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row"> 
                                    <div class="col-4">
                                        <label>Valor da Carga</label>
                                        <input type="text" class="form-control" placeholder="Valor da Carga" name="valorSaca" disabled="" value="R$ <?php echo number_format($preco, 2, ',', '.'); ?>">
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group">
                                            <label>Total Pagamentos</label>
                                            <input type="text" class="form-control" placeholder="Total Pagamentos" disabled="" required="" value="<?php echo!empty($valorP) ? 'R$ '.number_format($valorP, 2, ',', '.') : 'R$ 0,00'; ?>">
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group">
                                            <label>Total Despesas</label>
                                            <input type="text" class="form-control" placeholder="Total Sacas 25 kg" name="qtdSacas25" disabled="" onkeypress="return onlynumber();" required="" value="<?php echo!empty($valorD) ? 'R$ '.number_format($valorD, 2, ',', '.') : 'R$ 0,00'; ?>">
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->

                                <div class="modal-footer justify-content-md-center">
                                    <a href="cargas.php" class="btn btn-warning" >Voltar</a>
                                </div>
                            </div>


                        </form>
                    </div>
                    <!-- /.card -->
                </section>


            </div>
            <!-- /.content-wrapper -->
            <footer class="main-footer">
                <div class="float-right d-none d-sm-block">
                    <b>Version</b> <?php echo $_SESSION['versao']; ?>
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
        <!-- SweetAlert2 -->
        <script src="../../plugins/sweetalert2/sweetalert2.min.js"></script>
        <!-- Toastr -->
        <script src="../../plugins/toastr/toastr.min.js"></script>

        <!-- page script -->
        <?php include '../util/js.html'; ?>

    </body>
</html>  

<?php
ob_end_flush();
?>
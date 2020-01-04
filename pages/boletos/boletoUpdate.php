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

if (!empty($_POST)) {
    
    $dataVcto = $_POST['dataVcto'];
    if (strlen($_POST['valor']) < 7) {
        $valor = str_replace(",", ".", $_POST['valor']);
    } else {
        $valor = str_replace(",", ".", str_replace(".", "", $_POST['valor']));
    }
    $credor = $_POST['credor'];
    $obs = $_POST['obs'];

    //Inserindo no Banco:
    $pdo = Banco::conectar();
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $sql = "UPDATE boleto set dataVcto = ?, valor = ?, credor = ?, obs = ? WHERE id = ?";
    $q = $pdo->prepare($sql);
    $q->execute(array($dataVcto, $valor, $credor, $obs, $id));
    Banco::desconectar();
    header("Location: boleto.php");

} else {
    $pdo = Banco::conectar();
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $sql = "SELECT * FROM boleto where id = ?";
    $q = $pdo->prepare($sql);
    $q->execute(array($id));
    $stmt = $q->fetch(PDO::FETCH_ASSOC);
    $dataVcto = $stmt['dataVcto'];
    $valor = number_format($stmt['valor'], 2, ',', '.');
    $credor = $stmt['credor'];
    $obs = $stmt['obs'];

    Banco::desconectar();
}
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
                                <h1>Editar Boleto</h1>
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

                        <form action="boletoUpdate.php?id=<?php echo $id ?>" method="post">
                            <div class="card-body">

                                <div class="row">
                                    <div class="col-4">
                                        <div class="form-group">
                                            <label>Data Vencimento</label>  
                                            <input type="date" class="form-control" name="dataVcto" required="" value="<?php echo!empty($dataVcto) ? $dataVcto : ''; ?>"> 
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <label>Valor</label>
                                        <input type="text" class="form-control" placeholder="Valor" name="valor" onkeyup="moeda(this);" required="" value="<?php echo!empty($valor) ? $valor : ''; ?>">
                                    </div>
                                </div>

                                <div class="row"> 
                                    <div class="col-4">
                                        <label>Credor</label>
                                        <input type="text" class="form-control" placeholder="Credor" name="credor" required="" value="<?php echo!empty($credor) ? $credor : ''; ?>">
                                    </div>
                                    <div class="col-5">
                                        <div class="form-group">
                                            <label>Observação</label>
                                            <input type="text" class="form-control" placeholder="Observação" name="obs" value="<?php echo!empty($obs) ? $obs : ''; ?>">
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->

                                <div class="modal-footer justify-content-between">
                                    <button type="submit" class="btn btn-success swalDefaultSuccess">Atualizar</button>
                                    <a href="boleto.php" class="btn btn-warning" >Cancelar</a>
                                </div>
                            </div>

                        </form>
                    </div>
                    <!-- /.card -->
                </section>

                <!-- LISTA DE VENDAS -->

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
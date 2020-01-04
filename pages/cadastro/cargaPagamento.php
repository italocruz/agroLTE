<?php
include '../../sessao.php';

include '../../banco.php';

$idCarga = null;
if (!empty($_GET['id'])) {
    $idCarga = $_REQUEST['id'];
}

$carga = $idCarga;

$pdo = Banco::conectar();
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$sqlC = "SELECT peso, valorSaca FROM carga where id = ?";
$qC = $pdo->prepare($sqlC);
$qC->execute(array($carga));
$stmt = $qC->fetch(PDO::FETCH_ASSOC);
$peso = $stmt['peso'];
$valorSaca = number_format($stmt['valorSaca'], 2, ',', '.');

$sqlP = "SELECT valor FROM pagamento where idCarga = ? AND tipoPagamento = '1'";
$qP = $pdo->prepare($sqlP);
$qP->execute(array($carga));
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
                                <h1>Pagamento</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <h1>Valor da Cargar: R$ <?php echo number_format($preco, 2, ',', '.'); ?></h1>
                                </ol>
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
                        <form action="cargaPagamento.php?id=<?php echo $carga ?>" method="post">    
                            <div class="card-body">
                                
                                <div class="row">
                                    <div class="col-4">
                                        <div class="form-group">
                                            <input type="hidden" name="tipoPagamento" required="" value="1"> <!-- valor 1 = carga -->
                                            <input type="hidden" name="idCarga" required="" value="<?php $carga ?>"> 
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-4">
                                        <div class="form-group">
                                            <label>Data</label>  
                                            <input type="date" class="form-control" name="data" required="" value="<?php echo!empty($data) ? $data : date("Y-m-d"); ?>"> 
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <label>Valor</label>
                                        <input type="text" class="form-control" placeholder="Valor" name="valor" onkeyup="moeda(this);" required="" value="<?php echo!empty($valor) ? $valor : ''; ?>">
                                    </div>
                                    <div class="col-4">
                                        <label>Descrição</label>
                                        <input type="text" class="form-control" placeholder="Descrição" name="descricao" required="" value="<?php echo!empty($descricao) ? $descricao : ''; ?>">
                                    </div>
                                </div>

                                <!-- /.card-body -->

                                <div class="modal-footer justify-content-between">
                                    <button type="submit" class="btn btn-success swalDefaultSuccess">Pagar</button>
                                    <a href="cargas.php" class="btn btn-warning" >Cancelar</a>
                                </div>
                            </div>

                        </form>
                    </div>
                    <!-- /.card -->
                </section>

                <?php
                if (!empty($_POST)) {
                    $data = $_POST['data'];
                    
                    if (strlen($_POST['valor']) < 7) {
                        $valor = str_replace(",", ".", $_POST['valor']);
                    } else {
                        $valor = str_replace(",", ".", str_replace(".", "", $_POST['valor']));
                    }
                    
                    $descricao = $_POST['descricao'];
                    $tipoPagamento = $_POST['tipoPagamento'];
                    
                    //Inserindo no Banco:
                    $pdo = Banco::conectar();
                    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                    $sql = "INSERT INTO pagamento (data, valor, descricao, tipoPagamento, idCarga) VALUES(?,?,?,?,?)";
                    $q = $pdo->prepare($sql);
                    $q->execute(array($data, $valor, $descricao, $tipoPagamento, $carga));
                    Banco::desconectar();
                    header("Location: cargas.php");
                }
                ?>
                
                <!-- LISTA DE PAGAMENTOS -->
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Saldo Devedor: R$ <?php echo number_format(($preco - $valorP), 2, ',', '.');?></h1>
                            </div>
                        </div>
                    </div><!-- /.container-fluid -->
                </section>
                
                <?php
                $pdo = Banco::conectar();
                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                //$hoje = date("Y-m-d");
                $sql = 'SELECT * FROM pagamento WHERE idCarga = :idCarga AND tipoPagamento = "1" ORDER BY data DESC';
                $q = $pdo->prepare($sql);
                $q->execute(array('idCarga' => $carga));

                $res = $q->fetchAll();
                
                if (count($res)) {
                ?>

                <section class="content">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title"></h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="example2" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th style="display:none">#</th>
                                        <th>Data</th>
                                        <th>Valor</th>
                                        <th>Descrição</th>
                                        <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <?php
                                    foreach ($res as $row) {
                                        echo '<tr>';
                                        echo '<th scope="row" style="display:none">' . $row['id'] . '</th>';
                                        echo '<td>' . date("d/m/Y", strtotime($row['data'])) . '</td>';
                                        echo '<td> R$ ' .  number_format($row['valor'], 2, ',', '.') . '</td>';
                                        echo '<td>' . $row['descricao'] . '</td>';
                                        
                                        echo '<td width=55>';
                                        echo ' ';
                                        echo '<a class="btn btn-danger" href="pgtoDelete.php?id=' . $row['id'] . '" data-confirm="Deseja excluir?"><i class="fas fa-trash-alt mr-2"></i></a>';
                                        echo '</td>';
                                        
                                        echo '</tr>';
                                    }
                                    ?>

                                </tbody>

                            </table>
                        </div>
                        <!-- /.card-body -->

                    </div>
                    <!-- /.card -->
                </section>
                <!-- Main content -->
                
                <?php
                } else {
                    echo '<div class="card-header">';
                    echo '<h3 class="card-title">Nenhum resultado retornado.</h3>';
                    echo '</div>';
                }
                Banco::desconectar();
                ?>
                <!-- FIM PAGAMENTOS -->


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
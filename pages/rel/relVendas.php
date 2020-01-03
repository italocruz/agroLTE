<?php
include '../../sessao.php';
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
                                <h1>Relatório de Vendas</h1>
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
                        <form action="relVendas.php" method="post">
                            <div class="card-body">

                                <div class="row">
                                    <div class="col-4">
                                        <div class="form-group">
                                            <label>Data</label>  
                                            <input type="date" class="form-control" name="data" required="" value="<?php echo!empty($data) ? $data : date("Y-m-d"); ?>"> 
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->

                                <div class="modal-footer justify-content-between">
                                    <button type="submit" class="btn btn-success swalDefaultSuccess">Gerar</button>
                                    <a href="relVendas.php" class="btn btn-warning" >Limpar</a>
                                </div>
                            </div>

                        </form>
                    </div>
                    <!-- /.card -->
                </section>

                <?php
                include '../../banco.php';

                if (!empty($_POST)) {
                    $data = $_POST['data'];
                    //Inserindo no Banco:
                    $pdo = Banco::conectar();
                    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                    $sql = "SELECT * FROM venda WHERE data = :data  ORDER BY id";
                    $q = $pdo->prepare($sql);
                    $q->execute(array('data' => $data));

                    $result = $q->fetchAll();

                    if (count($result)) {
                        ?>

                        <section class="content">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">Relatório de Vendas do dia: <b><?php echo date("d/m/Y", strtotime($data)); ?></b></h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table id="relatorio" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th style="display:none">#</th>
                                                <th>Produto</th>
                                                <th>Valor Venda</th>
                                                <th>Quantidade</th>
                                                <th>Tipo</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <?php
                                            foreach ($result as $row) {
                                                if ($row['tipo'] == 'Milho') {
                                                    $totalMilho = $totalMilho + $row['valorVenda'];
                                                }
                                                if ($row['tipo'] == 'Ração') {
                                                    $totalRacao = $totalRacao + $row['valorVenda'];
                                                }

                                                echo '<tr>';
                                                echo '<th scope="row" style="display:none">' . $row['id'] . '</th>';
                                                echo '<td>' . $row['produto'] . '</td>';
                                                echo '<td> R$ ' . number_format($row['valorVenda'], 2, ',', '.') . '</td>';
                                                echo '<td>' . $row['quantidade'] . '</td>';
                                                echo '<td>' . $row['tipo'] . '</td>';
                                            }

                                            echo '</tr>';
                                            echo '<th colspan="1">Total Milho:</th>';
                                            echo '<td colspan="1" > <b>R$ ' . number_format($totalMilho, 2, ',', '.') . '</b> </td>';
                                            echo '<th colspan="1">Total Ração:</th>';
                                            echo '<td colspan="1"> <b>R$ ' . number_format($totalRacao, 2, ',', '.') . '</b> </td>';
                                            echo '<tr>';
                                            echo '<th colspan="2">Total do Dia:</th>';
                                            echo '<td colspan="2" > <b>R$ ' . number_format(($totalMilho + $totalRacao), 2, ',', '.') . '</b> </td>';
                                            echo '</tr>';
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
        
        <!-- page script -->
        <?php include '../util/js.html'; ?>

    </body>
</html>
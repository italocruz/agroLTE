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
                                <h1>Relatório de Despesas Variáveis</h1>
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
                        <form action="relDespesas.php" method="post">
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
                                    <a href="relDespesas.php" class="btn btn-warning" >Limpar</a>
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
                    $sql = 'SELECT d.id, d.descricao, d.valor, d.data, r.nome FROM despesa d, requerente r WHERE r.id = d.requerente AND d.data = :data ORDER BY d.id DESC';
                    $q = $pdo->prepare($sql);
                    $q->execute(array('data' => $data));

                    $result = $q->fetchAll();

                    if (count($result)) {
                        ?>

                        <section class="content">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">Relatório de Despesas Variáveis do dia: <b><?php echo date("d/m/Y", strtotime($data)); ?></b></h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table id="example2" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th style="display:none">#</th>
                                                <th>Descrição</th>
                                                <th>Valor</th>
                                                <th>Requerente</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <?php
                                            foreach ($result as $row) {
                                                $total = $total + $row['valor'];

                                                echo '<tr>';
                                                echo '<th scope="row" style="display:none">' . $row['id'] . '</th>';
                                                echo '<td>' . $row['descricao'] . '</td>';
                                                echo '<td>' . $row['valor'] . '</td>';
                                                echo '<td>' . $row['nome'] . '</td>';   
                                            }

                                            echo '</tr>';
                                            ?>
                                        </tbody>
                                        <?php
                                            echo '<th colspan="4" class="bg-light" style="text-align: center">Despesas do Dia</th>';
                                            echo '<tr>';
                                            echo '<th colspan="2">Total do Dia:</th>';
                                            echo '<td colspan="1" > <b>R$ ' . $total . ',00</b> </td>';
                                            echo '</tr>';
                                            echo '</tr>';
                                        ?>

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
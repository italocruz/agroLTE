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
                                <h1>Boletos Abertos</h1>
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
                        <div class="card-body">
                            <table id="boleto" class="table table-bordered table-striped">
                                <thead>
                                    <tr >
                                        <th style="display:none">#</th>
                                        <th>Data Vencimento</th>
                                        <th>Valor</th>
                                        <th>Credor</th>
                                        <th>Observação</th>
                                        <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <?php
                                    include '../../banco.php';
                                    $pdo = Banco::conectar();
                                    
                                    $status = "0"; //Boletos em aberto
                                    
                                    $sql = 'SELECT * FROM boleto WHERE status = :status ORDER BY dataVcto';
                                    $q = $pdo->prepare($sql);
                                    $q->execute(array('status' => $status));
                                    
                                    $result = $q->fetchAll();
                                    
                                    $hoje = date("Y-m-d");
                                    $btnSuccess = 'class="btn btn-success"';
                                    $btnWarning = 'class="btn btn-warning"';
                                    $btnDanger = 'class="btn btn-danger"';
                                    
                                    foreach ($result as $row) {

                                        if ($row['dataVcto'] < $hoje) { 
                                            $class = $btnDanger;
                                        } else if ($row['dataVcto'] == $hoje) { 
                                            $class = $btnWarning;
                                        } else {
                                             $class = $btnSuccess;
                                        }                                      
                                        
                                        echo '<tr>';
                                        echo '<th scope="row" style="display:none">' . $row['id'] . '</th>';
                                        echo '<td>' . date("d/m/Y", strtotime($row['dataVcto'])) . '</td>';
                                        echo '<td> R$ ' . number_format($row['valor'], 2, ',', '.') . '</td>';
                                        echo '<td>' . $row['credor'] . '</td>';
                                        echo '<td>' . $row['obs'] . '</td>';
                                        echo '<td width=55>';
                                        echo ' ';
                                        echo '<a ' . $class . '" href="boletoPgto.php?id=' . $row['id'] . '" data-pgto="Confirmar?"><i class=" fas fa-dollar-sign mr-2"></i></a>';
                                        
                                        echo '</td>';
                                        echo '</tr>';
                                    }
                                    Banco::desconectar();
                                    ?>

                                </tbody>

                            </table>
                        </div>
                        <!-- /.card-body -->

                        <div class="modal-footer justify-content-between">
                            <a href="../../index.php" class="btn btn-default" >Voltar</a>
                        </div>
                    </div>
                    <!-- /.card -->
                </section>
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
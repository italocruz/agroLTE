<?php
session_start();
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


            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="../../index.php" class="nav-link">Início</a>
                    </li>
                </ul>
            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-dark-primary elevation-4">


                <!-- Sidebar -->
                <div class="sidebar">
                    <!-- Sidebar user (optional) -->
                    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                        <div class="image">
                            <img src="../../dist/img/central/central.jpg" width=”160” height=”160” class="img-circle elevation-2">
                        </div>
                        <div class="info">
                            <a href="#" class="d-block">Central Agro</a>
                        </div>
                    </div>

                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                            <!-- Add icons to the links using the .nav-icon class
                                 with font-awesome or any other icon font library -->


                            <!-- Menu Central -->
                            <li class="nav-item has-treeview">
                                <a href="produto.php" class="nav-link">
                                    <i class="nav-icon fas fa-cash-register"></i>
                                    <p>
                                        Vendas
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="venda.php" class="nav-link">
                                            <i class="fas fa-cart-arrow-down nav-icon"></i>
                                            <p>Venda</p>
                                        </a>
                                    </li>  
                                </ul>
                                <!--
                                <ul class="nav nav-treeview">
                                  <li class="nav-item">
                                    <a href="produto.php" class="nav-link">
                                      <i class="fas fa-calculator nav-icon"></i>
                                      <p>Fechar Caixa</p>
                                    </a>
                                  </li>  
                                </ul>
                                -->
                            </li>

                            <!-- MENU PAGAMENTOS
                            <li class="nav-item has-treeview">
                              <a href="#" class="nav-link">
                                <i class="nav-icon fas fa-dollar-sign"></i>
                                <p>
                                  Pagamentos
                                  <i class="fas fa-angle-left right"></i>
                                </p>
                              </a>
                              <ul class="nav nav-treeview">
                                <li class="nav-item">
                                  <a href="produto.php" class="nav-link">
                                    <i class="fas fa-barcode nav-icon"></i>
                                    <p>Fornecedores</p>
                                  </a>
                                </li>  
                              </ul>
                            </li>
                            FIM MENU PAGAMENTOS -->

                            <li class="nav-item has-treeview">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-edit"></i>
                                    <p>
                                        Cadastro
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="../pagamento/despesa.php" class="nav-link">
                                            <i class="fas fa-barcode nav-icon"></i>
                                            <p>Despesas</p>
                                        </a>
                                    </li>  
                                </ul>
                                <!--
                                <ul class="nav nav-treeview">
                                  <li class="nav-item">
                                    <a href="produto.php" class="nav-link">
                                      <i class="fas fa-barcode nav-icon"></i>
                                      <p>Produto</p>
                                    </a>
                                  </li>  
                                </ul>
                                <ul class="nav nav-treeview">
                                  <li class="nav-item">
                                    <a href="produto.php" class="nav-link">
                                      <i class="fas fa-barcode nav-icon"></i>
                                      <p>Cargas</p>
                                    </a>
                                  </li>  
                                </ul>
                                <ul class="nav nav-treeview">
                                  <li class="nav-item">
                                    <a href="produto.php" class="nav-link">
                                      <i class="fas fa-barcode nav-icon"></i>
                                      <p>Boletos</p>
                                    </a>
                                  </li>  
                                </ul>
                                <ul class="nav nav-treeview">
                                  <li class="nav-item">
                                    <a href="produto.php" class="nav-link">
                                      <i class="fas fa-barcode nav-icon"></i>
                                      <p>Compras</p>
                                    </a>
                                  </li>  
                                </ul>
                                <ul class="nav nav-treeview">
                                  <li class="nav-item">
                                    <a href="produto.php" class="nav-link">
                                      <i class="fas fa-barcode nav-icon"></i>
                                      <p>Fornecedores</p>
                                    </a>
                                  </li>  
                                </ul>
                                <ul class="nav nav-treeview">
                                  <li class="nav-item">
                                    <a href="produto.php" class="nav-link">
                                      <i class="fas fa-barcode nav-icon"></i>
                                      <p>Clientes</p>
                                    </a>
                                  </li>  
                                </ul>
                                -->
                            </li>

                            <li class="nav-item has-treeview">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-copy"></i>
                                    <p>
                                        Relatórios
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="../rel/relVendas.php" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Vendas</p>
                                        </a>
                                    </li>
                                </ul>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="../rel/relDespesas.php" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Despesas</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <!-- Fim Menu Central -->
                        </ul>
                    </nav>
                    <!-- /.sidebar-menu -->
                </div>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Lista de Vendas</h1>
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
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th style="display:none">#</th>
                                        <th>Produto</th>
                                        <th>Valor Venda</th>
                                        <th>Quantidade</th>
                                        <th>Data</th>
                                        <th>Tipo</th>
                                        <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <?php
                                    include '../../banco.php';
                                    $pdo = Banco::conectar();
                                    $hoje = date("Y-m-d");
                                    $sql = 'SELECT * FROM venda WHERE data = " ' . $hoje . ' " ORDER BY id DESC';
                                    foreach ($pdo->query($sql)as $row) {
                                        echo '<tr>';
                                        echo '<th scope="row" style="display:none">' . $row['id'] . '</th>';
                                        echo '<td>' . $row['produto'] . '</td>';
                                        echo '<td>' . $row['valorVenda'] . '</td>';
                                        echo '<td>' . $row['quantidade'] . '</td>';
                                        echo '<td>' . date("d/m/Y", strtotime($row['data'])) . '</td>';
                                        echo '<td>' . $row['tipo'] . '</td>';
                                        echo '<td width=110>';


                                        echo ' ';
                                        echo '<a class="btn btn-warning" href="vendaUpdate.php?id=' . $row['id'] . '"><i class="fas fa-edit mr-2"></i></a>';
                                        echo ' ';
                                        echo '<a class="btn btn-danger" href="vendaDelete.php?id=' . $row['id'] . '" data-confirm="Deseja excluir?"><i class="fas fa-trash-alt mr-2"></i></a>';
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
                            <a href="venda.php" class="btn btn-default" >Voltar</a>
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
        <script>
            $(function () {
                $("#example1").DataTable();
                $('#example2').DataTable({
                    "paging": true,
                    "lengthChange": false,
                    "searching": false,
                    "ordering": true,
                    "info": true,
                    "autoWidth": false,
                });
            });

            $(document).ready(function () {
                $('a[data-confirm]').click(function (ev) {
                    var href = $(this).attr('href');
                    if (!$('#confirm-delete').length) {
                        $('body').append('<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"><div class="modal-dialog modal-sm"><div class="modal-content bg-danger"><div class="modal-header bg-danger text-white"><h4 class="modal-title">Deseja excluir?</h4></div><div class="modal-footer justify-content-between"><button type="button" class="btn btn-outline-light" data-dismiss="modal">Não</button><a class="btn btn-outline-light" id="dataComfirmOK">Sim</a></div></div></div></div>');
                    }
                    $('#dataComfirmOK').attr('href', href);
                    $('#confirm-delete').modal({show: true});
                    return false;
                });
            });

        </script>

    </body>
</html>
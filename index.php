<?php
date_default_timezone_set('America/Sao_Paulo');
if (session_status() !== PHP_SESSION_ACTIVE) {
  //Definindo o prazo para a cache expirar em 60 minutos.
  session_cache_expire(1);
  session_start();
  $_SESSION['versao'] = "1.0.0";
  error_reporting(E_WARNING);
}

//session_start();
//$_SESSION['versao'] = "1.0.0";
//Definindo o prazo para a cache expirar em 60 minutos.
  //session_cache_expire(1);
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
        <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Tempusdominus Bbootstrap 4 -->
        <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
        <!-- iCheck -->
        <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
        <!-- JQVMap -->
        <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/adminlte.min.css">
        <!-- overlayScrollbars -->
        <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
        <!-- Daterange picker -->
        <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
        <!-- summernote -->
        <link rel="stylesheet" href="plugins/summernote/summernote-bs4.css">
        <!-- Google Font: Source Sans Pro -->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    </head>
    <body class="hold-transition sidebar-mini layout-fixed">
        <div class="wrapper">

            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="index.php" class="nav-link">Início</a>
                    </li>
                </ul>
                
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link" data-toggle="dropdown" href="#">
                            <i class="far fa-user"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                            <div class="dropdown-divider"></div>
                            
                            <?php if(empty($_SESSION['UsuarioNome'])) { ?>
                            <a href="login.php" class="dropdown-item">
                                <i class="fas fa-sign-in-alt mr-2"></i> Entrar
                            </a>
                            <?php } ?>
                            <?php if(!empty($_SESSION['UsuarioNome'])) { ?>
                            <div class="dropdown-divider"></div>
                            <a href="logout.php" class="dropdown-item">
                                <i class="fas fa-sign-out-alt mr-2"></i> Sair
                            </a>
                            <?php } ?>
                        </div>
                    </li>
                </ul>
                <?php if(!empty($_SESSION['UsuarioNome'])) {echo 'Olá, '.$_SESSION['UsuarioNome'].'!';} ?>
            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-dark-primary elevation-4">
                <!-- Brand Logo -->

                <!-- Sidebar -->
                <div class="sidebar">
                    <!-- Sidebar user panel (optional) -->
                    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                        <div class="image">
                            <img src="dist/img/central/central.jpg" width=”160” height=”160” class="img-circle elevation-2" >
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
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-cash-register"></i>
                                    <p>
                                        Vendas
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="pages/vendas/venda.php" class="nav-link">
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
                            
                            <?php if ($_SESSION['UsuarioNivel'] == "2") { ?>
                            <li class="nav-item has-treeview">
                                <a href="#" class="nav-link">
                                    <i class="fas fa-calculator nav-icon"></i>
                                    <p>
                                        Caixa
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="pages/rel/relVendas.php" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Vendas</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="pages/rel/relDespesas.php" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Despesas Variáveis</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <?php } ?>

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
                                        <a href="pages/pagamento/despesa.php" class="nav-link">
                                            <i class="fas fa-barcode nav-icon"></i>
                                            <p>Despesas Variáveis</p>
                                        </a>
                                    </li>
                                    <?php if ($_SESSION['UsuarioNivel'] == "2") { ?>
                                        <li class="nav-item">
                                            <a href="pages/boletos/boletosAbertos.php" class="nav-link">
                                                <i class="fas fa-barcode nav-icon"></i>
                                                <p>Boletos</p>
                                            </a>
                                        </li>
                                    <?php } ?>
                                </ul>
                            </li>

                            <?php if ($_SESSION['UsuarioNivel'] == "2") { ?>
                            <li class="nav-item has-treeview">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-edit"></i>
                                    <p>
                                        Organização
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                  <li class="nav-item">
                                      <a href="pages/boletos/boleto.php" class="nav-link">
                                      <i class="fas fa-clipboard nav-icon"></i>
                                      <p>Boletos</p>
                                    </a>
                                  </li>  
                                </ul>
                                <ul class="nav nav-treeview">
                                  <li class="nav-item">
                                      <a href="pages/cadastro/carga.php" class="nav-link">
                                      <i class="fas fa-clipboard nav-icon"></i>
                                      <p>Cargas</p>
                                    </a>
                                  </li>  
                                </ul>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="pages/funcionarios/funcionario.php" class="nav-link">
                                            <i class="fas fa-clipboard nav-icon"></i>
                                            <p>Funcionários</p>
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
                            <?php } ?>
                            
                            <!-- icon para relatório -->
                            <!-- <i class="nav-icon fas fa-copy"></i> -->
                                
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
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1 class="m-0 text-dark"></h1>
                            </div><!-- /.col -->
                        </div><!-- /.row -->
                    </div><!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->

                <!-- Main content -->
                
                <section class="content">
                    <div class="container-fluid">
                        <!-- Small boxes (Stat box) -->
                        <div class="row">
                            <!--
                            <div class="col-lg-3 col-6">
                                <div class="small-box bg-info">
                                    <div class="inner">
                                        <h3>150</h3>

                                        <p>New Orders</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-bag"></i>
                                    </div>
                                    <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            -->
                            <!-- ./col -->
                            <!--
                            <div class="col-lg-3 col-6">
                                <div class="small-box bg-success">
                                    <div class="inner">
                                        <h3>53<sup style="font-size: 20px">%</sup></h3>

                                        <p>Bounce Rate</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-stats-bars"></i>
                                    </div>
                                    <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            -->
                            <!-- ./col -->
                            <!--
                            <div class="col-lg-3 col-6">
                                <div class="small-box bg-warning">
                                    <div class="inner">
                                        <h3>44</h3>

                                        <p>User Registrations</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-person-add"></i>
                                    </div>
                                    <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            -->
                            <!-- ./col -->
                            <?php
                            include 'banco.php';
                            $pdo = Banco::conectar();

                            $status = "0"; //Boletos em aberto
                            $hoje = date("Y-m-d");
                            $sql = 'SELECT * FROM boleto WHERE status = ? AND dataVcto = ? ORDER BY dataVcto';
                            $q = $pdo->prepare($sql);
                            $q->execute(array($status, $hoje));
                            $result = $q->fetchAll();
                            if (count($result)) {
                                foreach ($result as $row) {
                                    $total = $total + 1;
                                }
                            ?>
                            <div class="col-lg-3 col-6">
                                <!-- small box -->
                                <div class="small-box bg-danger">
                                    <div class="inner">
                                        <h3><?php echo $total; ?></h3>
                                        <?php 
                                            if ($total > 1) {
                                                echo '<p>Boletos vencendo hoje!</p>';
                                            } else {
                                                echo '<p>Boleto vencendo hoje!</p>';
                                            }
                                        ?>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-clipboard"></i>
                                    </div>
                                    <a href="pages/boletos/boletosAbertos.php" class="small-box-footer">Verificar <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            <?php } ?>
                            <!-- ./col -->
                        </div>
                        <!-- /.row -->
                        <!-- Main row -->


                <div class="card card-solid">
                    <div class="card-body">
                        <div class="row justify-content-md-center">
                            <div class="col-auto">
                                <div class="col-10">
                                    <img src="dist/img/central/central.jpg" class="product-image im" alt="Product Image">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.card-body -->
                </div>



                <!-- /.row (main row) -->
            </div><!-- /.container-fluid -->

        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer">
        <strong>Copyright &copy; 2015-<?php echo date("Y") ?> <a href="#">Central Grãos</a>.</strong>
        <div class="float-right d-none d-sm-inline-block">
            <b>Version</b> <?php echo $_SESSION['versao'] ?>
        </div>
    </footer>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
</body>
</html>

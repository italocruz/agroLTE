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
                                <h1>Despesa</h1>
                            </div>
                            <?php if ($_SESSION['UsuarioNivel'] == "2") { ?>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <a href="despesas.php" class="btn btn-primary swalDefaultSuccess">Despesas Passadas</a>
                                </ol>
                            </div>
                            <?php } ?>
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
                        <form action="despesa.php" method="post">
                            <div class="card-body">

                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label>Descrição</label>
                                            <input type="text" class="form-control" placeholder="Descrição" name="descricao" required="" value="<?php echo!empty($descricao) ? $descricao : ''; ?>">
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-group">
                                            <label>Valor</label>
                                            <input type="text" class="form-control" placeholder="Valor" name="valor" required="" onkeyup="moeda(this);" value="<?php echo!empty($valor) ? $valor : ''; ?>">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label>Requerente</label>
                                            <select class="form-control select2" style="width: 100%;" name="requerente" required="">
                                                <option selected="selected" value="0">Selecione</option>
                                                <?php
                                                include '../../banco.php';
                                                $pdo = Banco::conectar();
                                                $sql = 'SELECT * FROM requerente ORDER BY id';
                                                foreach ($pdo->query($sql)as $row) {
                                                    echo '<option value="' . $row["id"] . '">' . $row["nome"] . '</option>';
                                                }
                                                Banco::desconectar();
                                                ?>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-4">
                                        <div class="form-group">
                                            <label>Data</label>  
                                            <input type="date" class="form-control" name="data" required="" value="<?php echo!empty($data) ? $data : date("Y-m-d"); ?>"> 
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                                <div class="modal-footer justify-content-between">
                                    <button type="submit" class="btn btn-success swalDefaultSuccess">Salvar</button>
                                    <a href="../../index.php" class="btn btn-warning" >Cancelar</a>
                                </div>
                            </div>


                        </form>
                    </div>
                    <!-- /.card -->
                </section>

                <?php
                if (!empty($_POST)) {

                    $descricao = $_POST['descricao'];
                    if (strlen($_POST['valor']) < 7) {
                        $valor = str_replace(",", ".", $_POST['valor']);
                    } else {
                        $valor = str_replace(",", ".", str_replace(".", "", $_POST['valor']));
                    }
                    $requerente = $_POST['requerente'];
                    $data = $_POST['data'];

                    //Inserindo no Banco:
                    $pdo = Banco::conectar();
                    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                    $sql = "INSERT INTO despesa (descricao, valor, requerente, data) VALUES(?,?,?,?)";
                    $q = $pdo->prepare($sql);
                    $q->execute(array($descricao, $valor, $requerente, $data));
                    Banco::desconectar();
                    header("Location: despesa.php");
                }
                ?> 

                <!-- LISTA DE DESPESAS -->
                <?php
                $pdo = Banco::conectar();
                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $hoje = date("Y-m-d");
                $sql = 'SELECT d.id, d.descricao, d.valor, d.data, r.nome FROM despesa d, requerente r WHERE r.id = d.requerente AND d.data = :hoje ORDER BY d.id DESC';
                $q = $pdo->prepare($sql);
                $q->execute(array('hoje' => $hoje));

                $result = $q->fetchAll();

                if (count($result)) {
                    ?>
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <div class="container-fluid">
                            <div class="row mb-2">
                                <div class="col-sm-6">
                                    <h1>Despesas do dia: <?php echo date("d-m-Y"); ?></h1>
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
                                <table id="despesa" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th style="display:none">#</th>
                                            <th>Descrição</th>
                                            <th>Valor</th>
                                            <th>Requerente</th>
                                            <th>Ação</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <?php
                                        foreach ($result as $row) {
                                            echo '<tr>';
                                            echo '<th scope="row" style="display:none">' . $row['id'] . '</th>';
                                            echo '<td>' . $row['descricao'] . '</td>';
                                            echo '<td> R$ ' . number_format($row['valor'], 2, ',', '.') . '</td>';
                                            echo '<td>' . $row['nome'] . '</td>';
                                            echo '<td width=110>';

                                            echo ' ';
                                            echo '<a class="btn btn-warning" href="despesaUpdate.php?id=' . $row['id'] . '"><i class="fas fa-edit mr-2"></i></a>';
                                            echo ' ';
                                            echo '<a class="btn btn-danger" href="despesaDelete.php?id=' . $row['id'] . '" data-confirm="Deseja excluir?"><i class="fas fa-trash-alt mr-2"></i></a>';
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
                <!-- FIM DESPESAS -->

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
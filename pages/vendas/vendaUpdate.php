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

    $produto = $_POST['produto'];
    $valorVenda = $_POST['valorVenda'];
    $quantidade = $_POST['quantidade'];
    $data = $_POST['data'];
    //$data = date('Y-m-d', strtotime($_POST["data"]));
    $tipo = $_POST['tipo'];

    //Inserindo no Banco:
    $pdo = Banco::conectar();
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $sql = "UPDATE venda  set produto = ?, valorVenda = ?, quantidade = ?, data = ?, tipo = ? WHERE id = ?";
    $q = $pdo->prepare($sql);
    $q->execute(array($produto, $valorVenda, $quantidade, $data, $tipo, $id));
    Banco::desconectar();
    header("Location: venda.php");

} else {
    $pdo = Banco::conectar();
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $sql = "SELECT * FROM venda where id = ?";
    $q = $pdo->prepare($sql);
    $q->execute(array($id));
    $stmt = $q->fetch(PDO::FETCH_ASSOC);
    $produto = $stmt['produto'];
    $valorVenda = $stmt['valorVenda'];
    $quantidade = $stmt['quantidade'];
    $data = $stmt['data'];
    $tipo = $stmt['tipo'];

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
                                <h1>Editar Venda</h1>
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

                        <form action="vendaUpdate.php?id=<?php echo $id ?>" method="post">
                            <div class="card-body">

                                <div class="row">
                                    <div class="col-sm-6">
                                        <!-- text input -->
                                        <div class="form-group">
                                            <label>Produto</label>
                                            <input type="text" class="form-control" placeholder="Nome" name="produto" required="" value="<?php echo!empty($produto) ? $produto : ''; ?>">
                                        </div>
                                    </div>
                                    <!--
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Descrição</label>
                                            <input type="text" class="form-control" placeholder="Descrição" name="descricao" required="" value="< ?php echo!empty($descricao) ? $descricao : ''; ?>">
                                        </div>
                                    </div>
                                    -->
                                </div>


                                <div class="row">
                                    <div class="col-4">
                                        <label>Quantidade</label>
                                        <input type="text" class="form-control" placeholder="Quantidade" name="quantidade" required="" value="<?php echo!empty($quantidade) ? $quantidade : ''; ?>">
                                    </div>
                                    <div class="col-4">
                                        <label>Valor da Venda</label>
                                        <input type="text" class="form-control" placeholder="Valor Venda" name="valorVenda" required="" onkeypress="return onlynumber();" value="<?php echo!empty($valorVenda) ? $valorVenda : ''; ?>">
                                    </div>
                                    <div class="col-4">
                                        <label>Data</label>  
                                        <input type="date" class="form-control" name="data" required="" value="<?php echo!empty($data) ? $data : ''; ?>"> 
                                    </div>
                                </div>

                                <br>
                                <div class="row">    
                                    <div class="col-3">
                                        <label>Tipo Produto</label> 
                                        <!-- checkbox -->
                                        <div class="form-group clearfix">
                                            <div class="form-check d-inline">
                                                <input type="radio" name="tipo" value="Ração" <?php echo ($tipo == "Ração" ) ? "checked" : null; ?>>
                                                <label class="form-check-label" >Ração</label>
                                            </div>
                                            <div class="form-check d-inline">
                                                <input type="radio" name="tipo" value="Milho" <?php echo ($tipo == "Milho" ) ? "checked" : null; ?>>
                                                <label class="form-check-label">Milho</label>
                                            </div>
                                        </div>
                                    </div> 
                                </div>
                                <!-- /.card-body -->

                                <div class="modal-footer justify-content-between">
                                    <button type="submit" class="btn btn-success swalDefaultSuccess">Atualizar</button>
                                    <a href="venda.php" class="btn btn-warning" >Cancelar</a>
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
            $('.swalDefaultSuccess').click(function () {
                Toast.fire({
                    type: 'success',
                    title: 'Venda realizada com sucesso!'
                })
            });
            
            function onlynumber(evt) {
                var theEvent = evt || window.event;
                var key = theEvent.keyCode || theEvent.which;
                key = String.fromCharCode( key );
                var regex = /^[0-9.,]+$/;
                if( !regex.test(key) ) {
                   theEvent.returnValue = false;
                   if(theEvent.preventDefault) theEvent.preventDefault();
                }
             }
        </script>



    </body>
</html>  

<?php
ob_end_flush();
?>
<?php
    ob_start();
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Central Agro</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  
  <!-- DataTables -->
  <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.css">  
  
  
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- daterange picker -->
  <link rel="stylesheet" href="../../plugins/daterangepicker/daterangepicker.css">
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="../../plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
  <!-- Tempusdominus Bbootstrap 4 -->
  <link rel="stylesheet" href="../../plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="../../plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="../../plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
  <!-- Bootstrap4 Duallistbox -->
  <link rel="stylesheet" href="../../plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  
  
  
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
            <img src="../../dist/img/central.jpg" width=”160” height=”160” class="img-circle elevation-2">
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
                  <a href="vendas.php" class="nav-link">
                  <i class="fas fa-cart-arrow-down nav-icon"></i>
                  <p>Venda</p>
                </a>
              </li>  
            </ul>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="produto.php" class="nav-link">
                  <i class="fas fa-calculator nav-icon"></i>
                  <p>Fechar Caixa</p>
                </a>
              </li>  
            </ul>
          </li>
          
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
                <a href="pages/layout/top-nav.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Vendas</p>
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
                      <h1>Nova Venda</h1>
                  </div>
              </div>
          </div><!-- /.container-fluid -->
      </section>

      <section class="content">
          <div class="card">
              <div class="card-header">
                  <h3 class="card-title">Informações da Venda</h3>
              </div>
              
              <!-- /.card-header -->
              <!-- form start -->
              <form action="produtoCad.php" method="post" id="prod">
                  <div class="card-body">
                      
                      <div class="row">
                          <!-- SELECT2 EXAMPLE -->
                          <div class="col-5">
                              <div class="form-group">
                                  <label>Produto</label>
                                  <select class="form-control select2" style="width: 100%;" name="produto" id="produto">
                                      <option selected="selected" value="0">Selecione</option>
                                      <?php
                                      include '../../banco.php';
                                      $pdo = Banco::conectar();
                                      $sql = 'SELECT * FROM produto ORDER BY nome ASC';
                                      foreach ($pdo->query($sql)as $row) {
                                          echo '<option value="'.$row["id"].'">'.$row["nome"].'</option>';
                                      }
                                      Banco::desconectar();
                                      ?>
                                  </select>
                              </div>
                          </div>
                          
                          <div class="col-2">
                              <label>Quantidade</label>
                              <input type="text" class="form-control" placeholder="Quantidade" name="qtd" id="qtd">
                          </div>
                          <div class="col-2">
                              <label>Preço</label>  
                              <input type="text" class="form-control" placeholder="Preço" name="valor" id="valor">
                          </div>
                      </div>
                      <br>
                      <div class="row">
                          <div class="col-4">
                              <!-- text input -->
                              <div class="form-group">
                                  <a type="submit" class="btn btn-default" onclick="return enviar();">Adicionar</a>
                              </div>
                          </div>
                          <div class="col-4">
                              <!-- text input -->
                              <div class="form-group">
                                  <a class="btn btn-default" data-toggle="modal" data-target="#modal-produto">Incluir Produto</a>
                              </div>
                          </div>
                      </div>
                      
                      <!-- teste -->
                      
                      <div class="card-body">
                          <table id="example1" class="table table-striped">
                              <thead>
                                  <tr>
                                      <th>#</th>
                                      <th>Nome</th>
                                      <th>Quantidade</th>
                                      <th>Valor</th>
                                      <th>Ação</th>
                                  </tr>
                              </thead>
                              <tbody>
                                  
                              </tbody>

                          </table>
                      </div>
                      <!--
                      <div class="row justify-content-md-center">
                          <div class="col-md-3 col-sm-6">
                              <div class="info-box">
                                  <span class="info-box-icon bg-green"><i class="fa fa-cart-arrow-down"></i></span>

                                  <div class="info-box-content">
                                      <span class="info-box-text">Qtde. Itens</span>
                                      <span class="info-box-number" id="qtde_prod_venda">1</span>
                                  </div>
                                  <!-- /.info-box-content -- >
                              </div>

                              <!-- /.info-box -- >
                          </div>

                          <div class="col-md-3 col-sm-6">
                              <div class="info-box">
                                  <span class="info-box-icon bg-red"><i class="fa fa-dollar-sign"></i></span>

                                  <div class="info-box-content">
                                      <span class="info-box-text">Valor Venda</span>
                                      <span class="info-box-number" id="valor_venda">95.99</span>
                                  </div>
                                  <!-- /.info-box-content -- >
                              </div>

                              <!-- /.info-box -- >
                          </div>
                      </div>
                      -->
                      <!-- fim teste -->
                      <br>
                      <div class="card-header">
                          <h3 class="card-title"></h3>
                      </div>
                      
                      <br>
                      <div class="row">
                          <!--
                          <div class="col-sm-6">
                              <label>Observação</label>
                              <input type="text" class="form-control" placeholder="Valor Compra" name="valorCompra" required="" value="<?php echo!empty($valorCompra) ? $valorCompra : ''; ?>">
                          </div>
                          -->
                          <div class="col-2">
                              <label>Data</label>
                              <input type="text" class="form-control" placeholder="Valor Compra" name="valorCompra" required="" value="<?php echo!empty($valorCompra) ? $valorCompra : ''; ?>">
                          </div>

                          <!--
                          <div class="col-sm-6">
                              <label>Fazer Nota</label>
                              <div class="custom-control custom-checkbox">
                                <input class="custom-control-input" type="checkbox" id="customCheckbox1" value="option1">
                                <label for="customCheckbox1" class="custom-control-label"></label>
                              </div>
                          </div>
                          -->
                      </div>
                      <br>

                      <!-- /.card-body -->

                      <div class="modal-footer justify-content-between">
                          <a href="vendas.php" class="btn btn-warning" >Cancelar</a>
                          <button type="submit" class="btn btn-success">Salvar</button>
                      </div>
                  </div>
                  
                  
                  
                  
                  
              </form>
          </div>
          <!-- /.card -->
      </section>
      
      <!-- MODAL -->
      <div class="modal fade" id="modal-produto">
          <div class="modal-dialog modal-lg">
              <div class="modal-content">
                  <div class="modal-header">
                      <h4 class="modal-title">Produto</h4>
                  </div>
                  <div class="modal-body">
                      <form action="produto.php" method="post" >
                          <div class="row">
                              <div class="col-3">
                                  <label>Produto</label>
                                  <input type="text" class="form-control" placeholder="Valor Compra">
                              </div>
                              <div class="col-4">
                                  <label>Quantidade</label>
                                  <input type="text" class="form-control" placeholder="Quantidade">
                              </div>
                              <div class="col-4">
                                  <label>Preço</label>  
                                  <input type="text" class="form-control" placeholder="Estoque Mínimo">
                              </div>
                          </div>

                          <!-- /.card-body -->

                          <div class="modal-footer justify-content-between">
                              <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                              <button type="submit" class="btn btn-info">Incluir</button>
                          </div>

                      </form>
                  </div>

              </div>
              <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->

      
      
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 1.0.0
    </div>
    <strong>Copyright &copy; 2015-<?php echo date("Y")?> <a href="#">Central Grãos</a>.</strong>
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
<!-- Select2 -->
<script src="../../plugins/select2/js/select2.full.min.js"></script>
<!-- Bootstrap4 Duallistbox -->
<script src="../../plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
<!-- InputMask -->
<script src="../../plugins/moment/moment.min.js"></script>
<script src="../../plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>
<!-- date-range-picker -->
<script src="../../plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap color picker -->
<script src="../../plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="../../plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Bootstrap Switch -->
<script src="../../plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
<!-- Page script -->
<script>
    function enviar(){
        /*
        alert('olá');
        var produto = document.getElementById("produto").value;
        var qtd = document.getElementById("qtd").value;
        var valor = document.getElementById("valor").value;
        */
        
        var $this = $( this );
        var tr = '<tr>'+
			'<td>'+$this.find("input[name='produto']").val()+'</td>'+
                        '<td>'+$this.find("input[name='produto']").val()+'</td>'+
			'<td>'+$this.find("input[name='qtd']").val()+'</td>'+
			'<td>'+$this.find("input[name='valor']").val()+'</td>'+
                        '<td>'+$this.find("input[name='apaga']").val()+'</td>'+
			'</tr>'
		$('#example1').find('tbody').append( tr );
        /*
        var produtos = $.post('produtos.php');
        
        alert(produtos);
        
        var itemVenda = [produto,'nomeProduto',qtd,valor];
        //alert(itemVenda);
        */
        //document.getElementById("produto").value='0';
        //document.getElementById("qtd").value='';
        //document.getElementById("valor").value='';
        return false;
    };
    
    
  $(function () {
    //Initialize Select2 Elements
    $('.select2bs4').select2({
      theme: 'bootstrap4'
    })

    //Initialize Select2 Elements
    $('.select2').select2()

    //Datemask dd/mm/yyyy
    $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
    //Datemask2 mm/dd/yyyy
    $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
    //Money Euro
    $('[data-mask]').inputmask()

    //Date range picker
    $('#reservation').daterangepicker()
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({
      timePicker: true,
      timePickerIncrement: 30,
      locale: {
        format: 'MM/DD/YYYY hh:mm A'
      }
    })
    //Date range as a button
    $('#daterange-btn').daterangepicker(
      {
        ranges   : {
          'Today'       : [moment(), moment()],
          'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month'  : [moment().startOf('month'), moment().endOf('month')],
          'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        startDate: moment().subtract(29, 'days'),
        endDate  : moment()
      },
      function (start, end) {
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
      }
    )

    //Timepicker
    $('#timepicker').datetimepicker({
      format: 'LT'
    })
    
    //Bootstrap Duallistbox
    $('.duallistbox').bootstrapDualListbox()

    //Colorpicker
    $('.my-colorpicker1').colorpicker()
    //color picker with addon
    $('.my-colorpicker2').colorpicker()

    $('.my-colorpicker2').on('colorpickerChange', function(event) {
      $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
    });

    $("input[data-bootstrap-switch]").each(function(){
      $(this).bootstrapSwitch('state', $(this).prop('checked'));
    });

  })
</script>



</body>
</html>

<?php
ob_end_flush();
?>
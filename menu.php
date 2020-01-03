<?php
error_reporting(E_WARNING);
?>
<!-- Navbar -->

<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="../../index.php" class="nav-link">Início</a>
        </li>
    </ul>
<!--
    <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
            <a class="nav-link" data-toggle="dropdown" href="#">
                <i class="far fa-user"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                <div class="dropdown-divider"></div>

                < ?php if (empty($_SESSION['UsuarioNome'])) { ?>
                    <a href="login.php" class="dropdown-item">
                        <i class="fas fa-sign-in-alt mr-2"></i> Entrar
                    </a>
                < ?php } ?>
                < ?php if (!empty($_SESSION['UsuarioNome'])) { ?>
                    <div class="dropdown-divider"></div>
                    <a href="logout.php" class="dropdown-item">
                        <i class="fas fa-sign-out-alt mr-2"></i> Sair
                    </a>
                < ?php } ?>
            </div>
        </li>
    </ul>
    < ?php if (!empty($_SESSION['UsuarioNome'])) {
        echo 'Olá, ' . $_SESSION['UsuarioNome'] . '!';
    } ?>
-->
</nav>
<!-- /.navbar -->

<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="../../dist/img/central/central.jpg" width=”160” height=”160” class="img-circle elevation-2" >
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
                            <a href="../vendas/venda.php" class="nav-link">
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
                                <a href="../rel/relVendas.php" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Vendas</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="../rel/relDespesas.php" class="nav-link">
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
                            <a href="../pagamento/despesa.php" class="nav-link">
                                <i class="fas fa-barcode nav-icon"></i>
                                <p>Despesas Variáveis</p>
                            </a>
                        </li>
                        <?php if ($_SESSION['UsuarioNivel'] == "2") { ?>
                            <li class="nav-item">
                                <a href="../boletos/boletosAbertos.php" class="nav-link">
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
                                <a href="../boletos/boleto.php" class="nav-link">
                                    <i class="fas fa-clipboard nav-icon"></i>
                                    <p>Boletos</p>
                                </a>
                            </li>  
                        </ul>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="../cadastro/carga.php" class="nav-link">
                                    <i class="fas fa-clipboard nav-icon"></i>
                                    <p>Cargas</p>
                                </a>
                            </li>  
                        </ul>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="../funcionarios/funcionario.php" class="nav-link">
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

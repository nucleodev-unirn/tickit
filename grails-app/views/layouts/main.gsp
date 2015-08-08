<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>TickIT</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    %{--<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">--}%
    <g:javascript>
        window.baseUrl = "${createLink(uri: '/', absolute: true)}"
    </g:javascript>
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <g:layoutHead/>
</head>
<body class="skin-blue">
<div class="wrapper">

    <header class="main-header">
        <a href="../../index2.html" class="logo"><b>Tick</b>IT</a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown options">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="glyphicon glyphicon-user"></i>
                            <span class="hidden-xs">${session.usuario?.login}</span>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu animated bounceIn" role="menu">
                            <li>
                                <span class="arrow top"></span>
                                <a href="#">
                                    <span class="icon"><i class="fa fa-user"></i>
                                    </span>Minha Conta</a>
                                <a href="${createLink(controller: 'autenticacao', action: 'logout')}">
                                    <span class="icon"><i class="fa fa-sign-out"></i>
                                    </span>Sair</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <!-- =============================================== -->

    <!-- Left side column. contains the sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu">
                <li class="header">MENU PRINCIPAL</li>
                <li id="indexOpt">
                    <a href="${createLink(controller: "index")}">
                        <i class="fa fa-dashboard"></i> <span>Vis&atilde;o Geral</span>
                    </a>
                </li>

                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-lock"></i> <span>Administração</span> <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li id="statusChamadoOpt"><a href="${createLink(controller: 'statusChamado')}">Status Chamado</a></li>
                        <li id="setorOpt"><a href="${createLink(controller: 'setor')}">Setores</a></li>
                        <li id="usuarioOpt"><a href="${createLink(controller: 'usuario')}">Usu&aacute;rios</a></li>
                        <li id="statusEquipamentoOpt"><a href="${createLink(controller: 'statusEquipamento')}">Status Equipamento</a></li>

                    </ul>
                </li>

                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-bullhorn"></i> <span>Chamados</span> <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li id="createChamadoOpt"><a href="${createLink(controller: 'chamado', action: 'create')}"> Abrir Chamado </a></li>
                        <li id="chamadoOpt"><a href="${createLink(controller: 'chamado')}"> Gerenciar Chamados </a></li>
                    </ul>
                </li>

                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-desktop"></i> <span>Equipamentos</span> <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li id="equipamentoOpt"><a href="${createLink(controller: 'equipamento')}">Equipamentos</a></li>
                        <li id="tipoEquipamentoOpt"><a href="${createLink(controller: 'tipoEquipamento')}">Tipos de Equipamento</a></li>
                        <li id="empresaLocacaoOpt"><a href="${createLink(controller: 'empresaLocacao')}">Empresa Loca&ccedil;&atilde;o</a></li>


                    </ul>
                </li>

                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-cogs"></i> <span>Cadastros</span> <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li id="alteracaoStatusChamadoOpt"><a href="${createLink(controller: 'alteracaoStatusChamado')}">Alteração de Status Chamado</a></li>
                        <li id="equipamentoChamadoOpt"><a href="${createLink(controller: 'equipamentoChamado')}">Equipamento Chamado</a></li>
                        <li id="responsavelChamadoOpt"><a href="${createLink(controller: 'responsavelChamado')}">Responsável Chamado</a></li>
                        <li id="categoriaChamadoOpt"><a href="${createLink(controller: 'categoriaChamado')}">Categoria Chamado</a></li>
                        <li id="comentarioChamadoOpt"><a href="${createLink(controller: 'comentarioChamado')}">Comentário Chamado</a></li>
                        <li id="anexoChamadoOpt"><a href="${createLink(controller: 'anexoChamado')}">Anexo Chamado</a></li>

                    </ul>
                </li>
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- =============================================== -->
    <div class="content-wrapper">
        <g:layoutBody/>
    </div>

    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> <g:meta name="app.version"/>
        </div>
        <strong>&copy; 2015 <a href="javascript:void(0);">NDS-UNIRN</a>.</strong>
    </footer>
</div>
</body>
</html>

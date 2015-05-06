<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		%{--<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">--}%
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
							<li class="dropdown user user-menu">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<img src="../../dist/img/user2-160x160.jpg" class="user-image" alt="User Image"/>
									<span class="hidden-xs">Usuario Logado</span>
								</a>
								<ul class="dropdown-menu">
									<!-- User image -->
									<li class="user-header">
										<img src="../../dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
										<p>
											Nome Usuario Logado
										</p>
									</li>
									<!-- Menu Footer-->
									<li class="user-footer">
										<div class="pull-left">
											<a href="#" class="btn btn-default btn-flat">Minha Conta</a>
										</div>
										<div class="pull-right">
											<a href="#" class="btn btn-default btn-flat">Sair</a>
										</div>
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
						<li>
							<a href="#">
								<i class="fa fa-dashboard"></i> <span>Vis&atilde;o Geral</span>
							</a>
						</li>
						<li class="treeview">
							<a href="#">
								<i class="fa fa-cogs"></i> <span>Configura&ccedil;&otilde;es</span> <i class="fa fa-angle-left pull-right"></i>
							</a>
							<ul class="treeview-menu">
								<li id="empresaLocacaoOpt"><a href="${createLink(controller: 'empresaLocacao')}">Empresa Loca&ccedil;&atilde;o</a></li>
								<li id="equipamentoOpt"><a href="${createLink(controller: 'equipamento')}">Equipamentos</a></li>
								<li id="tipoEquipamentoOpt"><a href="${createLink(controller: 'tipoEquipamento')}">Tipos de Equipamento</a></li>
								<li id="statusEquipamentoOpt"><a href="${createLink(controller: 'statusEquipamento')}">Status Equipamento</a></li>
								<li id="setorOpt"><a href="${createLink(controller: 'setor')}">Setores</a></li>
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

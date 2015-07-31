<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>TickIT</title>
	</head>
	<body>
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<ul class="nav nav-tabs visao-geral">
				<li><a href="#chamadosTab" data-toggle="tab"><i class="fa fa-bell-o"></i> Chamados</a></li>
				<li class="active"><a href="#tabEquipamentosTab" data-toggle="tab"><i class="fa fa-desktop"></i> Equipamentos</a></li>
			</ul>
		</section>

		<!-- Main content -->
		<section class="content no-padding-top-bot">
			<div class="tab-content visao-geral-content-tab">
				<div class="tab-pane" id="chamadosTab">

				</div><!-- /.tab-pane -->
				<div class="tab-pane active" id="tabEquipamentosTab">
					<div class="row">
						<div class="col-sm-12">
							<div class="box box-solid no-border no-shadow">
								<div class="box-header">
									<i class="fa fa-search"></i>
									<h3 class="box-title">Pesquisar Equipamento</h3>
									<div class="box-tools pull-right">
										<button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
									</div>
								</div><!-- /.box-header -->
								<div class="box-body">
									<g:render template="/equipamento/pesquisaAvancada" model="['well':false]"/>
								</div><!-- /.box-body -->
							</div>
						</div>
						<div class="col-sm-12">
							<div class="box box-solid no-border no-shadow">
								<div class="box-header">
									<h3 class="box-title">Equipamentos Encontrados</h3>
								</div><!-- /.box-header -->
								<div class="box-body">
									<div class="table-responsive">
										<table class="table table-condensed table-bordered table-striped">
											<thead>
												<tr>
													<th>Nome Equipamento</th>
													<th>Tombamento</th>
													<th>Mac</th>
													<th>Status Equipamento</th>
													<th>Setor Atual</th>
													<th></th>
												</tr>
											</thead>
											<tbody id="tabelaEquipamento"></tbody>
										</table>
									</div>
								</div><!-- /.box-body -->
								<div class="overlay invisible loading-equipamento">
									<i class="fa fa-refresh fa-spin"></i>
								</div>
							</div>
						</div>
					</div>
				</div><!-- /.tab-pane -->
			</div><!-- /.tab-content -->
		</section>

		<g:render template="/equipamento/alterarStatus"/>
		<g:render template="/equipamento/alterarSetor"/>

		<asset:javascript src="visaogeral.js"/>
		<g:javascript>
			$(document).ready(function(){
				TICKIT.selectMenu("indexOpt");
			});
		</g:javascript>
	</body>
</html>


<%@ page import="grails.converters.JSON; br.edu.unirn.nds.chamado.base.EmpresaLocacao; br.edu.unirn.nds.chamado.equipamentos.Equipamento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'equipamento.label', default: 'Equipamento')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<ol class="breadcrumb">
				<li class="active">Listagem</li>
			</ol>
		</section>
		<!-- Main content -->
		<section class="content">
			<!-- Default box -->
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title"><g:message code="default.list.label" args="[entityName]" /></h3>
					<div class="box-tools pull-right">
						<g:link class="btn btn-default btn-box-tool" action="create"><i class="fa fa-plus"></i> <g:message code="default.new.label" args="[entityName]" /></g:link>
					</div>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-xs-12">
							<g:form action="index">
								<div class="input-group">
									<g:textField name="q.pesquisaSimples" class="form-control input-sm  pull-right" placeholder="Pesquisar" style="width: 150px;" value="${q?.pesquisaSimples}"/>
									<div class="input-group-btn">
										<button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
									</div>
								</div>
								<a href="#pesquisaAvancadaCollapse" data-toggle="collapse" class="pull-right help-block collapse-btn ${hasQuery?'':'collapsed'}">Pesquisa avançada</a>
							</g:form>
						</div>
						<div class="col-xs-12 margin-bottom-10 collapse ${hasQuery?'in':''}" id="pesquisaAvancadaCollapse">
							<g:form action="index" class="well well-sm">
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label class="control-label" for="q.nomeEquipamento">Nome Equip.</label>
											<g:textField name="q.nomeEquipamento" class="form-control input-sm" value="${q?.nomeEquipamento}"/>
										</div>
									</div>
									<div class="col-sm-2">
										<div class="form-group">
											<label class="control-label" for="q.tombamento">Tombamento</label>
											<g:textField name="q.tombamento" class="form-control input-sm" value="${q?.tombamento}"/>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label class="control-label" for="q.mac">Mac</label>
											<g:textField name="q.mac" class="form-control input-sm" value="${q?.mac}"/>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label class="control-label" for="q.mac">Status Equip.</label>
											<g:select name="q.statusEquipamento" class="form-control input-sm" noSelection="${['':'-- Selecione --']}" value="${q?.statusEquipamento}"
													  from="${br.edu.unirn.nds.chamado.equipamentos.StatusEquipamento.findAllByAtivo(true)}" optionKey="id" optionValue="nome"/>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label class="control-label" for="q.tipoEquipamento">Tipo Equip.</label>
											<g:select name="q.tipoEquipamento" class="form-control input-sm" noSelection="${['':'-- Selecione --']}" value="${q?.tipoEquipamento}"
													  from="${br.edu.unirn.nds.chamado.equipamentos.TipoEquipamento.findAllByAtivo(true)}" optionKey="id" optionValue="nome"/>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label class="control-label" for="q.empresaLocacao">Emp. Loca&ccedil;&atilde;o</label>
											<g:select name="q.empresaLocacao" class="form-control input-sm" noSelection="${['':'-- Selecione --']}" value="${q?.empresaLocacao}"
													  from="${br.edu.unirn.nds.chamado.base.EmpresaLocacao.findAllByAtivo(true)}" optionKey="id" optionValue="nome"/>
										</div>
									</div>
									<div class="col-sm-2">
										<div class="form-group">
											<div class="checkbox padding-top-20">
												<label>
													<g:checkBox name="q.locado" value="${q?.locado}"/> Equip. Locado?
												</label>
											</div>
										</div>
									</div>
									<div class="col-sm-2 padding-top-20">
										<button type="submit" class="btn btn-block btn-primary"><i class="fa fa-search"></i> Pesquisar</button>
									</div>
								</div>
							</g:form>
						</div>
						<div class="col-xs-12">
							<g:if test="${flash.message}">
								<div class="message" role="status">${flash.message}</div>
							</g:if>
							<table class="table table-bordered table-condensed">
								<thead>
								<tr>
									
									<g:sortableColumn params="${[q: (q as JSON)]}" property="nome" title="${message(code: 'equipamento.nome.label', default: 'Nome')}" />
									
									<g:sortableColumn params="${[q: (q as JSON)]}" property="tombamento" title="${message(code: 'equipamento.tombamento.label', default: 'Tombamento')}" />
									
									<g:sortableColumn params="${[q: (q as JSON)]}" property="descricao" title="${message(code: 'equipamento.descricao.label', default: 'Descricao')}" />
									
									<g:sortableColumn params="${[q: (q as JSON)]}" property="mac" title="${message(code: 'equipamento.mac.label', default: 'Mac')}" />
									
									<g:sortableColumn params="${[q: (q as JSON)]}" property="locado" title="${message(code: 'equipamento.locado.label', default: 'Locado')}" />
									
									<th><g:message code="equipamento.empresaLocacao.label" default="Empresa Locacao" /></th>
									
									<th><g:message code="equipamento.tipoEquipamento.label" default="Tipo Equipamento" /></th>
									
									<g:sortableColumn params="${[q: (q as JSON)]}" property="ativo" title="${message(code: 'equipamento.ativo.label', default: 'Ativo')}" />
									
									<th></th>
								</tr>
								</thead>
								<tbody>
								<g:each in="${equipamentoInstanceList}" status="i" var="equipamentoInstance">
									<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
										
										
										<td>${fieldValue(bean: equipamentoInstance, field: "nome")}</td>
										
										
										<td>${fieldValue(bean: equipamentoInstance, field: "tombamento")}</td>
										
										
										<td>${fieldValue(bean: equipamentoInstance, field: "descricao")}</td>
										
										
										<td>${fieldValue(bean: equipamentoInstance, field: "mac")}</td>
										
										
										<td><g:formatBoolean boolean="${equipamentoInstance.locado}" /></td>
										
										
										<td>${fieldValue(bean: equipamentoInstance, field: "empresaLocacao")}</td>
										
										
										<td>${fieldValue(bean: equipamentoInstance, field: "tipoEquipamento")}</td>
										
										
										<td><g:formatBoolean boolean="${equipamentoInstance.ativo}" /></td>
										
										<td class="text-center">
											<g:link class="btn btn-xs btn-default" action="edit" id="${equipamentoInstance.id}" data-toggle="tooltip" data-placement="bottom" title="Editar"><i class="fa fa-pencil"></i></g:link>
											<g:form url="[resource:equipamentoInstance, action:'delete']" method="DELETE" style="display: inline-block;">
												<button type="submit" class="btn btn-xs btn-danger" data-toggle="tooltip" data-placement="bottom" title="Remover" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i class="glyphicon glyphicon-remove"></i></button>
											</g:form>
										</td>
									</tr>
								</g:each>
								</tbody>
							</table>
							<div class="pagination">
								<g:paginate params="${[q:(q as JSON)]}" class="pagination-sm" total="${equipamentoInstanceCount ?: 0}" />
							</div>
						</div>
					</div>
				</div><!-- /.box-body -->
			</div><!-- /.box -->

		</section>
	<g:javascript>
        $(document).ready(function(){
            TICKIT.selectMenu("equipamentoOpt");
        });
	</g:javascript>
	</body>
</html>

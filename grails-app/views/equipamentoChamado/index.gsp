
<%@ page import="br.edu.unirn.nds.chamado.equipamentos.EquipamentoChamado" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'equipamentoChamado.label', default: 'EquipamentoChamado')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<ol class="breadcrumb">
				%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="cadastrar" action="cadastrar"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
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
								<div class="input-group margin-bottom-10">
									<g:textField name="q" class="form-control input-sm  pull-right" placeholder="Pesquisar" style="width: 150px;" value="${query}"/>
									<div class="input-group-btn">
										<button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
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
									
									<th><g:message code="equipamentoChamado.equipamento.label" default="Equipamento" /></th>
									
									<th><g:message code="equipamentoChamado.chamado.label" default="Chamado" /></th>
									
									<g:sortableColumn params="[q: "${query?:''}"]" property="ativo" title="${message(code: 'equipamentoChamado.ativo.label', default: 'Ativo')}" />
									
									<th><g:message code="equipamentoChamado.cadastradoPor.label" default="Cadastrado Por" /></th>
									
									<g:sortableColumn params="[q: "${query?:''}"]" property="dateCreated" title="${message(code: 'equipamentoChamado.dateCreated.label', default: 'Date Created')}" />
									
									<th><g:message code="equipamentoChamado.ultimaAtualizacaoPor.label" default="Ultima Atualizacao Por" /></th>
									
									<g:sortableColumn params="[q: "${query?:''}"]" property="lastUpdated" title="${message(code: 'equipamentoChamado.lastUpdated.label', default: 'Last Updated')}" />
									
									<th><g:message code="equipamentoChamado.desativadoPor.label" default="Desativado Por" /></th>
									
									<g:sortableColumn params="[q: "${query?:''}"]" property="dataDesativacao" title="${message(code: 'equipamentoChamado.dataDesativacao.label', default: 'Data Desativacao')}" />
									
									<th></th>
								</tr>
								</thead>
								<tbody>
								<g:each in="${equipamentoChamadoInstanceList}" status="i" var="equipamentoChamadoInstance">
									<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
										
										
										<td>${fieldValue(bean: equipamentoChamadoInstance, field: "equipamento")}</td>
										
										
										<td>${fieldValue(bean: equipamentoChamadoInstance, field: "chamado")}</td>
										
										
										<td><g:formatBoolean boolean="${equipamentoChamadoInstance.ativo}" /></td>
										
										
										<td>${fieldValue(bean: equipamentoChamadoInstance, field: "cadastradoPor")}</td>
										
										
										<td><g:formatDate date="${equipamentoChamadoInstance.dateCreated}" format="dd/MM/yyyy HH:mm"/></td>
										
										
										<td>${fieldValue(bean: equipamentoChamadoInstance, field: "ultimaAtualizacaoPor")}</td>
										
										
										<td><g:formatDate date="${equipamentoChamadoInstance.lastUpdated}" format="dd/MM/yyyy HH:mm"/></td>
										
										
										<td>${fieldValue(bean: equipamentoChamadoInstance, field: "desativadoPor")}</td>
										
										
										<td><g:formatDate date="${equipamentoChamadoInstance.dataDesativacao}" format="dd/MM/yyyy"/></td>
										
										<td class="text-center">
											<g:link class="btn btn-xs btn-default" action="edit" id="${equipamentoChamadoInstance.id}" data-toggle="tooltip" data-placement="bottom" title="Editar"><i class="fa fa-pencil"></i></g:link>
											<g:form url="[resource:equipamentoChamadoInstance, action:'delete']" method="DELETE" style="display: inline-block;">
												<button type="submit" class="btn btn-xs btn-danger" data-toggle="tooltip" data-placement="bottom" title="Remover" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i class="glyphicon glyphicon-remove"></i></button>
											</g:form>
										</td>
									</tr>
								</g:each>
								</tbody>
							</table>
							<div class="pagination">
								<g:paginate params="[q: "${query?:''}"]" class="pagination-sm" total="${equipamentoChamadoInstanceCount ?: 0}" />
							</div>
						</div>
					</div>
				</div><!-- /.box-body -->
			</div><!-- /.box -->

		</section>
	<g:javascript>
        $(document).ready(function(){
            TICKIT.selectMenu("equipamentoChamadoOpt");
        });
	</g:javascript>
	</body>
</html>

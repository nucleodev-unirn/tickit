
<%@ page import="br.edu.unirn.nds.chamado.base.StatusChamado" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'statusChamado.label', default: 'StatusChamado')}" />
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
									
									<g:sortableColumn params="[q: "${query?:''}"]" property="nome" title="${message(code: 'statusChamado.nome.label', default: 'Nome')}" />
									
									<g:sortableColumn params="[q: "${query?:''}"]" property="descricao" title="${message(code: 'statusChamado.descricao.label', default: 'Descricao')}" />
									
									<g:sortableColumn params="[q: "${query?:''}"]" property="ativo" title="${message(code: 'statusChamado.ativo.label', default: 'Ativo')}" />
									
									<g:sortableColumn params="[q: "${query?:''}"]" property="dateCreated" title="${message(code: 'statusChamado.dateCreated.label', default: 'Date Created')}" />
									
									<g:sortableColumn params="[q: "${query?:''}"]" property="lastUpdated" title="${message(code: 'statusChamado.lastUpdated.label', default: 'Last Updated')}" />
									
									<th></th>
								</tr>
								</thead>
								<tbody>
								<g:each in="${statusChamadoInstanceList}" status="i" var="statusChamadoInstance">
									<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
										
										
										<td>${fieldValue(bean: statusChamadoInstance, field: "nome")}</td>
										
										
										<td>${fieldValue(bean: statusChamadoInstance, field: "descricao")}</td>
										
										
										<td><g:formatBoolean boolean="${statusChamadoInstance.ativo}" /></td>
										
										
										<td><g:formatDate date="${statusChamadoInstance.dateCreated}" format="dd/MM/yyyy HH:mm"/></td>
										
										
										<td><g:formatDate date="${statusChamadoInstance.lastUpdated}" format="dd/MM/yyyy HH:mm"/></td>
										
										<td class="text-center">
											<g:link class="btn btn-xs btn-default" action="edit" id="${statusChamadoInstance.id}" data-toggle="tooltip" data-placement="bottom" title="Editar"><i class="fa fa-pencil"></i></g:link>
											<g:form url="[resource:statusChamadoInstance, action:'delete']" method="DELETE" style="display: inline-block;">
												<button type="submit" class="btn btn-xs btn-danger" data-toggle="tooltip" data-placement="bottom" title="Remover" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i class="glyphicon glyphicon-remove"></i></button>
											</g:form>
										</td>
									</tr>
								</g:each>
								</tbody>
							</table>
							<div class="pagination">
								<g:paginate params="[q: "${query?:''}"]" class="pagination-sm" total="${statusChamadoInstanceCount ?: 0}" />
							</div>
						</div>
					</div>
				</div><!-- /.box-body -->
			</div><!-- /.box -->

		</section>
	<g:javascript>
        $(document).ready(function(){
            TICKIT.selectMenu("statusChamadoOpt");
        });
	</g:javascript>
	</body>
</html>

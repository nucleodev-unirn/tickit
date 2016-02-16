
<%@ page import="br.edu.unirn.nds.chamado.base.Chamado" %>
<!DOCTYPE html>
<html>
	<head>
		%{--<meta name="layout" content="mainPublic">--}%
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'chamado.label', default: 'Chamado')}" />
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
						<g:form action="index">
							<div class="col-xs-12">
									<div class="input-group margin-bottom-10">
										<g:textField name="pesquisaSimples" class="form-control input-sm  pull-right" placeholder="Pesquisar" style="width: 150px;" value="${params?.pesquisaSimples}"/>
										<div class="input-group-btn">
											<button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
										</div>
									</div>
									<a href="#pesquisaAvancadaCollapse" data-toggle="collapse" class="pull-right help-block collapse-btn ${hasQuery?'':'collapsed'}">Pesquisa avançada</a>
							</div>
							<div class="col-xs-12 margin-bottom-10 collapse" id="pesquisaAvancadaCollapse">
								<g:render template="pesquisaAvancada"/>
							</div>
							</g:form>
						<div class="col-xs-12">
							<g:if test="${flash.message}">
								<div class="message" role="status">${flash.message}</div>
							</g:if>
							<table class="table table-bordered table-condensed">
								<thead>
								<tr>
									
									<th><g:message code="chamado.setorSolicitante.label" default="Setor Solicitante" /></th>
									
									<g:sortableColumn params="[q: "${query?:''}"]" property="titulo" title="${message(code: 'chamado.titulo.label', default: 'Titulo')}" />
									
									<g:sortableColumn params="[q: "${query?:''}"]" property="nomeSolicitante" title="${message(code: 'chamado.nomeSolicitante.label', default: 'Nome Solicitante')}" />
									
									<g:sortableColumn params="[q: "${query?:''}"]" property="emailSolicitante" title="${message(code: 'chamado.emailSolicitante.label', default: 'Email Solicitante')}" />
									
									<g:sortableColumn params="[q: "${query?:''}"]" property="descricao" title="${message(code: 'chamado.descricao.label', default: 'Descricao')}" />
									
									<g:sortableColumn params="[q: "${query?:''}"]" property="avaliacao" title="${message(code: 'chamado.avaliacao.label', default: 'Avaliacao')}" />
									
									<g:sortableColumn params="[q: "${query?:''}"]" property="tags" title="${message(code: 'chamado.tags.label', default: 'Tags')}" />
									
									<g:sortableColumn params="[q: "${query?:''}"]" property="ativo" title="${message(code: 'chamado.ativo.label', default: 'Ativo')}" />
									
									<th><g:message code="chamado.cadastradoPor.label" default="Cadastrado Por" /></th>
									
									<g:sortableColumn params="[q: "${query?:''}"]" property="dateCreated" title="${message(code: 'chamado.dateCreated.label', default: 'Date Created')}" />
									
									<th><g:message code="chamado.ultimaAtualizacaoPor.label" default="Ultima Atualizacao Por" /></th>
									
									<g:sortableColumn params="[q: "${query?:''}"]" property="lastUpdated" title="${message(code: 'chamado.lastUpdated.label', default: 'Last Updated')}" />
									
									<th><g:message code="chamado.desativadoPor.label" default="Desativado Por" /></th>
									
									<g:sortableColumn params="[q: "${query?:''}"]" property="dataDesativacao" title="${message(code: 'chamado.dataDesativacao.label', default: 'Data Desativacao')}" />
									
									<th></th>
								</tr>
								</thead>
								<tbody>
								<g:each in="${chamadoInstanceList}" status="i" var="chamadoInstance">
									<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
										
										
										<td>${fieldValue(bean: chamadoInstance, field: "setorSolicitante")}</td>
										
										
										<td>${fieldValue(bean: chamadoInstance, field: "titulo")}</td>
										
										
										<td>${fieldValue(bean: chamadoInstance, field: "nomeSolicitante")}</td>
										
										
										<td>${fieldValue(bean: chamadoInstance, field: "emailSolicitante")}</td>
										
										
										<td>${fieldValue(bean: chamadoInstance, field: "descricao")}</td>
										
										
										<td>${fieldValue(bean: chamadoInstance, field: "avaliacao")}</td>
										
										
										<td>${fieldValue(bean: chamadoInstance, field: "tags")}</td>
										
										
										<td><g:formatBoolean boolean="${chamadoInstance.ativo}" /></td>
										
										
										<td>${fieldValue(bean: chamadoInstance, field: "cadastradoPor")}</td>
										
										
										<td><g:formatDate date="${chamadoInstance.dateCreated}" format="dd/MM/yyyy HH:mm"/></td>
										
										
										<td>${fieldValue(bean: chamadoInstance, field: "ultimaAtualizacaoPor")}</td>
										
										
										<td><g:formatDate date="${chamadoInstance.lastUpdated}" format="dd/MM/yyyy HH:mm"/></td>
										
										
										<td>${fieldValue(bean: chamadoInstance, field: "desativadoPor")}</td>
										
										
										<td><g:formatDate date="${chamadoInstance.dataDesativacao}" format="dd/MM/yyyy"/></td>
										
										<td class="text-center">
											<g:link class="btn btn-xs btn-default" action="edit" id="${chamadoInstance.id}" data-toggle="tooltip" data-placement="bottom" title="Editar"><i class="fa fa-pencil"></i></g:link>
											<g:form useToken="true" url="[resource:chamadoInstance, action:'delete']" method="DELETE" style="display: inline-block;">
												<button type="submit" class="btn btn-xs btn-danger" data-toggle="tooltip" data-placement="bottom" title="Remover" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i class="glyphicon glyphicon-remove"></i></button>
											</g:form>
										</td>
									</tr>
								</g:each>
								</tbody>
							</table>
							<div class="pagination">
								<g:paginate params="[q: "${query?:''}"]" class="pagination-sm" total="${chamadoInstanceCount ?: 0}" />
							</div>
						</div>
					</div>
				</div><!-- /.box-body -->
			</div><!-- /.box -->

		</section>
	<g:javascript>
        $(document).ready(function(){
            TICKIT.selectMenu("chamadoOpt");
        });
	</g:javascript>
	</body>
</html>

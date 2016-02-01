<%@ page import="br.edu.unirn.nds.chamado.base.Chamado" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'chamado.label', default: 'Chamado')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<ol class="breadcrumb">
				<li><g:link class="list" action="index">Listagem</g:link></li>
				<li class="active"><g:message code="default.edit.label" args="[entityName]" /></li>
			</ol>
		</section>
		<!-- Main content -->
		<section class="content">
			<!-- Default box -->
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title"><g:message code="default.edit.label" args="[entityName]" /></h3>
					<div class="box-tools pull-right">
						<g:link class="btn btn-default btn-box-tool" action="create"><i class="fa fa-plus"></i> <g:message code="default.new.label" args="[entityName]" /></g:link>
					</div>
				</div>
				<div class="box-body box-form">
					<g:if test="${flash.error}">
						<div class="alert alert-danger alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							${flash.error}
						</div>
					</g:if>
					<g:if test="${flash.message}">
						<div class="alert alert-success alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							${flash.message}
						</div>
					</g:if>
					<g:hasErrors bean="${chamadoInstance}">
						<div class="alert alert-warning alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							Alguns campos precisam ser corrigidos.
						</div>
					</g:hasErrors>
					<g:form useToken="true" class="form-horizontal" novalidate="novalidate" name="chamadoInstanceForm" url="[resource:chamadoInstance, action:'update']" method="PUT" >
						<g:hiddenField name="version" value="${chamadoInstance?.version}" />
						<g:render template="form"/>
					</g:form>
				</div>
				<div class="box-footer clearfix">
					<button type="submit" form="chamadoInstanceForm" class="btn btn-success pull-right"><i class="fa fa-check"></i> <g:message code="default.button.update.label"  default="Update"/></button>
				</div>
			</div>
		</section>
	<g:javascript>
        $(document).ready(function(){
            TICKIT.selectMenu("chamadoOpt");
        });
	</g:javascript>
	</body>
</html>

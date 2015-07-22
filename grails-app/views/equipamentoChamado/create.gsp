<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'equipamentoChamado.label', default: 'EquipamentoChamado')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<ol class="breadcrumb">
				<li><g:link class="list" action="index">Listagem</g:link></li>
				<li class="active"><g:message code="default.new.label" args="[entityName]" /></li>
			</ol>
		</section>
		<!-- Main content -->
		<section class="content">
			<!-- Default box -->
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title"><g:message code="default.create.label" args="[entityName]" /></h3>
				</div>
				<div class="box-body box-form">
					<g:if test="${flash.message}">
						<div class="alert alert-success alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							${flash.message}
						</div>
					</g:if>
					<g:hasErrors bean="${equipamentoChamadoInstance}">
						<div class="alert alert-warning alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							Alguns campos precisam ser corrigidos.
						</div>
					</g:hasErrors>
					<g:form class="form-horizontal" novalidate="novalidate" name="equipamentoChamadoInstanceForm" url="[resource:equipamentoChamadoInstance, action:'save']" >
						<g:render template="form"/>
					</g:form>
				</div>
				<div class="box-footer clearfix">
					<button type="submit" form="equipamentoChamadoInstanceForm" class="btn btn-success pull-right"><i class="fa fa-check"></i> <g:message code="default.button.create.label"  default="Create"/></button>
				</div>
			</div>
		</section>
	<g:javascript>
        $(document).ready(function(){
            TICKIT.selectMenu("equipamentoChamadoOpt");
        });
	</g:javascript>
	</body>
</html>

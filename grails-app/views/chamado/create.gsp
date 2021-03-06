<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mainPublic">
		<g:set var="entityName" value="${message(code: 'chamado.label', default: 'Chamado')}" />
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

					<g:hasErrors bean="${chamadoInstance}">
						<div class="alert alert-danger">
							<ul>
								<g:eachError bean="${chamadoInstance}" var="error">
									<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if> > <g:message error="${error}"/></li>
								</g:eachError>
							</ul>
						</div>
					</g:hasErrors>
					<g:form useToken="true" class="form-horizontal" novalidate="novalidate" name="chamadoInstanceForm" url="[resource:chamadoInstance, action:'save']" >
						<div class="row">
							<g:render template="form"/>
						</div>
					</g:form>
				</div>
				<div class="box-footer clearfix">
					<button type="submit" form="chamadoInstanceForm" class="btn btn-success pull-right"><i class="fa fa-check"></i> <g:message code="default.button.create.label"  default="Create"/></button>
					<g:link controller="index" action="index2" class="btn btn-danger pull-left"><i class="fa fa-close"></i> <g:message code="default.button.cancel.label"  default="Cancelar"/></g:link>
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

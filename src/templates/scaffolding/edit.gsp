<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
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
				<div class="box-body">
					<g:if test="\${flash.message}">
						<div class="message" role="status">\${flash.message}</div>
					</g:if>
					<g:hasErrors bean="\${${propertyName}}">
						<div class="alert alert-warning alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							Alguns campos precisam ser corrigidos.
						</div>
					</g:hasErrors>
					<g:form class="form-horizontal" novalidate="novalidate" name="${propertyName}Form" url="[resource:${propertyName}, action:'update']" method="PUT" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
						<g:hiddenField name="version" value="\${${propertyName}?.version}" />
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
					</g:form>
				</div>
				<div class="box-footer clearfix">
					<button type="submit" form="${propertyName}Form" class="btn btn-success pull-right"><i class="fa fa-check"></i> <g:message code="default.button.update.label"  default="Update"/></button>
				</div>
			</div>
		</section>
	</body>
</html>


<%@ page import="br.edu.unirn.nds.chamado.base.ResponsavelChamado" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'responsavelChamado.label', default: 'ResponsavelChamado')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-responsavelChamado" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-responsavelChamado" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list responsavelChamado">
			
				<g:if test="${responsavelChamadoInstance?.responsavel}">
				<li class="fieldcontain">
					<span id="responsavel-label" class="property-label"><g:message code="responsavelChamado.responsavel.label" default="Responsavel" /></span>
					
						<span class="property-value" aria-labelledby="responsavel-label"><g:link controller="usuario" action="show" id="${responsavelChamadoInstance?.responsavel?.id}">${responsavelChamadoInstance?.responsavel?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${responsavelChamadoInstance?.chamado}">
				<li class="fieldcontain">
					<span id="chamado-label" class="property-label"><g:message code="responsavelChamado.chamado.label" default="Chamado" /></span>
					
						<span class="property-value" aria-labelledby="chamado-label"><g:link controller="chamado" action="show" id="${responsavelChamadoInstance?.chamado?.id}">${responsavelChamadoInstance?.chamado?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${responsavelChamadoInstance?.ativo}">
				<li class="fieldcontain">
					<span id="ativo-label" class="property-label"><g:message code="responsavelChamado.ativo.label" default="Ativo" /></span>
					
						<span class="property-value" aria-labelledby="ativo-label"><g:formatBoolean boolean="${responsavelChamadoInstance?.ativo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${responsavelChamadoInstance?.cadastradoPor}">
				<li class="fieldcontain">
					<span id="cadastradoPor-label" class="property-label"><g:message code="responsavelChamado.cadastradoPor.label" default="Cadastrado Por" /></span>
					
						<span class="property-value" aria-labelledby="cadastradoPor-label"><g:link controller="usuario" action="show" id="${responsavelChamadoInstance?.cadastradoPor?.id}">${responsavelChamadoInstance?.cadastradoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${responsavelChamadoInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="responsavelChamado.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${responsavelChamadoInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${responsavelChamadoInstance?.ultimaAtualizacaoPor}">
				<li class="fieldcontain">
					<span id="ultimaAtualizacaoPor-label" class="property-label"><g:message code="responsavelChamado.ultimaAtualizacaoPor.label" default="Ultima Atualizacao Por" /></span>
					
						<span class="property-value" aria-labelledby="ultimaAtualizacaoPor-label"><g:link controller="usuario" action="show" id="${responsavelChamadoInstance?.ultimaAtualizacaoPor?.id}">${responsavelChamadoInstance?.ultimaAtualizacaoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${responsavelChamadoInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="responsavelChamado.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${responsavelChamadoInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${responsavelChamadoInstance?.desativadoPor}">
				<li class="fieldcontain">
					<span id="desativadoPor-label" class="property-label"><g:message code="responsavelChamado.desativadoPor.label" default="Desativado Por" /></span>
					
						<span class="property-value" aria-labelledby="desativadoPor-label"><g:link controller="usuario" action="show" id="${responsavelChamadoInstance?.desativadoPor?.id}">${responsavelChamadoInstance?.desativadoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${responsavelChamadoInstance?.dataDesativacao}">
				<li class="fieldcontain">
					<span id="dataDesativacao-label" class="property-label"><g:message code="responsavelChamado.dataDesativacao.label" default="Data Desativacao" /></span>
					
						<span class="property-value" aria-labelledby="dataDesativacao-label"><g:formatDate date="${responsavelChamadoInstance?.dataDesativacao}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:responsavelChamadoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${responsavelChamadoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

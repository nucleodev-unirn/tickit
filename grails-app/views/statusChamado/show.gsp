
<%@ page import="br.edu.unirn.nds.chamado.base.StatusChamado" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'statusChamado.label', default: 'StatusChamado')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-statusChamado" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-statusChamado" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list statusChamado">
			
				<g:if test="${statusChamadoInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="statusChamado.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${statusChamadoInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statusChamadoInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="statusChamado.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${statusChamadoInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${statusChamadoInstance?.ativo}">
				<li class="fieldcontain">
					<span id="ativo-label" class="property-label"><g:message code="statusChamado.ativo.label" default="Ativo" /></span>
					
						<span class="property-value" aria-labelledby="ativo-label"><g:formatBoolean boolean="${statusChamadoInstance?.ativo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${statusChamadoInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="statusChamado.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${statusChamadoInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${statusChamadoInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="statusChamado.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${statusChamadoInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${statusChamadoInstance?.cadastradoPor}">
				<li class="fieldcontain">
					<span id="cadastradoPor-label" class="property-label"><g:message code="statusChamado.cadastradoPor.label" default="Cadastrado Por" /></span>
					
						<span class="property-value" aria-labelledby="cadastradoPor-label"><g:link controller="usuario" action="show" id="${statusChamadoInstance?.cadastradoPor?.id}">${statusChamadoInstance?.cadastradoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${statusChamadoInstance?.ultimaAtualizacaoPor}">
				<li class="fieldcontain">
					<span id="ultimaAtualizacaoPor-label" class="property-label"><g:message code="statusChamado.ultimaAtualizacaoPor.label" default="Ultima Atualizacao Por" /></span>
					
						<span class="property-value" aria-labelledby="ultimaAtualizacaoPor-label"><g:link controller="usuario" action="show" id="${statusChamadoInstance?.ultimaAtualizacaoPor?.id}">${statusChamadoInstance?.ultimaAtualizacaoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${statusChamadoInstance?.desativadoPor}">
				<li class="fieldcontain">
					<span id="desativadoPor-label" class="property-label"><g:message code="statusChamado.desativadoPor.label" default="Desativado Por" /></span>
					
						<span class="property-value" aria-labelledby="desativadoPor-label"><g:link controller="usuario" action="show" id="${statusChamadoInstance?.desativadoPor?.id}">${statusChamadoInstance?.desativadoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${statusChamadoInstance?.dataDesativacao}">
				<li class="fieldcontain">
					<span id="dataDesativacao-label" class="property-label"><g:message code="statusChamado.dataDesativacao.label" default="Data Desativacao" /></span>
					
						<span class="property-value" aria-labelledby="dataDesativacao-label"><g:formatDate date="${statusChamadoInstance?.dataDesativacao}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:statusChamadoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${statusChamadoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

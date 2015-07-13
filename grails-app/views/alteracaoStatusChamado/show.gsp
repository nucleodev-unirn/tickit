
<%@ page import="br.edu.unirn.nds.chamado.base.AlteracaoStatusChamado" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'alteracaoStatusChamado.label', default: 'AlteracaoStatusChamado')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-alteracaoStatusChamado" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-alteracaoStatusChamado" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list alteracaoStatusChamado">
			
				<g:if test="${alteracaoStatusChamadoInstance?.statusChamado}">
				<li class="fieldcontain">
					<span id="statusChamado-label" class="property-label"><g:message code="alteracaoStatusChamado.statusChamado.label" default="Status Chamado" /></span>
					
						<span class="property-value" aria-labelledby="statusChamado-label"><g:link controller="statusChamado" action="show" id="${alteracaoStatusChamadoInstance?.statusChamado?.id}">${alteracaoStatusChamadoInstance?.statusChamado?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${alteracaoStatusChamadoInstance?.observacao}">
				<li class="fieldcontain">
					<span id="observacao-label" class="property-label"><g:message code="alteracaoStatusChamado.observacao.label" default="Observacao" /></span>
					
						<span class="property-value" aria-labelledby="observacao-label"><g:fieldValue bean="${alteracaoStatusChamadoInstance}" field="observacao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alteracaoStatusChamadoInstance?.ativo}">
				<li class="fieldcontain">
					<span id="ativo-label" class="property-label"><g:message code="alteracaoStatusChamado.ativo.label" default="Ativo" /></span>
					
						<span class="property-value" aria-labelledby="ativo-label"><g:formatBoolean boolean="${alteracaoStatusChamadoInstance?.ativo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${alteracaoStatusChamadoInstance?.cadastradoPor}">
				<li class="fieldcontain">
					<span id="cadastradoPor-label" class="property-label"><g:message code="alteracaoStatusChamado.cadastradoPor.label" default="Cadastrado Por" /></span>
					
						<span class="property-value" aria-labelledby="cadastradoPor-label"><g:link controller="usuario" action="show" id="${alteracaoStatusChamadoInstance?.cadastradoPor?.id}">${alteracaoStatusChamadoInstance?.cadastradoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${alteracaoStatusChamadoInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="alteracaoStatusChamado.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${alteracaoStatusChamadoInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${alteracaoStatusChamadoInstance?.ultimaAtualizacaoPor}">
				<li class="fieldcontain">
					<span id="ultimaAtualizacaoPor-label" class="property-label"><g:message code="alteracaoStatusChamado.ultimaAtualizacaoPor.label" default="Ultima Atualizacao Por" /></span>
					
						<span class="property-value" aria-labelledby="ultimaAtualizacaoPor-label"><g:link controller="usuario" action="show" id="${alteracaoStatusChamadoInstance?.ultimaAtualizacaoPor?.id}">${alteracaoStatusChamadoInstance?.ultimaAtualizacaoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${alteracaoStatusChamadoInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="alteracaoStatusChamado.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${alteracaoStatusChamadoInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${alteracaoStatusChamadoInstance?.desativadoPor}">
				<li class="fieldcontain">
					<span id="desativadoPor-label" class="property-label"><g:message code="alteracaoStatusChamado.desativadoPor.label" default="Desativado Por" /></span>
					
						<span class="property-value" aria-labelledby="desativadoPor-label"><g:link controller="usuario" action="show" id="${alteracaoStatusChamadoInstance?.desativadoPor?.id}">${alteracaoStatusChamadoInstance?.desativadoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${alteracaoStatusChamadoInstance?.dataDesativacao}">
				<li class="fieldcontain">
					<span id="dataDesativacao-label" class="property-label"><g:message code="alteracaoStatusChamado.dataDesativacao.label" default="Data Desativacao" /></span>
					
						<span class="property-value" aria-labelledby="dataDesativacao-label"><g:formatDate date="${alteracaoStatusChamadoInstance?.dataDesativacao}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:alteracaoStatusChamadoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${alteracaoStatusChamadoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

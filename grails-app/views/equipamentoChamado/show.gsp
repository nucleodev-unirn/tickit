
<%@ page import="br.edu.unirn.nds.chamado.equipamentos.EquipamentoChamado" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'equipamentoChamado.label', default: 'EquipamentoChamado')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-equipamentoChamado" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-equipamentoChamado" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list equipamentoChamado">
			
				<g:if test="${equipamentoChamadoInstance?.equipamento}">
				<li class="fieldcontain">
					<span id="equipamento-label" class="property-label"><g:message code="equipamentoChamado.equipamento.label" default="Equipamento" /></span>
					
						<span class="property-value" aria-labelledby="equipamento-label"><g:link controller="equipamento" action="show" id="${equipamentoChamadoInstance?.equipamento?.id}">${equipamentoChamadoInstance?.equipamento?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoChamadoInstance?.chamado}">
				<li class="fieldcontain">
					<span id="chamado-label" class="property-label"><g:message code="equipamentoChamado.chamado.label" default="Chamado" /></span>
					
						<span class="property-value" aria-labelledby="chamado-label"><g:link controller="chamado" action="show" id="${equipamentoChamadoInstance?.chamado?.id}">${equipamentoChamadoInstance?.chamado?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoChamadoInstance?.ativo}">
				<li class="fieldcontain">
					<span id="ativo-label" class="property-label"><g:message code="equipamentoChamado.ativo.label" default="Ativo" /></span>
					
						<span class="property-value" aria-labelledby="ativo-label"><g:formatBoolean boolean="${equipamentoChamadoInstance?.ativo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoChamadoInstance?.cadastradoPor}">
				<li class="fieldcontain">
					<span id="cadastradoPor-label" class="property-label"><g:message code="equipamentoChamado.cadastradoPor.label" default="Cadastrado Por" /></span>
					
						<span class="property-value" aria-labelledby="cadastradoPor-label"><g:link controller="usuario" action="show" id="${equipamentoChamadoInstance?.cadastradoPor?.id}">${equipamentoChamadoInstance?.cadastradoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoChamadoInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="equipamentoChamado.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${equipamentoChamadoInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoChamadoInstance?.ultimaAtualizacaoPor}">
				<li class="fieldcontain">
					<span id="ultimaAtualizacaoPor-label" class="property-label"><g:message code="equipamentoChamado.ultimaAtualizacaoPor.label" default="Ultima Atualizacao Por" /></span>
					
						<span class="property-value" aria-labelledby="ultimaAtualizacaoPor-label"><g:link controller="usuario" action="show" id="${equipamentoChamadoInstance?.ultimaAtualizacaoPor?.id}">${equipamentoChamadoInstance?.ultimaAtualizacaoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoChamadoInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="equipamentoChamado.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${equipamentoChamadoInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoChamadoInstance?.desativadoPor}">
				<li class="fieldcontain">
					<span id="desativadoPor-label" class="property-label"><g:message code="equipamentoChamado.desativadoPor.label" default="Desativado Por" /></span>
					
						<span class="property-value" aria-labelledby="desativadoPor-label"><g:link controller="usuario" action="show" id="${equipamentoChamadoInstance?.desativadoPor?.id}">${equipamentoChamadoInstance?.desativadoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoChamadoInstance?.dataDesativacao}">
				<li class="fieldcontain">
					<span id="dataDesativacao-label" class="property-label"><g:message code="equipamentoChamado.dataDesativacao.label" default="Data Desativacao" /></span>
					
						<span class="property-value" aria-labelledby="dataDesativacao-label"><g:formatDate date="${equipamentoChamadoInstance?.dataDesativacao}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:equipamentoChamadoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${equipamentoChamadoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

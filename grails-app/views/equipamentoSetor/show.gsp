
<%@ page import="br.edu.unirn.nds.chamado.equipamentos.EquipamentoSetor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'equipamentoSetor.label', default: 'EquipamentoSetor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-equipamentoSetor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-equipamentoSetor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list equipamentoSetor">
			
				<g:if test="${equipamentoSetorInstance?.setor}">
				<li class="fieldcontain">
					<span id="setor-label" class="property-label"><g:message code="equipamentoSetor.setor.label" default="Setor" /></span>
					
						<span class="property-value" aria-labelledby="setor-label"><g:link controller="setor" action="show" id="${equipamentoSetorInstance?.setor?.id}">${equipamentoSetorInstance?.setor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoSetorInstance?.equipamento}">
				<li class="fieldcontain">
					<span id="equipamento-label" class="property-label"><g:message code="equipamentoSetor.equipamento.label" default="Equipamento" /></span>
					
						<span class="property-value" aria-labelledby="equipamento-label"><g:link controller="equipamento" action="show" id="${equipamentoSetorInstance?.equipamento?.id}">${equipamentoSetorInstance?.equipamento?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoSetorInstance?.ativo}">
				<li class="fieldcontain">
					<span id="ativo-label" class="property-label"><g:message code="equipamentoSetor.ativo.label" default="Ativo" /></span>
					
						<span class="property-value" aria-labelledby="ativo-label"><g:formatBoolean boolean="${equipamentoSetorInstance?.ativo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoSetorInstance?.cadastradoPor}">
				<li class="fieldcontain">
					<span id="cadastradoPor-label" class="property-label"><g:message code="equipamentoSetor.cadastradoPor.label" default="Cadastrado Por" /></span>
					
						<span class="property-value" aria-labelledby="cadastradoPor-label"><g:link controller="usuario" action="show" id="${equipamentoSetorInstance?.cadastradoPor?.id}">${equipamentoSetorInstance?.cadastradoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoSetorInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="equipamentoSetor.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${equipamentoSetorInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoSetorInstance?.ultimaAtualizacaoPor}">
				<li class="fieldcontain">
					<span id="ultimaAtualizacaoPor-label" class="property-label"><g:message code="equipamentoSetor.ultimaAtualizacaoPor.label" default="Ultima Atualizacao Por" /></span>
					
						<span class="property-value" aria-labelledby="ultimaAtualizacaoPor-label"><g:link controller="usuario" action="show" id="${equipamentoSetorInstance?.ultimaAtualizacaoPor?.id}">${equipamentoSetorInstance?.ultimaAtualizacaoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoSetorInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="equipamentoSetor.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${equipamentoSetorInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoSetorInstance?.desativadoPor}">
				<li class="fieldcontain">
					<span id="desativadoPor-label" class="property-label"><g:message code="equipamentoSetor.desativadoPor.label" default="Desativado Por" /></span>
					
						<span class="property-value" aria-labelledby="desativadoPor-label"><g:link controller="usuario" action="show" id="${equipamentoSetorInstance?.desativadoPor?.id}">${equipamentoSetorInstance?.desativadoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoSetorInstance?.dataDesativacao}">
				<li class="fieldcontain">
					<span id="dataDesativacao-label" class="property-label"><g:message code="equipamentoSetor.dataDesativacao.label" default="Data Desativacao" /></span>
					
						<span class="property-value" aria-labelledby="dataDesativacao-label"><g:formatDate date="${equipamentoSetorInstance?.dataDesativacao}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:equipamentoSetorInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${equipamentoSetorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

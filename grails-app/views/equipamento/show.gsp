
<%@ page import="br.edu.unirn.nds.chamado.equipamentos.Equipamento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'equipamento.label', default: 'Equipamento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-equipamento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-equipamento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list equipamento">
			
				<g:if test="${equipamentoInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="equipamento.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${equipamentoInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoInstance?.tombamento}">
				<li class="fieldcontain">
					<span id="tombamento-label" class="property-label"><g:message code="equipamento.tombamento.label" default="Tombamento" /></span>
					
						<span class="property-value" aria-labelledby="tombamento-label"><g:fieldValue bean="${equipamentoInstance}" field="tombamento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="equipamento.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${equipamentoInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoInstance?.mac}">
				<li class="fieldcontain">
					<span id="mac-label" class="property-label"><g:message code="equipamento.mac.label" default="Mac" /></span>
					
						<span class="property-value" aria-labelledby="mac-label"><g:fieldValue bean="${equipamentoInstance}" field="mac"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoInstance?.locado}">
				<li class="fieldcontain">
					<span id="locado-label" class="property-label"><g:message code="equipamento.locado.label" default="Locado" /></span>
					
						<span class="property-value" aria-labelledby="locado-label"><g:formatBoolean boolean="${equipamentoInstance?.locado}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoInstance?.empresaLocacao}">
				<li class="fieldcontain">
					<span id="empresaLocacao-label" class="property-label"><g:message code="equipamento.empresaLocacao.label" default="Empresa Locacao" /></span>
					
						<span class="property-value" aria-labelledby="empresaLocacao-label"><g:link controller="empresaLocacao" action="show" id="${equipamentoInstance?.empresaLocacao?.id}">${equipamentoInstance?.empresaLocacao?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoInstance?.tipoEquipamento}">
				<li class="fieldcontain">
					<span id="tipoEquipamento-label" class="property-label"><g:message code="equipamento.tipoEquipamento.label" default="Tipo Equipamento" /></span>
					
						<span class="property-value" aria-labelledby="tipoEquipamento-label"><g:link controller="tipoEquipamento" action="show" id="${equipamentoInstance?.tipoEquipamento?.id}">${equipamentoInstance?.tipoEquipamento?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoInstance?.ativo}">
				<li class="fieldcontain">
					<span id="ativo-label" class="property-label"><g:message code="equipamento.ativo.label" default="Ativo" /></span>
					
						<span class="property-value" aria-labelledby="ativo-label"><g:formatBoolean boolean="${equipamentoInstance?.ativo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="equipamento.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${equipamentoInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="equipamento.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${equipamentoInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoInstance?.cadastradoPor}">
				<li class="fieldcontain">
					<span id="cadastradoPor-label" class="property-label"><g:message code="equipamento.cadastradoPor.label" default="Cadastrado Por" /></span>
					
						<span class="property-value" aria-labelledby="cadastradoPor-label"><g:link controller="usuario" action="show" id="${equipamentoInstance?.cadastradoPor?.id}">${equipamentoInstance?.cadastradoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoInstance?.ultimaAtualizacaoPor}">
				<li class="fieldcontain">
					<span id="ultimaAtualizacaoPor-label" class="property-label"><g:message code="equipamento.ultimaAtualizacaoPor.label" default="Ultima Atualizacao Por" /></span>
					
						<span class="property-value" aria-labelledby="ultimaAtualizacaoPor-label"><g:link controller="usuario" action="show" id="${equipamentoInstance?.ultimaAtualizacaoPor?.id}">${equipamentoInstance?.ultimaAtualizacaoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoInstance?.desativadoPor}">
				<li class="fieldcontain">
					<span id="desativadoPor-label" class="property-label"><g:message code="equipamento.desativadoPor.label" default="Desativado Por" /></span>
					
						<span class="property-value" aria-labelledby="desativadoPor-label"><g:link controller="usuario" action="show" id="${equipamentoInstance?.desativadoPor?.id}">${equipamentoInstance?.desativadoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${equipamentoInstance?.dataDesativacao}">
				<li class="fieldcontain">
					<span id="dataDesativacao-label" class="property-label"><g:message code="equipamento.dataDesativacao.label" default="Data Desativacao" /></span>
					
						<span class="property-value" aria-labelledby="dataDesativacao-label"><g:formatDate date="${equipamentoInstance?.dataDesativacao}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:equipamentoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${equipamentoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

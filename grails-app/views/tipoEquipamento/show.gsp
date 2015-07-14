
<%@ page import="br.edu.unirn.nds.chamado.equipamentos.TipoEquipamento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoEquipamento.label', default: 'TipoEquipamento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tipoEquipamento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tipoEquipamento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tipoEquipamento">
			
				<g:if test="${tipoEquipamentoInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="tipoEquipamento.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${tipoEquipamentoInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoEquipamentoInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="tipoEquipamento.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${tipoEquipamentoInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoEquipamentoInstance?.ativo}">
				<li class="fieldcontain">
					<span id="ativo-label" class="property-label"><g:message code="tipoEquipamento.ativo.label" default="Ativo" /></span>
					
						<span class="property-value" aria-labelledby="ativo-label"><g:formatBoolean boolean="${tipoEquipamentoInstance?.ativo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoEquipamentoInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="tipoEquipamento.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${tipoEquipamentoInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoEquipamentoInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="tipoEquipamento.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${tipoEquipamentoInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoEquipamentoInstance?.cadastradoPor}">
				<li class="fieldcontain">
					<span id="cadastradoPor-label" class="property-label"><g:message code="tipoEquipamento.cadastradoPor.label" default="Cadastrado Por" /></span>
					
						<span class="property-value" aria-labelledby="cadastradoPor-label"><g:link controller="usuario" action="show" id="${tipoEquipamentoInstance?.cadastradoPor?.id}">${tipoEquipamentoInstance?.cadastradoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoEquipamentoInstance?.ultimaAtualizacaoPor}">
				<li class="fieldcontain">
					<span id="ultimaAtualizacaoPor-label" class="property-label"><g:message code="tipoEquipamento.ultimaAtualizacaoPor.label" default="Ultima Atualizacao Por" /></span>
					
						<span class="property-value" aria-labelledby="ultimaAtualizacaoPor-label"><g:link controller="usuario" action="show" id="${tipoEquipamentoInstance?.ultimaAtualizacaoPor?.id}">${tipoEquipamentoInstance?.ultimaAtualizacaoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoEquipamentoInstance?.desativadoPor}">
				<li class="fieldcontain">
					<span id="desativadoPor-label" class="property-label"><g:message code="tipoEquipamento.desativadoPor.label" default="Desativado Por" /></span>
					
						<span class="property-value" aria-labelledby="desativadoPor-label"><g:link controller="usuario" action="show" id="${tipoEquipamentoInstance?.desativadoPor?.id}">${tipoEquipamentoInstance?.desativadoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoEquipamentoInstance?.dataDesativacao}">
				<li class="fieldcontain">
					<span id="dataDesativacao-label" class="property-label"><g:message code="tipoEquipamento.dataDesativacao.label" default="Data Desativacao" /></span>
					
						<span class="property-value" aria-labelledby="dataDesativacao-label"><g:formatDate date="${tipoEquipamentoInstance?.dataDesativacao}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:tipoEquipamentoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${tipoEquipamentoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>


<%@ page import="br.edu.unirn.nds.chamado.base.Chamado" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'chamado.label', default: 'Chamado')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-chamado" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-chamado" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list chamado">
			
				<g:if test="${chamadoInstance?.setorSolicitante}">
				<li class="fieldcontain">
					<span id="setorSolicitante-label" class="property-label"><g:message code="chamado.setorSolicitante.label" default="Setor Solicitante" /></span>
					
						<span class="property-value" aria-labelledby="setorSolicitante-label"><g:link controller="setor" action="show" id="${chamadoInstance?.setorSolicitante?.id}">${chamadoInstance?.setorSolicitante?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${chamadoInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="chamado.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${chamadoInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chamadoInstance?.nomeSolicitante}">
				<li class="fieldcontain">
					<span id="nomeSolicitante-label" class="property-label"><g:message code="chamado.nomeSolicitante.label" default="Nome Solicitante" /></span>
					
						<span class="property-value" aria-labelledby="nomeSolicitante-label"><g:fieldValue bean="${chamadoInstance}" field="nomeSolicitante"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chamadoInstance?.emailSolicitante}">
				<li class="fieldcontain">
					<span id="emailSolicitante-label" class="property-label"><g:message code="chamado.emailSolicitante.label" default="Email Solicitante" /></span>
					
						<span class="property-value" aria-labelledby="emailSolicitante-label"><g:fieldValue bean="${chamadoInstance}" field="emailSolicitante"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chamadoInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="chamado.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${chamadoInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chamadoInstance?.avaliacao}">
				<li class="fieldcontain">
					<span id="avaliacao-label" class="property-label"><g:message code="chamado.avaliacao.label" default="Avaliacao" /></span>
					
						<span class="property-value" aria-labelledby="avaliacao-label"><g:fieldValue bean="${chamadoInstance}" field="avaliacao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chamadoInstance?.tags}">
				<li class="fieldcontain">
					<span id="tags-label" class="property-label"><g:message code="chamado.tags.label" default="Tags" /></span>
					
						<span class="property-value" aria-labelledby="tags-label"><g:fieldValue bean="${chamadoInstance}" field="tags"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chamadoInstance?.ativo}">
				<li class="fieldcontain">
					<span id="ativo-label" class="property-label"><g:message code="chamado.ativo.label" default="Ativo" /></span>
					
						<span class="property-value" aria-labelledby="ativo-label"><g:formatBoolean boolean="${chamadoInstance?.ativo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chamadoInstance?.cadastradoPor}">
				<li class="fieldcontain">
					<span id="cadastradoPor-label" class="property-label"><g:message code="chamado.cadastradoPor.label" default="Cadastrado Por" /></span>
					
						<span class="property-value" aria-labelledby="cadastradoPor-label"><g:link controller="usuario" action="show" id="${chamadoInstance?.cadastradoPor?.id}">${chamadoInstance?.cadastradoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${chamadoInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="chamado.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${chamadoInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chamadoInstance?.ultimaAtualizacaoPor}">
				<li class="fieldcontain">
					<span id="ultimaAtualizacaoPor-label" class="property-label"><g:message code="chamado.ultimaAtualizacaoPor.label" default="Ultima Atualizacao Por" /></span>
					
						<span class="property-value" aria-labelledby="ultimaAtualizacaoPor-label"><g:link controller="usuario" action="show" id="${chamadoInstance?.ultimaAtualizacaoPor?.id}">${chamadoInstance?.ultimaAtualizacaoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${chamadoInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="chamado.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${chamadoInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chamadoInstance?.desativadoPor}">
				<li class="fieldcontain">
					<span id="desativadoPor-label" class="property-label"><g:message code="chamado.desativadoPor.label" default="Desativado Por" /></span>
					
						<span class="property-value" aria-labelledby="desativadoPor-label"><g:link controller="usuario" action="show" id="${chamadoInstance?.desativadoPor?.id}">${chamadoInstance?.desativadoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${chamadoInstance?.dataDesativacao}">
				<li class="fieldcontain">
					<span id="dataDesativacao-label" class="property-label"><g:message code="chamado.dataDesativacao.label" default="Data Desativacao" /></span>
					
						<span class="property-value" aria-labelledby="dataDesativacao-label"><g:formatDate date="${chamadoInstance?.dataDesativacao}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:chamadoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${chamadoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

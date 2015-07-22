
<%@ page import="br.edu.unirn.nds.chamado.base.EmpresaLocacao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'empresaLocacao.label', default: 'EmpresaLocacao')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-empresaLocacao" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-empresaLocacao" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list empresaLocacao">
			
				<g:if test="${empresaLocacaoInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="empresaLocacao.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${empresaLocacaoInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaLocacaoInstance?.razaoSocial}">
				<li class="fieldcontain">
					<span id="razaoSocial-label" class="property-label"><g:message code="empresaLocacao.razaoSocial.label" default="Razao Social" /></span>
					
						<span class="property-value" aria-labelledby="razaoSocial-label"><g:fieldValue bean="${empresaLocacaoInstance}" field="razaoSocial"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaLocacaoInstance?.cpfCnpj}">
				<li class="fieldcontain">
					<span id="cpfCnpj-label" class="property-label"><g:message code="empresaLocacao.cpfCnpj.label" default="Cpf Cnpj" /></span>
					
						<span class="property-value" aria-labelledby="cpfCnpj-label"><g:fieldValue bean="${empresaLocacaoInstance}" field="cpfCnpj"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaLocacaoInstance?.responsavelAtendimento}">
				<li class="fieldcontain">
					<span id="responsavelAtendimento-label" class="property-label"><g:message code="empresaLocacao.responsavelAtendimento.label" default="Responsavel Atendimento" /></span>
					
						<span class="property-value" aria-labelledby="responsavelAtendimento-label"><g:fieldValue bean="${empresaLocacaoInstance}" field="responsavelAtendimento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaLocacaoInstance?.observacao}">
				<li class="fieldcontain">
					<span id="observacao-label" class="property-label"><g:message code="empresaLocacao.observacao.label" default="Observacao" /></span>
					
						<span class="property-value" aria-labelledby="observacao-label"><g:fieldValue bean="${empresaLocacaoInstance}" field="observacao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaLocacaoInstance?.ativo}">
				<li class="fieldcontain">
					<span id="ativo-label" class="property-label"><g:message code="empresaLocacao.ativo.label" default="Ativo" /></span>
					
						<span class="property-value" aria-labelledby="ativo-label"><g:formatBoolean boolean="${empresaLocacaoInstance?.ativo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaLocacaoInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="empresaLocacao.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${empresaLocacaoInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaLocacaoInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="empresaLocacao.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${empresaLocacaoInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaLocacaoInstance?.cadastradoPor}">
				<li class="fieldcontain">
					<span id="cadastradoPor-label" class="property-label"><g:message code="empresaLocacao.cadastradoPor.label" default="Cadastrado Por" /></span>
					
						<span class="property-value" aria-labelledby="cadastradoPor-label"><g:link controller="usuario" action="show" id="${empresaLocacaoInstance?.cadastradoPor?.id}">${empresaLocacaoInstance?.cadastradoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaLocacaoInstance?.ultimaAtualizacaoPor}">
				<li class="fieldcontain">
					<span id="ultimaAtualizacaoPor-label" class="property-label"><g:message code="empresaLocacao.ultimaAtualizacaoPor.label" default="Ultima Atualizacao Por" /></span>
					
						<span class="property-value" aria-labelledby="ultimaAtualizacaoPor-label"><g:link controller="usuario" action="show" id="${empresaLocacaoInstance?.ultimaAtualizacaoPor?.id}">${empresaLocacaoInstance?.ultimaAtualizacaoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaLocacaoInstance?.desativadoPor}">
				<li class="fieldcontain">
					<span id="desativadoPor-label" class="property-label"><g:message code="empresaLocacao.desativadoPor.label" default="Desativado Por" /></span>
					
						<span class="property-value" aria-labelledby="desativadoPor-label"><g:link controller="usuario" action="show" id="${empresaLocacaoInstance?.desativadoPor?.id}">${empresaLocacaoInstance?.desativadoPor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaLocacaoInstance?.dataDesativacao}">
				<li class="fieldcontain">
					<span id="dataDesativacao-label" class="property-label"><g:message code="empresaLocacao.dataDesativacao.label" default="Data Desativacao" /></span>
					
						<span class="property-value" aria-labelledby="dataDesativacao-label"><g:formatDate date="${empresaLocacaoInstance?.dataDesativacao}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:empresaLocacaoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${empresaLocacaoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

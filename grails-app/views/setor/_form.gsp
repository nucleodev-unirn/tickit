<%@ page import="br.edu.unirn.nds.chamado.base.Setor" %>



<div class="form-group ${hasErrors(bean: setorInstance, field: 'nome', 'error')} required">
	<label for="nome" class="col-sm-2 control-label">
		<g:message code="setor.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="nome" required="" value="${setorInstance?.nome}"/>

		<g:hasErrors bean="${setorInstance}" field="nome">
			<span class="help-block error"><g:renderErrors bean="${setorInstance}" field="nome" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: setorInstance, field: 'ativo', 'error')} ">
	<label for="ativo" class="col-sm-2 control-label">
		<g:message code="setor.ativo.label" default="Ativo" />
		
	</label>
	<div class="col-sm-5">
		<g:checkBox name="ativo" value="${setorInstance?.ativo}" />

		<g:hasErrors bean="${setorInstance}" field="ativo">
			<span class="help-block error"><g:renderErrors bean="${setorInstance}" field="ativo" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

		
			<g:hiddenField name="cadastradoPor" value="${session.usuario?.id}"  />
		

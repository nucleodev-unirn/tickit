<%@ page import="br.edu.unirn.nds.chamado.base.StatusChamado" %>



<div class="form-group ${hasErrors(bean: statusChamadoInstance, field: 'nome', 'error')} required">
	<label for="nome" class="col-sm-2 control-label">
		<g:message code="statusChamado.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="nome" required="" value="${statusChamadoInstance?.nome}"/>

		<g:hasErrors bean="${statusChamadoInstance}" field="nome">
			<span class="help-block error"><g:renderErrors bean="${statusChamadoInstance}" field="nome" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: statusChamadoInstance, field: 'descricao', 'error')} ">
	<label for="descricao" class="col-sm-2 control-label">
		<g:message code="statusChamado.descricao.label" default="Descricao" />
		
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="descricao" value="${statusChamadoInstance?.descricao}"/>

		<g:hasErrors bean="${statusChamadoInstance}" field="descricao">
			<span class="help-block error"><g:renderErrors bean="${statusChamadoInstance}" field="descricao" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: statusChamadoInstance, field: 'ativo', 'error')} ">
	<label for="ativo" class="col-sm-2 control-label">
		<g:message code="statusChamado.ativo.label" default="Ativo" />
		
	</label>
	<div class="col-sm-5">
		<g:checkBox name="ativo" value="${statusChamadoInstance?.ativo}" />

		<g:hasErrors bean="${statusChamadoInstance}" field="ativo">
			<span class="help-block error"><g:renderErrors bean="${statusChamadoInstance}" field="ativo" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

		
			<g:hiddenField name="cadastradoPor" value="${session.usuario?.id}"  />
		

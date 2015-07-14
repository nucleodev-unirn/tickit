<%@ page import="br.edu.unirn.nds.chamado.equipamentos.TipoEquipamento" %>



<div class="form-group ${hasErrors(bean: tipoEquipamentoInstance, field: 'nome', 'error')} required">
	<label for="nome" class="col-sm-2 control-label">
		<g:message code="tipoEquipamento.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="nome" required="" value="${tipoEquipamentoInstance?.nome}"/>

		<g:hasErrors bean="${tipoEquipamentoInstance}" field="nome">
			<span class="help-block error"><g:renderErrors bean="${tipoEquipamentoInstance}" field="nome" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: tipoEquipamentoInstance, field: 'descricao', 'error')} ">
	<label for="descricao" class="col-sm-2 control-label">
		<g:message code="tipoEquipamento.descricao.label" default="Descricao" />
		
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="descricao" value="${tipoEquipamentoInstance?.descricao}"/>

		<g:hasErrors bean="${tipoEquipamentoInstance}" field="descricao">
			<span class="help-block error"><g:renderErrors bean="${tipoEquipamentoInstance}" field="descricao" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: tipoEquipamentoInstance, field: 'ativo', 'error')} ">
	<label for="ativo" class="col-sm-2 control-label">
		<g:message code="tipoEquipamento.ativo.label" default="Ativo" />
		
	</label>
	<div class="col-sm-5">
		<g:checkBox name="ativo" value="${tipoEquipamentoInstance?.ativo}" />

		<g:hasErrors bean="${tipoEquipamentoInstance}" field="ativo">
			<span class="help-block error"><g:renderErrors bean="${tipoEquipamentoInstance}" field="ativo" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

		
			<g:hiddenField name="cadastradoPor" value="${session.usuario?.id}"  />
		

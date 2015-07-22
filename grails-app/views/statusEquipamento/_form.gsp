<%@ page import="br.edu.unirn.nds.chamado.equipamentos.StatusEquipamento" %>



<div class="form-group ${hasErrors(bean: statusEquipamentoInstance, field: 'nome', 'error')} required">
	<label for="nome" class="col-sm-2 control-label">
		<g:message code="statusEquipamento.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="nome" required="" value="${statusEquipamentoInstance?.nome}"/>

		<g:hasErrors bean="${statusEquipamentoInstance}" field="nome">
			<span class="help-block error"><g:renderErrors bean="${statusEquipamentoInstance}" field="nome" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: statusEquipamentoInstance, field: 'descricao', 'error')} ">
	<label for="descricao" class="col-sm-2 control-label">
		<g:message code="statusEquipamento.descricao.label" default="Descricao" />
		
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="descricao" value="${statusEquipamentoInstance?.descricao}"/>

		<g:hasErrors bean="${statusEquipamentoInstance}" field="descricao">
			<span class="help-block error"><g:renderErrors bean="${statusEquipamentoInstance}" field="descricao" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: statusEquipamentoInstance, field: 'ativo', 'error')} ">
	<label for="ativo" class="col-sm-2 control-label">
		<g:message code="statusEquipamento.ativo.label" default="Ativo" />
		
	</label>
	<div class="col-sm-5">
		<g:checkBox name="ativo" value="${statusEquipamentoInstance?.ativo}" />

		<g:hasErrors bean="${statusEquipamentoInstance}" field="ativo">
			<span class="help-block error"><g:renderErrors bean="${statusEquipamentoInstance}" field="ativo" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

		
			<g:hiddenField name="cadastradoPor" value="${session.usuario?.id}"  />
		

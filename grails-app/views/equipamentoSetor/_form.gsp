<%@ page import="br.edu.unirn.nds.chamado.equipamentos.EquipamentoSetor" %>



<div class="form-group ${hasErrors(bean: equipamentoSetorInstance, field: 'setor', 'error')} required">
	<label for="setor" class="col-sm-2 control-label">
		<g:message code="equipamentoSetor.setor.label" default="Setor" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="setor" name="setor.id" from="${br.edu.unirn.nds.chamado.base.Setor.list()}" optionKey="id" required="" value="${equipamentoSetorInstance?.setor?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${equipamentoSetorInstance}" field="setor">
			<span class="help-block error"><g:renderErrors bean="${equipamentoSetorInstance}" field="setor" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: equipamentoSetorInstance, field: 'equipamento', 'error')} required">
	<label for="equipamento" class="col-sm-2 control-label">
		<g:message code="equipamentoSetor.equipamento.label" default="Equipamento" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="equipamento" name="equipamento.id" from="${br.edu.unirn.nds.chamado.equipamentos.Equipamento.list()}" optionKey="id" required="" value="${equipamentoSetorInstance?.equipamento?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${equipamentoSetorInstance}" field="equipamento">
			<span class="help-block error"><g:renderErrors bean="${equipamentoSetorInstance}" field="equipamento" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: equipamentoSetorInstance, field: 'ativo', 'error')} ">
	<label for="ativo" class="col-sm-2 control-label">
		<g:message code="equipamentoSetor.ativo.label" default="Ativo" />
		
	</label>
	<div class="col-sm-5">
		<g:checkBox name="ativo" value="${equipamentoSetorInstance?.ativo}" />

		<g:hasErrors bean="${equipamentoSetorInstance}" field="ativo">
			<span class="help-block error"><g:renderErrors bean="${equipamentoSetorInstance}" field="ativo" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

		
			<g:hiddenField name="cadastradoPor" value="${session.usuario?.id}"  />
		
<div class="form-group ${hasErrors(bean: equipamentoSetorInstance, field: 'ultimaAtualizacaoPor', 'error')} required">
	<label for="ultimaAtualizacaoPor" class="col-sm-2 control-label">
		<g:message code="equipamentoSetor.ultimaAtualizacaoPor.label" default="Ultima Atualizacao Por" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="ultimaAtualizacaoPor" name="ultimaAtualizacaoPor.id" from="${br.edu.unirn.nds.chamado.acesso.Usuario.list()}" optionKey="id" required="" value="${equipamentoSetorInstance?.ultimaAtualizacaoPor?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${equipamentoSetorInstance}" field="ultimaAtualizacaoPor">
			<span class="help-block error"><g:renderErrors bean="${equipamentoSetorInstance}" field="ultimaAtualizacaoPor" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: equipamentoSetorInstance, field: 'desativadoPor', 'error')} required">
	<label for="desativadoPor" class="col-sm-2 control-label">
		<g:message code="equipamentoSetor.desativadoPor.label" default="Desativado Por" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="desativadoPor" name="desativadoPor.id" from="${br.edu.unirn.nds.chamado.acesso.Usuario.list()}" optionKey="id" required="" value="${equipamentoSetorInstance?.desativadoPor?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${equipamentoSetorInstance}" field="desativadoPor">
			<span class="help-block error"><g:renderErrors bean="${equipamentoSetorInstance}" field="desativadoPor" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: equipamentoSetorInstance, field: 'dataDesativacao', 'error')} required">
	<label for="dataDesativacao" class="col-sm-2 control-label">
		<g:message code="equipamentoSetor.dataDesativacao.label" default="Data Desativacao" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:datePicker name="dataDesativacao" precision="day"  value="${equipamentoSetorInstance?.dataDesativacao}"  />

		<g:hasErrors bean="${equipamentoSetorInstance}" field="dataDesativacao">
			<span class="help-block error"><g:renderErrors bean="${equipamentoSetorInstance}" field="dataDesativacao" as="list" /></span>
		</g:hasErrors>
	</div>
</div>


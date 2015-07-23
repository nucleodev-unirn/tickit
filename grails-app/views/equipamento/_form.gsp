<%@ page import="br.edu.unirn.nds.chamado.equipamentos.Equipamento" %>



<div class="form-group ${hasErrors(bean: equipamentoInstance, field: 'nome', 'error')} required">
	<label for="nome" class="col-sm-2 control-label">
		<g:message code="equipamento.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="nome" required="" value="${equipamentoInstance?.nome}"/>

		<g:hasErrors bean="${equipamentoInstance}" field="nome">
			<span class="help-block error"><g:renderErrors bean="${equipamentoInstance}" field="nome" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: equipamentoInstance, field: 'tombamento', 'error')} required">
	<label for="tombamento" class="col-sm-2 control-label">
		<g:message code="equipamento.tombamento.label" default="Tombamento" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="tombamento" required="" value="${equipamentoInstance?.tombamento}"/>

		<g:hasErrors bean="${equipamentoInstance}" field="tombamento">
			<span class="help-block error"><g:renderErrors bean="${equipamentoInstance}" field="tombamento" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: equipamentoInstance, field: 'descricao', 'error')} ">
	<label for="descricao" class="col-sm-2 control-label">
		<g:message code="equipamento.descricao.label" default="Descricao" />
		
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="descricao" value="${equipamentoInstance?.descricao}"/>

		<g:hasErrors bean="${equipamentoInstance}" field="descricao">
			<span class="help-block error"><g:renderErrors bean="${equipamentoInstance}" field="descricao" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: equipamentoInstance, field: 'mac', 'error')} ">
	<label for="mac" class="col-sm-2 control-label">
		<g:message code="equipamento.mac.label" default="Mac" />
		
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="mac" value="${equipamentoInstance?.mac}"/>

		<g:hasErrors bean="${equipamentoInstance}" field="mac">
			<span class="help-block error"><g:renderErrors bean="${equipamentoInstance}" field="mac" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: equipamentoInstance, field: 'locado', 'error')} ">
	<label for="locado" class="col-sm-2 control-label">
		<g:message code="equipamento.locado.label" default="Locado" />
		
	</label>
	<div class="col-sm-5">
		<g:checkBox name="locado" value="${equipamentoInstance?.locado}" />

		<g:hasErrors bean="${equipamentoInstance}" field="locado">
			<span class="help-block error"><g:renderErrors bean="${equipamentoInstance}" field="locado" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: equipamentoInstance, field: 'empresaLocacao', 'error')} required">
	<label for="empresaLocacao" class="col-sm-2 control-label">
		<g:message code="equipamento.empresaLocacao.label" default="Empresa Locacao" />
	</label>
	<div class="col-sm-5">
		<g:select id="empresaLocacao" name="empresaLocacao.id" from="${br.edu.unirn.nds.chamado.base.EmpresaLocacao.list()}" optionKey="id"  value="${equipamentoInstance?.empresaLocacao?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${equipamentoInstance}" field="empresaLocacao">
			<span class="help-block error"><g:renderErrors bean="${equipamentoInstance}" field="empresaLocacao" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: equipamentoInstance, field: 'tipoEquipamento', 'error')} required">
	<label for="tipoEquipamento" class="col-sm-2 control-label">
		<g:message code="equipamento.tipoEquipamento.label" default="Tipo Equipamento" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="tipoEquipamento" name="tipoEquipamento.id" from="${br.edu.unirn.nds.chamado.equipamentos.TipoEquipamento.list()}" optionKey="id" required="" value="${equipamentoInstance?.tipoEquipamento?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${equipamentoInstance}" field="tipoEquipamento">
			<span class="help-block error"><g:renderErrors bean="${equipamentoInstance}" field="tipoEquipamento" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: equipamentoInstance, field: 'ativo', 'error')} ">
	<label for="ativo" class="col-sm-2 control-label">
		<g:message code="equipamento.ativo.label" default="Ativo" />
		
	</label>
	<div class="col-sm-5">
		<g:checkBox name="ativo" value="${equipamentoInstance?.ativo}" />

		<g:hasErrors bean="${equipamentoInstance}" field="ativo">
			<span class="help-block error"><g:renderErrors bean="${equipamentoInstance}" field="ativo" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

		
			<g:hiddenField name="cadastradoPor" value="${session.usuario?.id}"  />
		

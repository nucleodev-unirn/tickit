<%@ page import="br.edu.unirn.nds.chamado.equipamentos.EquipamentoChamado" %>



<div class="form-group ${hasErrors(bean: equipamentoChamadoInstance, field: 'equipamento', 'error')} required">
	<label for="equipamento" class="col-sm-2 control-label">
		<g:message code="equipamentoChamado.equipamento.label" default="Equipamento" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="equipamento" name="equipamento.id" from="${br.edu.unirn.nds.chamado.equipamentos.Equipamento.list()}" optionKey="id" required="" value="${equipamentoChamadoInstance?.equipamento?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${equipamentoChamadoInstance}" field="equipamento">
			<span class="help-block error"><g:renderErrors bean="${equipamentoChamadoInstance}" field="equipamento" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: equipamentoChamadoInstance, field: 'chamado', 'error')} required">
	<label for="chamado" class="col-sm-2 control-label">
		<g:message code="equipamentoChamado.chamado.label" default="Chamado" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="chamado" name="chamado.id" from="${br.edu.unirn.nds.chamado.base.Chamado.list()}" optionKey="id" required="" value="${equipamentoChamadoInstance?.chamado?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${equipamentoChamadoInstance}" field="chamado">
			<span class="help-block error"><g:renderErrors bean="${equipamentoChamadoInstance}" field="chamado" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: equipamentoChamadoInstance, field: 'ativo', 'error')} ">
	<label for="ativo" class="col-sm-2 control-label">
		<g:message code="equipamentoChamado.ativo.label" default="Ativo" />
		
	</label>
	<div class="col-sm-5">
		<g:checkBox name="ativo" value="${equipamentoChamadoInstance?.ativo}" />

		<g:hasErrors bean="${equipamentoChamadoInstance}" field="ativo">
			<span class="help-block error"><g:renderErrors bean="${equipamentoChamadoInstance}" field="ativo" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

		
			<g:hiddenField name="cadastradoPor" value="${session.usuario?.id}"  />
		
<div class="form-group ${hasErrors(bean: equipamentoChamadoInstance, field: 'ultimaAtualizacaoPor', 'error')} required">
	<label for="ultimaAtualizacaoPor" class="col-sm-2 control-label">
		<g:message code="equipamentoChamado.ultimaAtualizacaoPor.label" default="Ultima Atualizacao Por" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="ultimaAtualizacaoPor" name="ultimaAtualizacaoPor.id" from="${br.edu.unirn.nds.chamado.acesso.Usuario.list()}" optionKey="id" required="" value="${equipamentoChamadoInstance?.ultimaAtualizacaoPor?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${equipamentoChamadoInstance}" field="ultimaAtualizacaoPor">
			<span class="help-block error"><g:renderErrors bean="${equipamentoChamadoInstance}" field="ultimaAtualizacaoPor" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: equipamentoChamadoInstance, field: 'desativadoPor', 'error')} required">
	<label for="desativadoPor" class="col-sm-2 control-label">
		<g:message code="equipamentoChamado.desativadoPor.label" default="Desativado Por" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="desativadoPor" name="desativadoPor.id" from="${br.edu.unirn.nds.chamado.acesso.Usuario.list()}" optionKey="id" required="" value="${equipamentoChamadoInstance?.desativadoPor?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${equipamentoChamadoInstance}" field="desativadoPor">
			<span class="help-block error"><g:renderErrors bean="${equipamentoChamadoInstance}" field="desativadoPor" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: equipamentoChamadoInstance, field: 'dataDesativacao', 'error')} required">
	<label for="dataDesativacao" class="col-sm-2 control-label">
		<g:message code="equipamentoChamado.dataDesativacao.label" default="Data Desativacao" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:datePicker name="dataDesativacao" precision="day"  value="${equipamentoChamadoInstance?.dataDesativacao}"  />

		<g:hasErrors bean="${equipamentoChamadoInstance}" field="dataDesativacao">
			<span class="help-block error"><g:renderErrors bean="${equipamentoChamadoInstance}" field="dataDesativacao" as="list" /></span>
		</g:hasErrors>
	</div>
</div>


<%@ page import="br.edu.unirn.nds.chamado.base.AlteracaoStatusChamado" %>



<div class="form-group ${hasErrors(bean: alteracaoStatusChamadoInstance, field: 'statusChamado', 'error')} required">
	<label for="statusChamado" class="col-sm-2 control-label">
		<g:message code="alteracaoStatusChamado.statusChamado.label" default="Status Chamado" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="statusChamado" name="statusChamado.id" from="${br.edu.unirn.nds.chamado.base.StatusChamado.list()}" optionKey="id" required="" value="${alteracaoStatusChamadoInstance?.statusChamado?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${alteracaoStatusChamadoInstance}" field="statusChamado">
			<span class="help-block error"><g:renderErrors bean="${alteracaoStatusChamadoInstance}" field="statusChamado" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: alteracaoStatusChamadoInstance, field: 'observacao', 'error')} required">
	<label for="observacao" class="col-sm-2 control-label">
		<g:message code="alteracaoStatusChamado.observacao.label" default="Observacao" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="observacao" required="" value="${alteracaoStatusChamadoInstance?.observacao}"/>

		<g:hasErrors bean="${alteracaoStatusChamadoInstance}" field="observacao">
			<span class="help-block error"><g:renderErrors bean="${alteracaoStatusChamadoInstance}" field="observacao" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: alteracaoStatusChamadoInstance, field: 'ativo', 'error')} ">
	<label for="ativo" class="col-sm-2 control-label">
		<g:message code="alteracaoStatusChamado.ativo.label" default="Ativo" />
		
	</label>
	<div class="col-sm-5">
		<g:checkBox name="ativo" value="${alteracaoStatusChamadoInstance?.ativo}" />

		<g:hasErrors bean="${alteracaoStatusChamadoInstance}" field="ativo">
			<span class="help-block error"><g:renderErrors bean="${alteracaoStatusChamadoInstance}" field="ativo" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

		
			<g:hiddenField name="cadastradoPor" value="${session.usuario?.id}"  />
		
<div class="form-group ${hasErrors(bean: alteracaoStatusChamadoInstance, field: 'ultimaAtualizacaoPor', 'error')} required">
	<label for="ultimaAtualizacaoPor" class="col-sm-2 control-label">
		<g:message code="alteracaoStatusChamado.ultimaAtualizacaoPor.label" default="Ultima Atualizacao Por" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="ultimaAtualizacaoPor" name="ultimaAtualizacaoPor.id" from="${br.edu.unirn.nds.chamado.acesso.Usuario.list()}" optionKey="id" required="" value="${alteracaoStatusChamadoInstance?.ultimaAtualizacaoPor?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${alteracaoStatusChamadoInstance}" field="ultimaAtualizacaoPor">
			<span class="help-block error"><g:renderErrors bean="${alteracaoStatusChamadoInstance}" field="ultimaAtualizacaoPor" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: alteracaoStatusChamadoInstance, field: 'desativadoPor', 'error')} required">
	<label for="desativadoPor" class="col-sm-2 control-label">
		<g:message code="alteracaoStatusChamado.desativadoPor.label" default="Desativado Por" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="desativadoPor" name="desativadoPor.id" from="${br.edu.unirn.nds.chamado.acesso.Usuario.list()}" optionKey="id" required="" value="${alteracaoStatusChamadoInstance?.desativadoPor?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${alteracaoStatusChamadoInstance}" field="desativadoPor">
			<span class="help-block error"><g:renderErrors bean="${alteracaoStatusChamadoInstance}" field="desativadoPor" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: alteracaoStatusChamadoInstance, field: 'dataDesativacao', 'error')} required">
	<label for="dataDesativacao" class="col-sm-2 control-label">
		<g:message code="alteracaoStatusChamado.dataDesativacao.label" default="Data Desativacao" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:datePicker name="dataDesativacao" precision="day"  value="${alteracaoStatusChamadoInstance?.dataDesativacao}"  />

		<g:hasErrors bean="${alteracaoStatusChamadoInstance}" field="dataDesativacao">
			<span class="help-block error"><g:renderErrors bean="${alteracaoStatusChamadoInstance}" field="dataDesativacao" as="list" /></span>
		</g:hasErrors>
	</div>
</div>


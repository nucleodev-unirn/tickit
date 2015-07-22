<%@ page import="br.edu.unirn.nds.chamado.base.ResponsavelChamado" %>



<div class="form-group ${hasErrors(bean: responsavelChamadoInstance, field: 'responsavel', 'error')} required">
	<label for="responsavel" class="col-sm-2 control-label">
		<g:message code="responsavelChamado.responsavel.label" default="Responsavel" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="responsavel" name="responsavel.id" from="${br.edu.unirn.nds.chamado.acesso.Usuario.list()}" optionKey="id" required="" value="${responsavelChamadoInstance?.responsavel?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${responsavelChamadoInstance}" field="responsavel">
			<span class="help-block error"><g:renderErrors bean="${responsavelChamadoInstance}" field="responsavel" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: responsavelChamadoInstance, field: 'chamado', 'error')} required">
	<label for="chamado" class="col-sm-2 control-label">
		<g:message code="responsavelChamado.chamado.label" default="Chamado" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="chamado" name="chamado.id" from="${br.edu.unirn.nds.chamado.base.Chamado.list()}" optionKey="id" required="" value="${responsavelChamadoInstance?.chamado?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${responsavelChamadoInstance}" field="chamado">
			<span class="help-block error"><g:renderErrors bean="${responsavelChamadoInstance}" field="chamado" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: responsavelChamadoInstance, field: 'ativo', 'error')} ">
	<label for="ativo" class="col-sm-2 control-label">
		<g:message code="responsavelChamado.ativo.label" default="Ativo" />
		
	</label>
	<div class="col-sm-5">
		<g:checkBox name="ativo" value="${responsavelChamadoInstance?.ativo}" />

		<g:hasErrors bean="${responsavelChamadoInstance}" field="ativo">
			<span class="help-block error"><g:renderErrors bean="${responsavelChamadoInstance}" field="ativo" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

		
			<g:hiddenField name="cadastradoPor" value="${session.usuario?.id}"  />
		
<div class="form-group ${hasErrors(bean: responsavelChamadoInstance, field: 'ultimaAtualizacaoPor', 'error')} required">
	<label for="ultimaAtualizacaoPor" class="col-sm-2 control-label">
		<g:message code="responsavelChamado.ultimaAtualizacaoPor.label" default="Ultima Atualizacao Por" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="ultimaAtualizacaoPor" name="ultimaAtualizacaoPor.id" from="${br.edu.unirn.nds.chamado.acesso.Usuario.list()}" optionKey="id" required="" value="${responsavelChamadoInstance?.ultimaAtualizacaoPor?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${responsavelChamadoInstance}" field="ultimaAtualizacaoPor">
			<span class="help-block error"><g:renderErrors bean="${responsavelChamadoInstance}" field="ultimaAtualizacaoPor" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: responsavelChamadoInstance, field: 'desativadoPor', 'error')} required">
	<label for="desativadoPor" class="col-sm-2 control-label">
		<g:message code="responsavelChamado.desativadoPor.label" default="Desativado Por" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="desativadoPor" name="desativadoPor.id" from="${br.edu.unirn.nds.chamado.acesso.Usuario.list()}" optionKey="id" required="" value="${responsavelChamadoInstance?.desativadoPor?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${responsavelChamadoInstance}" field="desativadoPor">
			<span class="help-block error"><g:renderErrors bean="${responsavelChamadoInstance}" field="desativadoPor" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: responsavelChamadoInstance, field: 'dataDesativacao', 'error')} required">
	<label for="dataDesativacao" class="col-sm-2 control-label">
		<g:message code="responsavelChamado.dataDesativacao.label" default="Data Desativacao" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:datePicker name="dataDesativacao" precision="day"  value="${responsavelChamadoInstance?.dataDesativacao}"  />

		<g:hasErrors bean="${responsavelChamadoInstance}" field="dataDesativacao">
			<span class="help-block error"><g:renderErrors bean="${responsavelChamadoInstance}" field="dataDesativacao" as="list" /></span>
		</g:hasErrors>
	</div>
</div>


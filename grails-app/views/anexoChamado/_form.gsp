<%@ page import="br.edu.unirn.nds.chamado.base.AnexoChamado" %>



<div class="form-group ${hasErrors(bean: anexoChamadoInstance, field: 'enderecoAnexo', 'error')} required">
	<label for="enderecoAnexo" class="col-sm-2 control-label">
		<g:message code="anexoChamado.enderecoAnexo.label" default="Endereco Anexo" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="enderecoAnexo" required="" value="${anexoChamadoInstance?.enderecoAnexo}"/>

		<g:hasErrors bean="${anexoChamadoInstance}" field="enderecoAnexo">
			<span class="help-block error"><g:renderErrors bean="${anexoChamadoInstance}" field="enderecoAnexo" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: anexoChamadoInstance, field: 'chamado', 'error')} required">
	<label for="chamado" class="col-sm-2 control-label">
		<g:message code="anexoChamado.chamado.label" default="Chamado" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="chamado" name="chamado.id" from="${br.edu.unirn.nds.chamado.base.Chamado.list()}" optionKey="id" required="" value="${anexoChamadoInstance?.chamado?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${anexoChamadoInstance}" field="chamado">
			<span class="help-block error"><g:renderErrors bean="${anexoChamadoInstance}" field="chamado" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: anexoChamadoInstance, field: 'ativo', 'error')} ">
	<label for="ativo" class="col-sm-2 control-label">
		<g:message code="anexoChamado.ativo.label" default="Ativo" />
		
	</label>
	<div class="col-sm-5">
		<g:checkBox name="ativo" value="${anexoChamadoInstance?.ativo}" />

		<g:hasErrors bean="${anexoChamadoInstance}" field="ativo">
			<span class="help-block error"><g:renderErrors bean="${anexoChamadoInstance}" field="ativo" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

		
			<g:hiddenField name="cadastradoPor" value="${session.usuario?.id}"  />
		
<div class="form-group ${hasErrors(bean: anexoChamadoInstance, field: 'ultimaAtualizacaoPor', 'error')} required">
	<label for="ultimaAtualizacaoPor" class="col-sm-2 control-label">
		<g:message code="anexoChamado.ultimaAtualizacaoPor.label" default="Ultima Atualizacao Por" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="ultimaAtualizacaoPor" name="ultimaAtualizacaoPor.id" from="${br.edu.unirn.nds.chamado.acesso.Usuario.list()}" optionKey="id" required="" value="${anexoChamadoInstance?.ultimaAtualizacaoPor?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${anexoChamadoInstance}" field="ultimaAtualizacaoPor">
			<span class="help-block error"><g:renderErrors bean="${anexoChamadoInstance}" field="ultimaAtualizacaoPor" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: anexoChamadoInstance, field: 'desativadoPor', 'error')} required">
	<label for="desativadoPor" class="col-sm-2 control-label">
		<g:message code="anexoChamado.desativadoPor.label" default="Desativado Por" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="desativadoPor" name="desativadoPor.id" from="${br.edu.unirn.nds.chamado.acesso.Usuario.list()}" optionKey="id" required="" value="${anexoChamadoInstance?.desativadoPor?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${anexoChamadoInstance}" field="desativadoPor">
			<span class="help-block error"><g:renderErrors bean="${anexoChamadoInstance}" field="desativadoPor" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: anexoChamadoInstance, field: 'dataDesativacao', 'error')} required">
	<label for="dataDesativacao" class="col-sm-2 control-label">
		<g:message code="anexoChamado.dataDesativacao.label" default="Data Desativacao" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:datePicker name="dataDesativacao" precision="day"  value="${anexoChamadoInstance?.dataDesativacao}"  />

		<g:hasErrors bean="${anexoChamadoInstance}" field="dataDesativacao">
			<span class="help-block error"><g:renderErrors bean="${anexoChamadoInstance}" field="dataDesativacao" as="list" /></span>
		</g:hasErrors>
	</div>
</div>


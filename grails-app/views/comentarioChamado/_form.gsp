<%@ page import="br.edu.unirn.nds.chamado.base.ComentarioChamado" %>



<div class="form-group ${hasErrors(bean: comentarioChamadoInstance, field: 'comentario', 'error')} required">
	<label for="comentario" class="col-sm-2 control-label">
		<g:message code="comentarioChamado.comentario.label" default="Comentario" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="comentario" required="" value="${comentarioChamadoInstance?.comentario}"/>

		<g:hasErrors bean="${comentarioChamadoInstance}" field="comentario">
			<span class="help-block error"><g:renderErrors bean="${comentarioChamadoInstance}" field="comentario" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: comentarioChamadoInstance, field: 'chamado', 'error')} required">
	<label for="chamado" class="col-sm-2 control-label">
		<g:message code="comentarioChamado.chamado.label" default="Chamado" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="chamado" name="chamado.id" from="${br.edu.unirn.nds.chamado.base.Chamado.list()}" optionKey="id" required="" value="${comentarioChamadoInstance?.chamado?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${comentarioChamadoInstance}" field="chamado">
			<span class="help-block error"><g:renderErrors bean="${comentarioChamadoInstance}" field="chamado" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: comentarioChamadoInstance, field: 'ativo', 'error')} ">
	<label for="ativo" class="col-sm-2 control-label">
		<g:message code="comentarioChamado.ativo.label" default="Ativo" />
		
	</label>
	<div class="col-sm-5">
		<g:checkBox name="ativo" value="${comentarioChamadoInstance?.ativo}" />

		<g:hasErrors bean="${comentarioChamadoInstance}" field="ativo">
			<span class="help-block error"><g:renderErrors bean="${comentarioChamadoInstance}" field="ativo" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

		
			<g:hiddenField name="cadastradoPor" value="${session.usuario?.id}"  />
		
<div class="form-group ${hasErrors(bean: comentarioChamadoInstance, field: 'ultimaAtualizacaoPor', 'error')} required">
	<label for="ultimaAtualizacaoPor" class="col-sm-2 control-label">
		<g:message code="comentarioChamado.ultimaAtualizacaoPor.label" default="Ultima Atualizacao Por" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="ultimaAtualizacaoPor" name="ultimaAtualizacaoPor.id" from="${br.edu.unirn.nds.chamado.acesso.Usuario.list()}" optionKey="id" required="" value="${comentarioChamadoInstance?.ultimaAtualizacaoPor?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${comentarioChamadoInstance}" field="ultimaAtualizacaoPor">
			<span class="help-block error"><g:renderErrors bean="${comentarioChamadoInstance}" field="ultimaAtualizacaoPor" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: comentarioChamadoInstance, field: 'desativadoPor', 'error')} required">
	<label for="desativadoPor" class="col-sm-2 control-label">
		<g:message code="comentarioChamado.desativadoPor.label" default="Desativado Por" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="desativadoPor" name="desativadoPor.id" from="${br.edu.unirn.nds.chamado.acesso.Usuario.list()}" optionKey="id" required="" value="${comentarioChamadoInstance?.desativadoPor?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${comentarioChamadoInstance}" field="desativadoPor">
			<span class="help-block error"><g:renderErrors bean="${comentarioChamadoInstance}" field="desativadoPor" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: comentarioChamadoInstance, field: 'dataDesativacao', 'error')} required">
	<label for="dataDesativacao" class="col-sm-2 control-label">
		<g:message code="comentarioChamado.dataDesativacao.label" default="Data Desativacao" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:datePicker name="dataDesativacao" precision="day"  value="${comentarioChamadoInstance?.dataDesativacao}"  />

		<g:hasErrors bean="${comentarioChamadoInstance}" field="dataDesativacao">
			<span class="help-block error"><g:renderErrors bean="${comentarioChamadoInstance}" field="dataDesativacao" as="list" /></span>
		</g:hasErrors>
	</div>
</div>


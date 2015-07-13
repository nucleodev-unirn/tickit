<%@ page import="br.edu.unirn.nds.chamado.base.CategoriaChamado" %>



<div class="form-group ${hasErrors(bean: categoriaChamadoInstance, field: 'nome', 'error')} required">
	<label for="nome" class="col-sm-2 control-label">
		<g:message code="categoriaChamado.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="nome" required="" value="${categoriaChamadoInstance?.nome}"/>

		<g:hasErrors bean="${categoriaChamadoInstance}" field="nome">
			<span class="help-block error"><g:renderErrors bean="${categoriaChamadoInstance}" field="nome" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: categoriaChamadoInstance, field: 'descricao', 'error')} required">
	<label for="descricao" class="col-sm-2 control-label">
		<g:message code="categoriaChamado.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="descricao" required="" value="${categoriaChamadoInstance?.descricao}"/>

		<g:hasErrors bean="${categoriaChamadoInstance}" field="descricao">
			<span class="help-block error"><g:renderErrors bean="${categoriaChamadoInstance}" field="descricao" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: categoriaChamadoInstance, field: 'ativo', 'error')} ">
	<label for="ativo" class="col-sm-2 control-label">
		<g:message code="categoriaChamado.ativo.label" default="Ativo" />
		
	</label>
	<div class="col-sm-5">
		<g:checkBox name="ativo" value="${categoriaChamadoInstance?.ativo}" />

		<g:hasErrors bean="${categoriaChamadoInstance}" field="ativo">
			<span class="help-block error"><g:renderErrors bean="${categoriaChamadoInstance}" field="ativo" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

		
			<g:hiddenField name="cadastradoPor" value="${session.usuario?.id}"  />
		
<div class="form-group ${hasErrors(bean: categoriaChamadoInstance, field: 'ultimaAtualizacaoPor', 'error')} required">
	<label for="ultimaAtualizacaoPor" class="col-sm-2 control-label">
		<g:message code="categoriaChamado.ultimaAtualizacaoPor.label" default="Ultima Atualizacao Por" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="ultimaAtualizacaoPor" name="ultimaAtualizacaoPor.id" from="${br.edu.unirn.nds.chamado.acesso.Usuario.list()}" optionKey="id" required="" value="${categoriaChamadoInstance?.ultimaAtualizacaoPor?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${categoriaChamadoInstance}" field="ultimaAtualizacaoPor">
			<span class="help-block error"><g:renderErrors bean="${categoriaChamadoInstance}" field="ultimaAtualizacaoPor" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: categoriaChamadoInstance, field: 'desativadoPor', 'error')} required">
	<label for="desativadoPor" class="col-sm-2 control-label">
		<g:message code="categoriaChamado.desativadoPor.label" default="Desativado Por" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="desativadoPor" name="desativadoPor.id" from="${br.edu.unirn.nds.chamado.acesso.Usuario.list()}" optionKey="id" required="" value="${categoriaChamadoInstance?.desativadoPor?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${categoriaChamadoInstance}" field="desativadoPor">
			<span class="help-block error"><g:renderErrors bean="${categoriaChamadoInstance}" field="desativadoPor" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: categoriaChamadoInstance, field: 'dataDesativacao', 'error')} required">
	<label for="dataDesativacao" class="col-sm-2 control-label">
		<g:message code="categoriaChamado.dataDesativacao.label" default="Data Desativacao" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:datePicker name="dataDesativacao" precision="day"  value="${categoriaChamadoInstance?.dataDesativacao}"  />

		<g:hasErrors bean="${categoriaChamadoInstance}" field="dataDesativacao">
			<span class="help-block error"><g:renderErrors bean="${categoriaChamadoInstance}" field="dataDesativacao" as="list" /></span>
		</g:hasErrors>
	</div>
</div>


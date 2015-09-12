<%@ page import="br.edu.unirn.nds.chamado.base.Pessoa" %>



<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'nome', 'error')} required">
	<label for="nome" class="col-sm-2 control-label">
		<g:message code="pessoa.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="nome" required="" value="${pessoaInstance?.nome}"/>

		<g:hasErrors bean="${pessoaInstance}" field="nome">
			<span class="help-block error"><g:renderErrors bean="${pessoaInstance}" field="nome" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'email', 'error')} required">
	<label for="email" class="col-sm-2 control-label">
		<g:message code="pessoa.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="email" required="" value="${pessoaInstance?.email}"/>

		<g:hasErrors bean="${pessoaInstance}" field="email">
			<span class="help-block error"><g:renderErrors bean="${pessoaInstance}" field="email" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'cpfCnpj', 'error')} required">
	<label for="cpfCnpj" class="col-sm-2 control-label">
		<g:message code="pessoa.cpfCnpj.label" default="Cpf Cnpj" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="cpfCnpj" required="" value="${pessoaInstance?.cpfCnpj}"/>

		<g:hasErrors bean="${pessoaInstance}" field="cpfCnpj">
			<span class="help-block error"><g:renderErrors bean="${pessoaInstance}" field="cpfCnpj" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'tipo', 'error')} required">
	<label for="tipo" class="col-sm-2 control-label">
		<g:message code="pessoa.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select class="form-control input-sm" name="tipo" from="${pessoaInstance?.tiposPessoa}" optionKey="key" optionValue="value" noSelection="['':'--- Selecione ---']" required="" value="${pessoaInstance?.tipo}"/>

		<g:hasErrors bean="${pessoaInstance}" field="tipo">
			<span class="help-block error"><g:renderErrors bean="${pessoaInstance}" field="tipo" as="list" /></span>
		</g:hasErrors>
	</div>
</div>


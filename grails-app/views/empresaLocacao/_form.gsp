<%@ page import="br.edu.unirn.nds.chamado.base.EmpresaLocacao" %>



<div class="form-group ${hasErrors(bean: empresaLocacaoInstance, field: 'nome', 'error')} required">
	<label for="nome" class="col-sm-2 control-label">
		<g:message code="empresaLocacao.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="nome" required="" value="${empresaLocacaoInstance?.nome}"/>

		<g:hasErrors bean="${empresaLocacaoInstance}" field="nome">
			<span class="help-block error"><g:renderErrors bean="${empresaLocacaoInstance}" field="nome" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: empresaLocacaoInstance, field: 'razaoSocial', 'error')} ">
	<label for="razaoSocial" class="col-sm-2 control-label">
		<g:message code="empresaLocacao.razaoSocial.label" default="Razao Social" />
		
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="razaoSocial" value="${empresaLocacaoInstance?.razaoSocial}"/>

		<g:hasErrors bean="${empresaLocacaoInstance}" field="razaoSocial">
			<span class="help-block error"><g:renderErrors bean="${empresaLocacaoInstance}" field="razaoSocial" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: empresaLocacaoInstance, field: 'cpfCnpj', 'error')} required">
	<label for="cpfCnpj" class="col-sm-2 control-label">
		<g:message code="empresaLocacao.cpfCnpj.label" default="Cpf Cnpj" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="cpfCnpj" required="" value="${empresaLocacaoInstance?.cpfCnpj}"/>

		<g:hasErrors bean="${empresaLocacaoInstance}" field="cpfCnpj">
			<span class="help-block error"><g:renderErrors bean="${empresaLocacaoInstance}" field="cpfCnpj" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: empresaLocacaoInstance, field: 'responsavelAtendimento', 'error')} required">
	<label for="responsavelAtendimento" class="col-sm-2 control-label">
		<g:message code="empresaLocacao.responsavelAtendimento.label" default="Responsavel Atendimento" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="responsavelAtendimento" required="" value="${empresaLocacaoInstance?.responsavelAtendimento}"/>

		<g:hasErrors bean="${empresaLocacaoInstance}" field="responsavelAtendimento">
			<span class="help-block error"><g:renderErrors bean="${empresaLocacaoInstance}" field="responsavelAtendimento" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: empresaLocacaoInstance, field: 'observacao', 'error')} ">
	<label for="observacao" class="col-sm-2 control-label">
		<g:message code="empresaLocacao.observacao.label" default="Observacao" />
		
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="observacao" value="${empresaLocacaoInstance?.observacao}"/>

		<g:hasErrors bean="${empresaLocacaoInstance}" field="observacao">
			<span class="help-block error"><g:renderErrors bean="${empresaLocacaoInstance}" field="observacao" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: empresaLocacaoInstance, field: 'ativo', 'error')} ">
	<label for="ativo" class="col-sm-2 control-label">
		<g:message code="empresaLocacao.ativo.label" default="Ativo" />
		
	</label>
	<div class="col-sm-5">
		<g:checkBox name="ativo" value="${empresaLocacaoInstance?.ativo}" />

		<g:hasErrors bean="${empresaLocacaoInstance}" field="ativo">
			<span class="help-block error"><g:renderErrors bean="${empresaLocacaoInstance}" field="ativo" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

		
			<g:hiddenField name="cadastradoPor" value="${session.usuario?.id}"  />
		

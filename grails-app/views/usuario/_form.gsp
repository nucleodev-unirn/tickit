<%@ page import="br.edu.unirn.nds.chamado.acesso.Usuario" %>



<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'matricula', 'error')} required">
	<label for="matricula" class="col-sm-2 control-label">
		<g:message code="usuario.matricula.label" default="Matrícula" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="matricula" required="" value="${usuarioInstance?.matricula}"/>

		<g:hasErrors bean="${usuarioInstance}" field="matricula">
			<span class="help-block error"><g:renderErrors bean="${usuarioInstance}" field="matricula" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'senha', 'error')} required">
	<label for="senha" class="col-sm-2 control-label">
		<g:message code="usuario.senha.label" default="Senha" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="senha" required="" value="${usuarioInstance?.senha}"/>

		<g:hasErrors bean="${usuarioInstance}" field="senha">
			<span class="help-block error"><g:renderErrors bean="${usuarioInstance}" field="senha" as="list" /></span>
		</g:hasErrors>
	</div>
</div>

<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'ativo', 'error')} ">
	<label for="ativo" class="col-sm-2 control-label">
		<g:message code="usuario.ativo.label" default="Ativo" />
		
	</label>
	<div class="col-sm-5">
		<g:checkBox name="ativo" value="${usuarioInstance?.ativo}" />

		<g:hasErrors bean="${usuarioInstance}" field="ativo">
			<span class="help-block error"><g:renderErrors bean="${usuarioInstance}" field="ativo" as="list" /></span>
		</g:hasErrors>
	</div>
</div>


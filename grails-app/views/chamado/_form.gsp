<%@ page import="br.edu.unirn.nds.chamado.problema.Problema; br.edu.unirn.nds.chamado.base.CategoriaChamado; br.edu.unirn.nds.chamado.base.Chamado" %>


<div class="col-lg-12 well">

	<div class="col-lg-2">
		<h4> <em> Dados do Usuário </em> </h4>
	</div>

	<div class="col-lg-10">
		<div class="form-group required">
			<label for="nomeSolicitante" class="col-sm-2 control-label">
				<g:message code="chamado.matricula.label" default="Matrícula/Login" />
				<span class="required-indicator">*</span>
			</label>
			<div class="col-sm-5">
				<p class="form-control-static"> ${session?.usuario} </p>
				<g:hasErrors bean="${chamadoInstance}" field="nomeSolicitante">
					<span class="help-block error"><g:renderErrors bean="${chamadoInstance}" field="nomeSolicitante" as="list" /></span>
				</g:hasErrors>
			</div>

			<span class="btn btn-primary btn-sm" data-toggle="tooltip" title="Setor que será vinculado ao chamado"> <i class="fa fa-question"></i> </span>
		</div>

		<div class="form-group ${hasErrors(bean: chamadoInstance, field: 'nomeSolicitante', 'has-error')} required">
			<label for="nomeSolicitante" class="col-sm-2 control-label">
				<g:message code="chamado.nomeSolicitante.label" default="Nome Solicitante" />
				<span class="required-indicator">*</span>
			</label>
			<div class="col-sm-5">
				<g:textField class="form-control input-sm" name="nomeSolicitante" required="" value="${chamadoInstance?.nomeSolicitante}"/>

				<g:hasErrors bean="${chamadoInstance}" field="nomeSolicitante">
					<span class="help-block error"><g:renderErrors bean="${chamadoInstance}" field="nomeSolicitante" as="list" /></span>
				</g:hasErrors>
			</div>

			<span class="btn btn-primary btn-sm" data-toggle="tooltip" title="Setor que será vinculado ao chamado"> <i class="fa fa-question"></i> </span>
		</div>

		<div class="form-group ${hasErrors(bean: chamadoInstance, field: 'emailSolicitante', 'has-error')} required">
			<label for="emailSolicitante" class="col-sm-2 control-label">
				<g:message code="chamado.emailSolicitante.label" default="Email Solicitante" />
				<span class="required-indicator">*</span>
			</label>
			<div class="col-sm-5">
				<g:textField class="form-control input-sm" name="emailSolicitante" required="" value="${chamadoInstance?.emailSolicitante}"/>

				<g:hasErrors bean="${chamadoInstance}" field="emailSolicitante">
					<span class="help-block error"><g:renderErrors bean="${chamadoInstance}" field="emailSolicitante" as="list" /></span>
				</g:hasErrors>
			</div>

			<span class="btn btn-primary btn-sm" data-toggle="tooltip" title="Setor que será vinculado ao chamado"> <i class="fa fa-question"></i> </span>
		</div>

		<div class="form-group ${hasErrors(bean: chamadoInstance, field: 'setorSolicitante', 'has-error')} required">
			<label for="setorSolicitante" class="col-sm-2 control-label">
				<g:message code="chamado.setorSolicitante.label" default="Setor Solicitante"/>
				<span class="required-indicator" data-toggle="tooltip" title="Campo Obrigatório">*</span>
			</label>
			<div class="col-sm-5">
				<g:select id="setorSolicitante" name="setorSolicitante.id" from="${br.edu.unirn.nds.chamado.base.Setor.list()}" optionKey="id" required="" value="${chamadoInstance?.setorSolicitante?.id}" class="many-to-one form-control input-sm"/>

				<g:hasErrors bean="${chamadoInstance}" field="setorSolicitante">
					<span class="help-block error"><g:renderErrors bean="${chamadoInstance}" field="setorSolicitante" as="list" /></span>
				</g:hasErrors>
			</div>

			<span class="btn btn-primary btn-sm" data-toggle="tooltip" title="Setor que será vinculado ao chamado"> <i class="fa fa-question"></i> </span>
		</div>
	</div>

</div>


%{--<div class="col-lg-12 well">
	<div class="col-lg-2">
		<h4> <em> Dados do Equipamento </em> </h4>
	</div>
	<div class="col-lg-10">
		<div class="form-group required">
			<label for="equipamento" class="col-sm-2 control-label">
				<g:message code="chamado.equipamento.label" default="Equipamento" />
				<span class="required-indicator">*</span>
			</label>
			<div class="col-sm-5">
				<g:textField class="form-control input-sm" name="equipamento" required="" value="${params?.equipamento}dadasd"/>
			</div>

			<span class="btn btn-primary btn-sm" data-toggle="tooltip" title="Setor que será vinculado ao chamado"> <i class="fa fa-question"></i> </span>
		</div>

		<div class="form-group required">
			<label for="tombamento" class="col-sm-2 control-label">
				<g:message code="chamado.tombamento.label" default="Tombamento" />
				<span class="required-indicator">*</span>
			</label>
			<div class="col-sm-5">
				<g:textField class="form-control input-sm" name="tombamento" required="" value="${params?.tombamento}"/>
			</div>

			<span class="btn btn-primary btn-sm" data-toggle="tooltip" title="Setor que será vinculado ao chamado"> <i class="fa fa-question"></i> </span>
		</div>

		<div class="form-group required">
			<label for="setor" class="col-sm-2 control-label">
				<g:message code="chamado.setor.label" default="Setor do Equipamento" />
				<span class="required-indicator">*</span>
			</label>
			<div class="col-sm-5">
				<g:textField class="form-control input-sm" name="setor" required="" value="${params?.setor}"/>
			</div>

			<span class="btn btn-primary btn-sm" data-toggle="tooltip" title="Setor que será vinculado ao chamado"> <i class="fa fa-question"></i> </span>
		</div>
	</div>

</div>
--}%

<div class="col-lg-12 well">
	<div class="col-lg-2">
		<h4> <em> Dados do Chamado </em> </h4>
	</div>
	<div class="col-lg-10">
		<div class="form-group ${hasErrors(bean: chamadoInstance, field: 'titulo', 'has-error')} required">
			<label for="titulo" class="col-sm-2 control-label">
				<g:message code="chamado.titulo.label" default="Titulo" />
				<span class="required-indicator">*</span>
			</label>
			<div class="col-sm-5">
				<g:textField class="form-control input-sm" name="titulo" required="" value="${chamadoInstance?.titulo}"/>

				<g:hasErrors bean="${chamadoInstance}" field="titulo">
					<span class="help-block error"><g:renderErrors bean="${chamadoInstance}" field="titulo" as="list" /></span>
				</g:hasErrors>
			</div>

			<span class="btn btn-primary btn-sm" data-toggle="tooltip" title="Setor que será vinculado ao chamado"> <i class="fa fa-question"></i> </span>
		</div>

		<div class="form-group ${hasErrors(bean: chamadoInstance, field: 'categoriaChamado', 'has-error')} required">
			<label for="categoriaChamado" class="col-sm-2 control-label">
				<g:message code="chamado.categoriaChamado.label" default="Categoria Chamado" />
				<span class="required-indicator">*</span>
			</label>
			<div class="col-sm-5">
				<g:select id="categoriaChamado" name="categoriaChamado.id" from="${br.edu.unirn.nds.chamado.base.CategoriaChamado.list()}" optionKey="id" required="" value="${chamadoInstance?.categoriaChamado?.id}" class="many-to-one form-control input-sm"/>

				<g:hasErrors bean="${chamadoInstance}" field="categoriaChamado">
					<span class="help-block error"><g:renderErrors bean="${chamadoInstance}" field="categoriaChamado" as="list" /></span>
				</g:hasErrors>
			</div>

			<span class="btn btn-primary btn-sm" data-toggle="tooltip" title="Setor que será vinculado ao chamado"> <i class="fa fa-question"></i> </span>
		</div>

		<div class="form-group required">
			<label for="problema" class="col-sm-2 control-label">
				<g:message code="chamado.categoriaChamado.label" default="Sistomas" />
				<span class="required-indicator">*</span>
			</label>
			<div class="col-sm-5">
				<g:select id="problema" name="problema.id" from="${br.edu.unirn.nds.chamado.problema.Problema.list()}" optionKey="id" required="" value="${chamadoInstance?.problema?.id}" class="many-to-one form-control input-sm"/>

				<g:hasErrors bean="${chamadoInstance}" field="categoriaChamado">
					<span class="help-block error"><g:renderErrors bean="${chamadoInstance}" field="categoriaChamado" as="list" /></span>
				</g:hasErrors>
			</div>

			<span class="btn btn-primary btn-sm" data-toggle="tooltip" title="Setor que será vinculado ao chamado"> <i class="fa fa-question"></i> </span>
		</div>

		<div class="form-group ${hasErrors(bean: chamadoInstance, field: 'tags', 'has-error')} required">
			<label for="tags" class="col-sm-2 control-label">
				<g:message code="chamado.tags.label" default="Tags" />
				<span class="required-indicator">*</span>
			</label>
			<div class="col-sm-5">
				<g:textField class="form-control input-sm" name="tags" required="" value="${chamadoInstance?.tags}"/>

				<g:hasErrors bean="${chamadoInstance}" field="tags">
					<span class="help-block error"><g:renderErrors bean="${chamadoInstance}" field="tags" as="list" /></span>
				</g:hasErrors>
			</div>

			<span class="btn btn-primary btn-sm" data-toggle="tooltip" title="Setor que será vinculado ao chamado"> <i class="fa fa-question"></i> </span>
		</div>

		<div class="form-group ${hasErrors(bean: chamadoInstance, field: 'descricao', 'has-error')} required">
			<label for="descricao" class="col-sm-2 control-label">
				<g:message code="chamado.descricao.label" default="Descricao" />
				<span class="required-indicator">*</span>
			</label>
			<div class="col-sm-5">
				<g:textArea class="form-control input-sm" name="descricao" required="" value="${chamadoInstance?.descricao}"/>

				<g:hasErrors bean="${chamadoInstance}" field="descricao">
					<span class="help-block error"><g:renderErrors bean="${chamadoInstance}" field="descricao" as="list" /></span>
				</g:hasErrors>
			</div>

			<span class="btn btn-primary btn-sm" data-toggle="tooltip" title="Setor que será vinculado ao chamado"> <i class="fa fa-question"></i> </span>
		</div>
	</div>

</div>



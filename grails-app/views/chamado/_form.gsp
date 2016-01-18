<%@ page import="br.edu.unirn.nds.chamado.problema.Problema; br.edu.unirn.nds.chamado.base.CategoriaChamado; br.edu.unirn.nds.chamado.base.Chamado" %>


<div class="col-lg-12 well">

	<div class="col-lg-2">
		<h4> <em> Dados do Usuário </em> </h4>
	</div>

	<div class="col-lg-10">
		<div class="form-group required">
			<label for="nomeSolicitante" class="col-sm-2 control-label">
				<g:message code="chamado.matricula.label" default="Matrícula" />
				<span class="required-indicator">*</span>
			</label>
			<div class="col-sm-5">
				<p class="form-control-static"> ${session?.usuario} (matricula tal..) </p>
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


<div class="col-lg-12 well">
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
				<g:textField class="form-control input-sm" name="equipamento" required="" value="${params?.equipamento}"/>

				%{--<g:hasErrors bean="${chamadoInstance}" field="equipamento">
                    <span class="help-block error"><g:renderErrors bean="${chamadoInstance}" field="equipamento" as="list" /></span>
                </g:hasErrors>--}%
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

				%{--<g:hasErrors bean="${chamadoInstance}" field="tombamento">
                    <span class="help-block error"><g:renderErrors bean="${chamadoInstance}" field="tombamento" as="list" /></span>
                </g:hasErrors>--}%
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

				%{--<g:hasErrors bean="${chamadoInstance}" field="setor">
                    <span class="help-block error"><g:renderErrors bean="${chamadoInstance}" field="setor" as="list" /></span>
                </g:hasErrors>--}%
			</div>

			<span class="btn btn-primary btn-sm" data-toggle="tooltip" title="Setor que será vinculado ao chamado"> <i class="fa fa-question"></i> </span>
		</div>
	</div>

</div>


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



%{--
<div class="form-group ${hasErrors(bean: chamadoInstance, field: 'avaliacao', 'has-error')} required">
	<label for="avaliacao" class="col-sm-2 control-label">
		<g:message code="chamado.avaliacao.label" default="Avaliacao" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:textField class="form-control input-sm" name="avaliacao" required="" value="${chamadoInstance?.avaliacao}"/>

		<g:hasErrors bean="${chamadoInstance}" field="avaliacao">
			<span class="help-block error"><g:renderErrors bean="${chamadoInstance}" field="avaliacao" as="list" /></span>
		</g:hasErrors>
	</div>

	<span class="btn btn-primary btn-sm" data-toggle="tooltip" title="Setor que será vinculado ao chamado"> <i class="fa fa-question"></i> </span>
</div>

<div class="form-group ${hasErrors(bean: chamadoInstance, field: 'ativo', 'has-error')} ">
	<label for="ativo" class="col-sm-2 control-label">
		<g:message code="chamado.ativo.label" default="Ativo" />
		
	</label>
	<div class="col-sm-5">
		<g:checkBox name="ativo" value="${chamadoInstance?.ativo}" />

		<g:hasErrors bean="${chamadoInstance}" field="ativo">
			<span class="help-block error"><g:renderErrors bean="${chamadoInstance}" field="ativo" as="list" /></span>
		</g:hasErrors>
	</div>

	<span class="btn btn-primary btn-sm" data-toggle="tooltip" title="Setor que será vinculado ao chamado"> <i class="fa fa-question"></i> </span>
</div>

		
			<g:hiddenField name="cadastradoPor" value="${session.usuario?.id}"  />
		
<div class="form-group ${hasErrors(bean: chamadoInstance, field: 'ultimaAtualizacaoPor', 'has-error')} required">
	<label for="ultimaAtualizacaoPor" class="col-sm-2 control-label">
		<g:message code="chamado.ultimaAtualizacaoPor.label" default="Ultima Atualizacao Por" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="ultimaAtualizacaoPor" name="ultimaAtualizacaoPor.id" from="${br.edu.unirn.nds.chamado.acesso.Usuario.list()}" optionKey="id" required="" value="${chamadoInstance?.ultimaAtualizacaoPor?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${chamadoInstance}" field="ultimaAtualizacaoPor">
			<span class="help-block error"><g:renderErrors bean="${chamadoInstance}" field="ultimaAtualizacaoPor" as="list" /></span>
		</g:hasErrors>
	</div>

	<span class="btn btn-primary btn-sm" data-toggle="tooltip" title="Setor que será vinculado ao chamado"> <i class="fa fa-question"></i> </span>
</div>

<div class="form-group ${hasErrors(bean: chamadoInstance, field: 'desativadoPor', 'has-error')} required">
	<label for="desativadoPor" class="col-sm-2 control-label">
		<g:message code="chamado.desativadoPor.label" default="Desativado Por" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:select id="desativadoPor" name="desativadoPor.id" from="${br.edu.unirn.nds.chamado.acesso.Usuario.list()}" optionKey="id" required="" value="${chamadoInstance?.desativadoPor?.id}" class="many-to-one form-control input-sm"/>

		<g:hasErrors bean="${chamadoInstance}" field="desativadoPor">
			<span class="help-block error"><g:renderErrors bean="${chamadoInstance}" field="desativadoPor" as="list" /></span>
		</g:hasErrors>
	</div>

	<span class="btn btn-primary btn-sm" data-toggle="tooltip" title="Setor que será vinculado ao chamado"> <i class="fa fa-question"></i> </span>
</div>

<div class="form-group ${hasErrors(bean: chamadoInstance, field: 'dataDesativacao', 'has-error')} required">
	<label for="dataDesativacao" class="col-sm-2 control-label">
		<g:message code="chamado.dataDesativacao.label" default="Data Desativacao" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-5">
		<g:datePicker name="dataDesativacao" precision="day"  value="${chamadoInstance?.dataDesativacao}"  />

		<g:hasErrors bean="${chamadoInstance}" field="dataDesativacao">
			<span class="help-block error"><g:renderErrors bean="${chamadoInstance}" field="dataDesativacao" as="list" /></span>
		</g:hasErrors>
	</div>

	<span class="btn btn-primary btn-sm" data-toggle="tooltip" title="Setor que será vinculado ao chamado"> <i class="fa fa-question"></i> </span>
</div>
--}%


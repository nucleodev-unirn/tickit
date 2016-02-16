<%@ page import="br.edu.unirn.nds.chamado.base.CategoriaChamado; br.edu.unirn.nds.chamado.equipamentos.Equipamento; br.edu.unirn.nds.chamado.base.Setor; br.edu.unirn.nds.chamado.equipamentos.TipoEquipamento; br.edu.unirn.nds.chamado.base.EmpresaLocacao; br.edu.unirn.nds.chamado.base.Setor; br.edu.unirn.nds.chamado.equipamentos.Equipamento; br.edu.unirn.nds.chamado.base.CategoriaChamado; java.lang.Boolean" %>

<div class="row">
    <div class="col-sm-3">
        <div class="form-group">
            <label class="control-label" for="dataInicio">Data início do Chamado:</label>
            <g:datePicker class="date-picker" name="dataInicio" precision="day" value="${params?.dataInicio}"/>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="form-group">
            <label class="control-label" for="dataFim">Data Fim do Chamado:</label>
            <g:datePicker class="date-picker" name="dataFim" precision="day" value="${params?.dataFim}"/>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="form-group">
            <label class="control-label" for="setorSolicitante">Setor Solicitante:</label>
            <g:select name="setorSolicitante" class="form-control input-sm" noSelection="${['':'-- Selecione --']}" value="${params?.setorSolicitante}"
                      from="${Setor.findAllByAtivo(true, [sort:"nome", order:"asc"])}" optionKey="id" optionValue="nome"/>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="form-group">
            <label class="control-label" for="cadastradoPor">Cadastrado por:</label>
            <g:textField name="cadastradoPor" class="form-control input-sm" value="${params?.cadastradoPor}"/>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="form-group">
            <label class="control-label" for="equipamento">Equipamento:</label>
            <g:select name="equipamento" class="form-control input-sm" noSelection="${['':'-- Selecione --']}" value="${params?.equipamento}"
                      from="${Equipamento.findAllByAtivo(true, [sort:"nome", order:"asc"])}" optionKey="id" optionValue="nome"/>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="form-group">
            <label class="control-label" for="tipoEquipamento">Tipo Equipamento:</label>
            <g:select name="tipoEquipamento" class="form-control input-sm" noSelection="${['':'-- Selecione --']}" value="${params?.tipoEquipamento}"
                      from="${TipoEquipamento.findAllByAtivo(true, [sort:"nome", order:"asc"])}" optionKey="id" optionValue="nome"/>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="form-group">
            <label class="control-label" for="categoriaChamado">Categoria Chamado:</label>
            <g:select name="categoriaChamado" class="form-control input-sm" noSelection="${['':'-- Selecione --']}" value="${params?.categoriaChamado}"
                      from="${CategoriaChamado.findAllByAtivo(true, [sort:"nome", order:"asc"])}" optionKey="id" optionValue="nome"/>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="form-group">
            <label class="control-label" for="statusChamado">Status Chamado:</label>
                <div class='checkbox'>
                    <label>
                        <g:if test="${params?.ativo}">
                            <g:radio checked="true" name="statusChamado" value="true" />Ativo
                        </g:if>
                        <g:else>
                            <g:radio name="statusChamado" value="true" />Ativo
                        </g:else>
                    </label>
                </div>
                <div class='checkbox'>
                    <label>
                        <g:if test="${params?.ativo || params?.ativo == Boolean.FALSE}">
                            <g:radio name="statusChamado" value="false" />Desativado
                        </g:if>
                        <g:else>
                            <g:radio checked="true" name="statusChamado" value="false" />Desativado
                        </g:else>
                    </label>
                </div>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="form-group">
            <label class="control-label" for="equipamento">Equipamentos Locados:</label>
            <g:select name="equipamento" class="form-control input-sm" noSelection="${['':'-- Selecione --']}" value="${params?.equipamento}"
                      from="${Equipamento.findAllByAtivoAndLocado(true,true, [sort:"nome", order:"asc"])}" optionKey="id" optionValue="nome"/>
        </div>
    </div>
    %{--<div class="col-sm-3">
        <div class="form-group">
            <label class="control-label" for="cadastradorPor">Responsável:</label>
            <g:textField name="cadastradorPor" class="form-control input-sm" value="${params?.cadastradorPor}"/>
        </div>
    </div>--}%
    <div class="col-sm-2 padding-top-20">
        <button type="submit" class="btn btn-block btn-primary"><i class="fa fa-search"></i> Pesquisar</button>
    </div>
</div>

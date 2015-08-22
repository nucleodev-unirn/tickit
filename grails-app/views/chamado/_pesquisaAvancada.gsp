<g:form name="pesquisaChamadoForm" action="${action?:'index'}" class="${!well?'':'well well-sm'}">
    <div class="row">
        <div class="col-sm-3">
            <div class="form-group">
                <label class="control-label" for="q.setorSolicitante">Setor Solicitante</label>
                <g:textField name="q.setorSolicitante" class="form-control input-sm" value="${q?.setorSolicitante}"/>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="form-group">
                <label class="control-label" for="q.equipamento">Equipamento</label>
                <g:textField name="q.equipamento" class="form-control input-sm" value="${q?.equipamento}"/>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="form-group">
                <label class="control-label" for="q.tipoEquipamento">Tipo Equipamento</label>
                <g:select name="q.tipoEquipamento" class="form-control input-sm" noSelection="${['':'-- Selecione --']}" value="${q?.tipoEquipamento}"
                          from="${br.edu.unirn.nds.chamado.equipamentos.TipoEquipamento.findAllByAtivo(true)}" optionKey="id" optionValue="nome"/>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="form-group">
                <label class="control-label" for="q.empresaLocacao">Emp. Loca&ccedil;&atilde;o</label>
                <g:select name="q.empresaLocacao" class="form-control input-sm" noSelection="${['':'-- Selecione --']}" value="${q?.empresaLocacao}"
                          from="${br.edu.unirn.nds.chamado.base.EmpresaLocacao.findAllByAtivo(true)}" optionKey="id" optionValue="nome"/>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="form-group">
                <div class="checkbox padding-top-20">
                    <label>
                        <g:checkBox name="q.locado" value="${q?.locado}"/> Equip. Locado?
                    </label>
                </div>
            </div>
        </div>
        <div class="col-sm-2 padding-top-20">
            <button type="submit" class="btn btn-block btn-primary"><i class="fa fa-search"></i> Pesquisar</button>
        </div>
    </div>
</g:form>
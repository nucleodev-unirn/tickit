<div class="modal fade" id="modalAlterarStatusEquipamento">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Alterar Status Equipamento - <span id="equipamento-nome"></span></h4>
            </div>
            <g:form name="alterarStatusEquipamentoForm" controller="equipamento" action="alterarStatus" class="form-horizontal">
                <g:hiddenField name="equipamento"/>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="statusAnterior" class="col-sm-3 control-label">Status Anterior</label>
                        <div class="col-sm-7">
                            <g:textField name="statusAnterior" disabled="disabled" value="" class="form-control input-sm"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="statusEquipamento" class="col-sm-3 control-label">Novo Status *</label>
                        <div class="col-sm-7">
                            <g:select name="statusEquipamento" class="form-control input-sm" from="${br.edu.unirn.nds.chamado.equipamentos.StatusEquipamento.findAllByAtivo(true)}"
                                      optionValue="nome" optionKey="id"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="observacao" class="col-sm-3 control-label">Observa&ccedil;&atilde;o *</label>
                        <div class="col-sm-7">
                            <g:textArea name="observacao" class="form-control input-sm" rows="4"/>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Fechar</button>
                    <button type="submit" class="btn btn-success pull-right"><i class="fa fa-edit"></i> Alterar</button>
                </div>
            </g:form>
        </div>
    </div>
</div>
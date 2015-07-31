<%@ page import="br.edu.unirn.nds.chamado.base.Setor" %>
<div class="modal fade" id="modalAlterarSetorEquipamento">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Alterar Setor Equipamento - <span id="equipamento-nome"></span></h4>
            </div>
            <g:form name="alterarSetorEquipamentoForm" controller="equipamento" action="alterarSetor" class="form-horizontal">
                <g:hiddenField name="equipamento"/>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="setorAnterior" class="col-sm-3 control-label">Setor Anterior</label>
                        <div class="col-sm-7">
                            <g:textField name="setorAnterior" disabled="disabled" value="" class="form-control input-sm"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="setor" class="col-sm-3 control-label">Novo Setor *</label>
                        <div class="col-sm-7">
                            <g:select name="setor" class="form-control input-sm" from="${br.edu.unirn.nds.chamado.base.Setor.findAllByAtivo(true)}"
                                      optionValue="nome" optionKey="id"/>
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
<div class="modal fade" id="modalInfoEquipamento">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Informa&ccedil;&otilde;es do Equipamento - <span id="equipamento-nome"></span></h4>
            </div>
            <div class="modal-body">
                <div class="nav-tabs-custom modal-tabs">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tabHistStatus" data-toggle="tab">Hist. de Status</a></li>
                        <li><a href="#tabHistSetor" data-toggle="tab">Hist. de Setor</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active scroller-table-250" id="tabHistStatus">
                            <table class="table table-bordered table-condensed">
                                <thead>
                                    <tr>
                                        <th>Status</th>
                                        <th>Observa&ccedil;&atilde;o</th>
                                        <th class="text-center">Cadastrado Por</th>
                                        <th class="text-center">Criado em</th>
                                    </tr>
                                </thead>
                                <tbody id="tabelaHistStatus"></tbody>
                            </table>
                        </div><!-- /.tab-pane -->
                        <div class="tab-pane  scroller-table-250" id="tabHistSetor">
                            <table class="table table-bordered table-condensed">
                                <thead>
                                <tr>
                                    <th>Setor</th>
                                    <th class="text-center">Cadastrado Por</th>
                                    <th class="text-center">Criado em</th>
                                </tr>
                                </thead>
                                <tbody id="tabelaHistSetor"></tbody>
                            </table>
                        </div><!-- /.tab-pane -->
                    </div><!-- /.tab-content -->
                </div>
            </div>
            <div class="modal-footer">
                <div class="pull-left">Chamados: <span data-toggle="tooltip" title="" class="badge bg-light-blue" data-original-title="Total de Chamados" id="qntChamados"></span></div>
                <button type="button" class="btn btn-default pull-right" data-dismiss="modal">Fechar</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modalLoginSuporteId">
    <div class="modal-dialog ">
        <div class="modal-content">
            <g:form name="loginSuporteForm" controller="autenticacao" action="login" class="form-horizontal">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    %{--<div class="login-logo">--}%
                        <h4 class="modal-title"> Login de Suporte <a href="javascript:void(0);"><b>Tick</b>IT</a> </h4>
                    %{--</div>--}%
                </div>
                <div class="modal-body">
                    <div class="login-box">
                        <div class="login-box-body">
                            <h4 class="login-box-msg">Pessoal Interno</h4>
                            <g:if test="${flash.error}">
                                <div class="alert alert-warning alert-dismissable">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    ${flash.error}
                                </div>
                            </g:if>
                            <div class="form-group has-feedback">
                                <g:textField name="matricula" class="form-control" placeholder="Matrícula" value="${grails.util.Environment.DEVELOPMENT?'admin':''}"/>
                                <span class="glyphicon glyphicon-user form-control-feedback"></span>
                            </div>
                            <div class="form-group has-feedback">
                                <g:passwordField name="senha" class="form-control" placeholder="Senha" value="${grails.util.Environment.DEVELOPMENT?'admin':''}"/>
                                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Fechar</button>
                    <button type="submit" class="btn btn-danger pull-right"><i class="fa fa-user"></i> Entrar </button>
                </div>
            </g:form>
        </div>
    </div>
</div>

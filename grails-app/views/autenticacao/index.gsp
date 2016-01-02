<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="mainAut"/>
    <title>TickIT</title>
</head>
<body>
<div class="row">

    <div class="col-lg-12">
        <div class="login-box">
            <div class="login-logo">
                <a href="javascript:void(0);"><b>Tick</b>IT</a>
            </div>
            <div class="login-box-body">
                <h4 class="login-box-msg">Área Pública</h4>
                <g:if test="${flash.resposta}">
                    <div class="alert alert-warning alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        ${flash.resposta}
                    </div>
                </g:if>
                <g:form action="loginPublico">
                    <div class="form-group has-feedback">
                        <g:textField name="matriculaPublica" class="form-control" placeholder="Matrícula" value="${grails.util.Environment.DEVELOPMENT?'publico':''}"/>
                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <button type="submit" class="btn btn-primary btn-block btn-flat">Entrar</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 text-right">
                            <br/>
                            <a href="#modalLoginSuporteId" data-toggle="modal" > Suporte </a>
                        </div>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>


<g:render template="modalLoginSuporte"/>


</body>
</html>
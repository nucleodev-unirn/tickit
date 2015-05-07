<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="mainAut"/>
    <title>TickIT</title>
</head>
<body>
    <div class="login-box">
        <div class="login-logo">
            <a href="javascript:void(0);"><b>Tick</b>IT</a>
        </div>
        <div class="login-box-body">
            <p class="login-box-msg">Autentique-se</p>
            <g:if test="${flash.error}">
                <div class="alert alert-warning alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    ${flash.error}
                </div>
            </g:if>
            <g:form action="login">
                <div class="form-group has-feedback">
                    <g:textField name="login" class="form-control" placeholder="Login" value="${grails.util.Environment.DEVELOPMENT?'admin':''}"/>
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <g:passwordField name="senha" class="form-control" placeholder="Senha" value="${grails.util.Environment.DEVELOPMENT?'admin':''}"/>
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <button type="submit" class="btn btn-primary btn-block btn-flat">Entrar</button>
                    </div>
                </div>
            </g:form>
        </div>
    </div>
</body>
</html>
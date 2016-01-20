<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>TickIT</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    %{--<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">--}%
    <g:javascript>
        window.baseUrl = "${createLink(uri: '/', absolute: true)}"
    </g:javascript>
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <g:layoutHead/>

    <style>
        body { padding-top: 50px; }
    </style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    %{--<nav class="navbar navbar-inverse navbar-static-top">--}%
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <g:link controller="index" action="index" class="navbar-brand">Tick<b>IT</b></g:link>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li> <g:link controller="index" action="index2" class="">Área Pública</g:link> </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li> <g:link controller="index" action="testMail"> Teste Mail </g:link> </li>
                <li> <a href="#"> Fale Conosco </a> </li>
                <g:if test="${session?.usuario}">
                    <li> <g:link controller="autenticacao" action="logout" > Logout: ${session?.usuario} </g:link> </li>
                </g:if>
                <g:else>
                    <li> <g:link controller="autenticacao" action="index" > Login </g:link> </li>
                </g:else>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> Opções <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li> <g:link controller="autenticacao" action="index" > Login </g:link> </li>
                    </ul>
                </li>
            </ul>

        </div>

    </div>
</nav>

%{--<div class="content-wrapper">--}%
    <g:layoutBody/>
%{--</div>--}%

<!-- FOOTER -->
<footer class="text-center" >
    <div class=" hidden-xs">
        <p > <strong><a href="javascript:;" class="btn btn-xs btn-primary tickit-btn-scrolltop"> Topo da Página <i class="fa fa-level-up"></i> </a> </strong> </p>
        <p>
            <strong>&copy; 2015 <a href="javascript:void(0);">NDS-UNIRN</a>.</strong> <br/>
            <b>Version</b> <g:meta name="app.version"/>
        </p>
    </div>
</footer>

</body>
</html>

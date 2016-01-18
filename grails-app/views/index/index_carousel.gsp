<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="layout" content="mainPublic"/>
  <title>TickIT - Carousel</title>
  %{--<asset:stylesheet src="application.css"/>--}%
  %{--<asset:javascript src="application.js"/>--}%
  <style>
    body { padding-top: 50px; }
  </style>
</head>
<body>

  <!-- Carousel    ================================================== -->
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <asset:image src="samples/slide-abrirChamado.png" class="first-slide" alt="Abrir Chamado"/>
        <div class="container">
          <div class="carousel-caption">
            %{--<h1>Abrir Chamado</h1>--}%
          </div>
        </div>
      </div>
      <div class="item">
        <asset:image src="samples/slide-visualizarChamado.png" class="first-slide" alt="Visualizar Chamados"/>
        <div class="container">
          <div class="carousel-caption">
            %{--<h1>Visualizar Chamados</h1>--}%
          </div>
        </div>
      </div>
      <div class="item">
        <asset:image src="samples/slide-faleConosco.png" class="first-slide" alt="Fale Conosco"/>
        <div class="container">
          <div class="carousel-caption">
            %{--<h1>Fale Conosco</h1>--}%
          </div>
        </div>
      </div>
      <div class="item">
        <asset:image src="samples/slide-tutorial.png" class="first-slide" alt="Tutorial"/>
        <div class="container">
          <div class="carousel-caption">
            %{--<h1>Tutorial</h1>--}%
          </div>
        </div>
      </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div><!-- /.carousel -->


<!-- Marketing messaging and featurettes
    ================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->

<div class="container marketing">

  <!-- Three columns of text below the carousel -->
  <div class="row tickit-box">
    <div class="col-lg-6 tickit-bg-color-dark2">
      <g:link controller="autenticacao" action="index" params="[cmd:'open']">
        <h2>
          <asset:image src="samples/abrirChamadoBranco.png" class="" width="140" height="140"/>
          <span class="tickit-box-text"> ABRIR CHAMADO </span>
        </h2>
      </g:link>
    </div><!-- /.col-lg-6 -->

    <div class="col-lg-6 tickit-bg-color-dark3">
      <g:link controller="autenticacao" action="index" params="[cmd:'view']">
        <h2>
          <asset:image src="samples/visualizarChamadoBranco.png" class="" width="140" height="140"/>
          <span class="tickit-box-text"> VISUALIZAR CHAMADO </span>
        </h2>
      </g:link>
    </div><!-- /.col-lg-6 -->

    <div class="col-lg-6 tickit-bg-color-dark3">
      <g:link controller="autenticacao" action="index" params="[cmd:'tutorial']">
        <h2>
          <asset:image src="samples/tutorialBranco.png" class="tickit-img" width="140" height="140"/>
          <span class="tickit-box-text"> TUTORIAL </span>
        </h2>
      </g:link>
    </div><!-- /.col-lg-6 -->

    <div class="col-lg-6 tickit-bg-color-dark2">
      <g:link controller="autenticacao" action="index" params="[cmd:'tutorial']">
        <h2>
          <asset:image src="samples/unirnBranco.png" class="tickit-img" width="140" height="140"/>
          <span class="tickit-box-text">  CENTRO UNIVERSITÁRIO  </span>
        </h2>
      </g:link>
    </div><!-- /.col-lg-6 -->

  </div><!-- /.row -->


<!-- START THE FEATURETTES -->
  <hr class="featurette-divider">

</div><!-- /.container -->

</body>
</html>

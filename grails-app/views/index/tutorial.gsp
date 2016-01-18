<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="layout" content="mainPublic"/>
  <title>TickIT - Carousel</title>
</head>
<body>

  <!-- Carousel    ================================================== -->
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      %{--<li data-target="#myCarousel" data-slide-to="0" class="active"></li>--}%
      %{--<li data-target="#myCarousel" data-slide-to="1"></li>--}%
      <li data-target="#myCarousel" data-slide-to="0"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
      %{--<div class="item active">
        <asset:image src="samples/slide-abrirChamado.png" class="first-slide" alt="Abrir Chamado"/>
        <div class="container">
          <div class="carousel-caption">
            --}%%{--<h1>Abrir Chamado</h1>--}%%{--
          </div>
        </div>
      </div>--}%
      %{--<div class="item">
        <asset:image src="samples/slide-visualizarChamado.png" class="first-slide" alt="Visualizar Chamados"/>
        <div class="container">
          <div class="carousel-caption">
            --}%%{--<h1>Visualizar Chamados</h1>--}%%{--
          </div>
        </div>
      </div>--}%
      <div class="item">
        <asset:image src="samples/slide-faleConosco.png" class="first-slide" alt="Fale Conosco"/>
        <div class="container">
          <div class="carousel-caption">
            <h1>Fale Conosco</h1>
          </div>
        </div>
      </div>
      <div class="item active">
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

  <div class="row">
    <div class="col-lg-12">
      <g:if test="${flash.resposta}">
        <div class="alert alert-warning alert-dismissable">
          <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          ${flash.resposta}
        </div>
      </g:if>
    </div>
  </div>

  <!-- Three columns of text below the carousel -->
  <div class="row tickit-box">

  </div><!-- /.row -->


<!-- START THE FEATURETTES -->
  <hr class="featurette-divider">

</div><!-- /.container -->

</body>
</html>

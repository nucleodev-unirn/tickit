<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="layout" content="mainPublic"/>
  <title>TickIT - Carousel</title>
</head>
<body>


<!-- Marketing messaging and featurettes
    ================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->

<!-- START THE FEATURETTES -->
  <hr class="">

<div class="container marketing">


		<div class="">

			<div class="row">
				<g:if test="${flash.resposta}">
					<div class="col-lg-12">
						<div class="alert alert-warning alert-dismissable">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							${flash.resposta}
						</div>
					</div>
				</g:if>
				<g:if test="${flash.error}">
					<div class="col-lg-12">
						<div class="alert alert-danger alert-dismissable">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							${flash.error}
						</div>
					</div>
				</g:if>
			</div>

			<div class="row tickit-box">
				<div class="col-lg-6 tickit-bg-color-dark2">
					<g:link controller="autenticacao" action="index"
						params="[cmd:'open']">
						<h2>
							<asset:image src="samples/abrirChamadoBranco.png" class=""
								width="140" height="140" />
							<span class="tickit-box-text"> ABRIR CHAMADO </span>
						</h2>
					</g:link>
				</div>
				<!-- /.col-lg-6 -->

				<div class="col-lg-6 tickit-bg-color-dark3">
					<g:link controller="autenticacao" action="index"
						params="[cmd:'view']">
						<h2>
							<asset:image src="samples/visualizarChamadoBranco.png" class=""
								width="140" height="140" />
							<span class="tickit-box-text"> VISUALIZAR CHAMADO </span>
						</h2>
					</g:link>
				</div>
				<!-- /.col-lg-6 -->

				<div class="col-lg-6 tickit-bg-color-dark3">
					<g:link controller="autenticacao" action="index"
						params="[cmd:'tutorial']">
						<h2>
							<asset:image src="samples/tutorialBranco.png" class="tickit-img"
								width="140" height="140" />
							<span class="tickit-box-text"> TUTORIAL </span>
						</h2>
					</g:link>
				</div>
				<!-- /.col-lg-6 -->

				<div class="col-lg-6 tickit-bg-color-dark2">
					<a href="http://www.unirn.edu.br" target="_blank">
						<h2>
							<asset:image src="samples/unirnBranco.png" class="tickit-img"
								width="140" height="140" />
							<span class="tickit-box-text"> CENTRO UNIVERSITÁRIO </span>
						</h2>
					</a>
				</div>
				<!-- /.col-lg-6 -->

			</div>
			<!-- /.row -->
		</div>

<ul class='pager'> 
	<li> 
		<button class="btn btn-default tickit-btn-scroll-to-anchor" data-destino="#slidesAnchor" > 
			Detalhes <i class='fa fa-hand-o-down'></i>
		</button>
	</li> 
</ul>

<!-- START THE FEATURETTES -->
  <hr class="featurette-divider">

</div><!-- /.container -->


	<div class="container marketing" id="slidesAnchor">
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
					<asset:image src="samples/slide-abrirChamado.PNG"
						class="first-slide" alt="Abrir Chamado" />
					<div class="container">
						<div class="carousel-caption">
							%{--
							<h1>Abrir Chamado</h1>
							--}%
						</div>
					</div>
				</div>
				<div class="item">
					<asset:image src="samples/slide-visualizarChamado.PNG"
						class="first-slide" alt="Visualizar Chamados" />
					<div class="container">
						<div class="carousel-caption">
							%{--
							<h1>Visualizar Chamados</h1>
							--}%
						</div>
					</div>
				</div>
				<div class="item">
					<asset:image src="samples/slide-faleConosco.PNG"
						class="first-slide" alt="Fale Conosco" />
					<div class="container">
						<div class="carousel-caption">
							%{--
							<h1>Fale Conosco</h1>
							--}%
						</div>
					</div>
				</div>
				<div class="item">
					<asset:image src="samples/slide-tutorial.PNG" class="first-slide"
						alt="Tutorial" />
					<div class="container">
						<div class="carousel-caption">
							%{--
							<h1>Tutorial</h1>
							--}%
						</div>
					</div>
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!-- /.carousel -->

	</div>


</body>
</html>

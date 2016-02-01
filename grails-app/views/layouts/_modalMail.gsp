<div class="modal fade" id="modalMailId">
    <div class="modal-dialog ">
        <div class="modal-content">
			<g:form name="mailForm" controller="index" action="contato"
				class="form-horizontal">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<div class="login-logo">
						<h4 class="modal-title">
							Deixe seu recado | <a href="javascript:void(0);"><b>Tick</b>IT</a>
						</h4>
					</div>
				</div>
				<div class="modal-body">
					<div class="col-lg-12">
						<div class="login-box-body">
							<g:if test="${flash.error}">
								<div class="alert alert-warning alert-dismissable">
									<button type="button" class="close" data-dismiss="alert"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									${flash.error}
								</div>
							</g:if>
							<h4 class="login-box-msg">Envie suas dúvidas, críticas ou
								sugestões para melhoria da aplicação, para o Núcleo de
								Desenvolvimento da UNIRN</h4>
							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon" title='Seu nome'
										data-toggle='tooltip'> <i
										class="glyphicon glyphicon-user"></i>
									</span> <input type='text' required="required" name="nome"
										class="form-control" placeholder="nome" value="" />
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon" title='Seu email'
										data-toggle='tooltip'> <i
										class="glyphicon glyphicon-envelope"></i>
									</span> <input type='email' required="required" name="email"
										class="form-control" placeholder="e-mail" value="" />
								</div>
							</div>
							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon" title='Seu recado'
										data-toggle='tooltip'> <i
										class="glyphicon glyphicon-option-horizontal"></i>
									</span>
									<textarea rows="3" name="descricao" required="required" class="form-control"
										placeholder="descrição"></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="modal-footer">
					<div class="col-lg-12">
						<button type="button" class="btn btn-danger pull-left"
							data-dismiss="modal">Fechar</button>
						<button type="submit" class="btn btn-primary pull-right">
							<i class="fa fa-send"></i> Enviar Recado
						</button>
					</div>
				</div>
			</g:form>
		</div>
    </div>
</div>

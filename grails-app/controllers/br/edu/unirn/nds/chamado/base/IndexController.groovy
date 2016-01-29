package br.edu.unirn.nds.chamado.base

class IndexController {
    def mailService

    def index() {}

    def index2() {
        render view: 'index_carousel'
    }

    def tutorial() {}
	
    def testMail() {
		if(params?.email && params?.nome && params?.descricao){
			mailService.sendMail {
				to params?.email
				subject "[UNIRN/TickIT] Recado Enviado para equipe NDS-UNIRN"
				body 
"""Olá, ${params?.nome},
Confirmamos o recebimento de seu recado através do sistema TickIT.
Sua mensagem foi a seguinte:

${params?.descricao}

--------------
Esta é uma mensagem automática. Não é necessário respondê-la.
Equipe NDS-UNIRN.
"""
			}

			flash.resposta = "Teste de email executado..."
			render view: 'index_carousel'
			return
		}
		
		flash.error = "Teste de email n�o pode ser conclu�do."
		redirect action:'index2'
    }
}

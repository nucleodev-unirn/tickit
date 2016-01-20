package br.edu.unirn.nds.chamado.base

class IndexController {
    def mailService

    def index() {}

    def index2() {
        render view: 'index_carousel'
    }

    def tutorial() {}
    def testMail() {
        mailService.sendMail {
            to "marciodavimm@gmail.com"
            subject "Teste Tickit"
            body 'Teste testando...'
        }

        flash.resposta = "Teste de email executado..."
        render view: 'index_carousel'
//        redirect controller: 'index', action: 'index2'
    }
}

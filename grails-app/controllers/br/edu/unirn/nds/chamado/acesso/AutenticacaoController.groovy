package br.edu.unirn.nds.chamado.acesso

class AutenticacaoController {

    def index() {}

    def login(){
        def usuario = Usuario.findByLoginAndSenha(params.login, params.senha?.encodeAsSHA256())
        if(!usuario){
            flash.error = "Login ou Senha incorreto!"
            redirect action: "index"
            return
        }else{
            session.usuario = usuario
            redirect controller: "index", action: "index"
        }
    }

    def logout(){
        session.invalidate()
        redirect action: "index"
    }
}

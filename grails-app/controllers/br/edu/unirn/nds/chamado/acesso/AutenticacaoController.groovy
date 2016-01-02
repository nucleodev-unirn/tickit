package br.edu.unirn.nds.chamado.acesso

import br.edu.unirn.nds.tipos.TipoUsuario

class AutenticacaoController {

    def index() {}

    def login(){
        def usuario = Usuario.findByLoginAndSenhaAndTipoUsuario(params.matricula, params.senha?.encodeAsSHA256(), TipoUsuario.ADMINISTRADOR)?: Usuario.findByLoginAndSenhaAndTipoUsuario(params.matricula, params.senha?.encodeAsSHA256(), TipoUsuario.FUNCIONARIO)
        if(!usuario){
            flash.error = "Login ou Senha incorreto!"
            redirect action: "index"
            return
        }else{
            session.usuario = usuario
            redirect controller: "index", action: "index"
        }
    }

    def loginPublico(){
        def usuario = Usuario.findByLoginAndTipoUsuario(params.matriculaPublica, TipoUsuario.COMUM)
        if(!usuario){
            flash.resposta = "Login ou Senha incorreto!"
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

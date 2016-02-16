package br.edu.unirn.nds.chamado.acesso

import br.edu.unirn.nds.tipos.TipoUsuario

class AutenticacaoController {

    def index() {
        if(!session?.usuario){
            render view: 'index'
            return
        }

        def destino = ''
        switch (params?.cmd){
            case "open":
                destino = createLink(controller: 'chamado', action: 'create', absolute: true)
                break
            case "view":
                destino = createLink(controller: 'chamado', action: 'index', absolute: true)
                break
            case "tutorial":
                destino = createLink(controller: 'index', action: 'tutorial', absolute: true)
                break
            default:
                render view: 'index'
                return
                break
        }
        redirect url: destino , params: params
    }

    def login(){

        def usuario = Usuario.findByLoginAndSenhaAndTipoUsuario(params.matricula, params.senha?.encodeAsSHA256(), TipoUsuario.ADMINISTRADOR)?: Usuario.findByLoginAndSenhaAndTipoUsuario(params.matricula, params.senha?.encodeAsSHA256(), TipoUsuario.FUNCIONARIO)
        if(!usuario){
            flash.error = "Login ou Senha incorreto!"
            redirect action: "index" , params: params
            return
        }else{
            session.usuario = usuario

            def destino = ''
            switch (params?.cmd){
                case "open":
                    destino = createLink(controller: 'chamado', action: 'create', absolute: true)
                    break
                case "view":
                    destino = createLink(controller: 'chamado', action: 'index', absolute: true)
                    break
                case "tutorial":
                    destino = createLink(controller: 'index', action: 'tutorial', absolute: true)
                    break
                default:
                    redirect controller: "index", action: "index"
                    return
                    break
            }
            redirect url: destino , params: params
        }
    }

    def loginPublico(){
        def usuario = Usuario.findByLoginAndTipoUsuario(params.matriculaPublica, TipoUsuario.COMUM)
        if(!usuario){
            flash.resposta = "Login ou Senha incorreto!"
            println """================= \nLogin ou Senha incorreto! \n========================"""
            redirect action: "index" , params: params
            return
        }else{
            session.usuario = usuario

            def destino = ''
            switch (params?.cmd){
                case "open":
                    destino = createLink(controller: 'chamado', action: 'create', absolute: true)
                    break
                case "view":
                    destino = createLink(controller: 'chamado', action: 'index', absolute: true)
                    break
                case "tutorial":
                    destino = createLink(controller: 'index', action: 'tutorial', absolute: true)
                    break
                default:
                    redirect controller: "index", action: "index2"
                    return
                    break
            }
            redirect url: destino , params: params

        }
    }

    def logout(){
        session.invalidate()
        flash.resposta = "Sessão Encerrada"
        println """================= \n sessao encerrada... \n========================"""
        log.info "Sessão Encerrada"
        redirect controller: 'index', action: "index2"
    }
}

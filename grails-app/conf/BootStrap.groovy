import br.edu.unirn.nds.chamado.acesso.Usuario

class BootStrap {

    def init = { servletContext ->
        //TODO: REMOVER OU ALTERAR QUANDO TIVER O FLUXO DE LOGIN
        new Usuario(login: "admin", senha: "admin").save(flush: true)
    }
    def destroy = {
    }
}

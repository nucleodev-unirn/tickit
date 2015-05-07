import br.edu.unirn.nds.chamado.acesso.Usuario
import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        if(Environment.developmentMode){
             def usuario = Usuario.findByLogin("admin")?:new Usuario(login: "admin", senha: "admin").save(flush: true)
        }
    }
    def destroy = {
    }
}

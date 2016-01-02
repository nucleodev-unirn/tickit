import br.edu.unirn.nds.chamado.acesso.Usuario
import br.edu.unirn.nds.tipos.TipoUsuario
import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        if(Environment.developmentMode){
             def usuarioAdmin = Usuario.findByLogin("admin")?: new Usuario(senha: "admin", login: 'admin', tipoUsuario: TipoUsuario.ADMINISTRADOR).save(flush: true, failOnError: true)
             def usuarioFuncionario = Usuario.findByLogin("funcionario")?: new Usuario(senha: "funcionario", login: 'funcionario', tipoUsuario: TipoUsuario.FUNCIONARIO).save(flush: true, failOnError: true)
             def usuarioPublico = Usuario.findByLogin("publico")?: new Usuario(login: 'publico', tipoUsuario: TipoUsuario.COMUM).save(flush: true, failOnError: true)
        }
    }
    def destroy = {
    }
}

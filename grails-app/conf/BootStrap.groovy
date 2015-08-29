import br.edu.unirn.nds.chamado.acesso.Usuario
import br.edu.unirn.nds.tipos.TipoUsuario
import grails.util.Environment

class BootStrap {

    def init = { servletContext ->
        if(Environment.developmentMode){
             def usuarioAdmin = Usuario.findByMatricula("admin")?: new Usuario(senha: "admin", matricula: 'admin', tipoUsuario: TipoUsuario.ADMINISTRADOR).save(flush: true, failOnError: true)
             def usuarioFuncionario = Usuario.findByMatricula("funcionario")?: new Usuario(senha: "funcionario", matricula: 'funcionario', tipoUsuario: TipoUsuario.FUNCIONARIO).save(flush: true, failOnError: true)
             def usuarioPublico = Usuario.findByMatricula("publico")?: new Usuario(matricula: 'publico', tipoUsuario: TipoUsuario.COMUM).save(flush: true, failOnError: true)
        }
    }
    def destroy = {
    }
}

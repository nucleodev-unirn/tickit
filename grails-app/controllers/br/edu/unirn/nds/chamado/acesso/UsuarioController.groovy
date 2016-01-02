package br.edu.unirn.nds.chamado.acesso

import grails.util.Environment
import org.apache.commons.lang.exception.ExceptionUtils
import org.springframework.dao.DataIntegrityViolationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsClassUtils

@Transactional(readOnly = true)
class UsuarioController {

    def mailService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def criteriaResult = Usuario.createCriteria().list(params) {
            if (params.q) {
                or {
                    GrailsClassUtils?.getStaticPropertyValue(Usuario, "searchFields")?.each {
                        def property = GrailsClassUtils?.getPropertyType(Usuario, it)
                        if (property && Number.isAssignableFrom(property) || (property?.isPrimitive() && property != boolean)) {
                            if (property == Integer)
                                eq(it, params.int("q"))
                        } else if (property == String) {
                            ilike(it, params.q + "%")
                        }
                    }
                }
            }
        }

        respond criteriaResult, model: [usuarioInstanceCount: criteriaResult.totalCount, query: params.q]
    }

    def show(Usuario usuarioInstance) {
        respond usuarioInstance
    }

    def create() {
        respond new Usuario(params)
    }

    @Transactional
    def save(Usuario usuarioInstance) {
        if (usuarioInstance == null) {
            notFound()
            return
        }

        usuarioInstance.save flush: true

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view: 'create'
            return
        }

        if (Environment.developmentMode) {
            def msgEmail = ""
            msgEmail += """
                            <p>
								Bem vindo ao TickIT, Sistema de Cadastro de Chamados de TI da UNIRN.
                            </p>
                            <p>
								Recentemente algu�m realizou cadastro de usu�rio usando esta conta de email. Abaixo seguem suas informa��es de usu�rio e link de acesso ao sistema.
                            </p>
                            <p>
                                <strong> Login: </strong> ${usuarioInstance?.login}
                                <strong> Senha: </strong> ${usuarioInstance?.senha}
                                <strong> <a href="${g.createLink(absolute: true, controller: 'autenticacao', action: 'index')}" target="_blank"> Clique aqui para acessar! </a> </strong>
                            </p>
                            <p>
								<strong>Este usu�rio foi cadastrado Por (login)</strong>: ${session?.usuario?.login} <br/>
                            </p>
                        """

            mailService.sendMail {
                to "marciodavimm@gmail.com"
                subject "[UNIRN/TICKIT][${Environment?.current?.name}] - Confirma��o de Cadastro de Usu�rio!"
                html msgEmail
            }
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect(action: "edit", id: usuarioInstance?.id)
            }
            '*' { respond usuarioInstance, [status: CREATED] }
        }
    }

    def edit(Usuario usuarioInstance) {
        respond usuarioInstance
    }

    @Transactional
    def update(Usuario usuarioInstance) {
        if (usuarioInstance == null) {
            notFound()
            return
        }

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view: 'edit'
            return
        }

        usuarioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect(action: "edit", id: usuarioInstance?.id)
            }
            '*' { respond usuarioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Usuario usuarioInstance) {

        if (usuarioInstance == null) {
            notFound()
            return
        }

        try {
            usuarioInstance.delete flush: true
        } catch (org.springframework.dao.DataIntegrityViolationException e) {
            Usuario.withSession { session ->
                session.clear()
            }
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'Usuario.label', default: 'Usuario'), usuarioInstance.id])
            redirect(action: "edit", id: params.id)
            return
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}

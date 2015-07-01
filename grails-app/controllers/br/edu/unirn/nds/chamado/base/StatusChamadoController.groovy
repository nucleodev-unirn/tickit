package br.edu.unirn.nds.chamado.base

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsClassUtils

@Transactional(readOnly = true)
class StatusChamadoController {

    static allowedMethods = [salvar: "POST", update: "PUT", excluir: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def criteriaResult = StatusChamado.createCriteria().list(params) {
            if (params.q) {
                or {
                    GrailsClassUtils?.getStaticPropertyValue(StatusChamado, "searchFields")?.each {
                        def property = GrailsClassUtils?.getPropertyType(StatusChamado, it)
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

        respond criteriaResult, model:[statusChamadoInstanceCount: criteriaResult.totalCount, query: params.q]
    }

    def show(StatusChamado statusChamadoInstance) {
        respond statusChamadoInstance
    }

    def cadastrar() {
        respond new StatusChamado(params)
    }

    @Transactional
    def salvar(StatusChamado statusChamadoInstance) {
        if (statusChamadoInstance == null) {
            notFound()
            return
        }

        if (statusChamadoInstance.hasErrors()) {
            respond statusChamadoInstance.errors, view:'cadastrar'
            return
        }

        statusChamadoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'statusChamado.label', default: 'StatusChamado'), statusChamadoInstance.id])
                redirect(action: "editar", id: statusChamadoInstance?.id)
            }
            '*' { respond statusChamadoInstance, [status: CREATED] }
        }
    }

    def editar(StatusChamado statusChamadoInstance) {
        respond statusChamadoInstance
    }

    @Transactional
    def update(StatusChamado statusChamadoInstance) {
        if (statusChamadoInstance == null) {
            notFound()
            return
        }

        if (statusChamadoInstance.hasErrors()) {
            respond statusChamadoInstance.errors, view:'editar'
            return
        }

        statusChamadoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'StatusChamado.label', default: 'StatusChamado'), statusChamadoInstance.id])
                redirect(action: "editar", id: statusChamadoInstance?.id)
            }
            '*'{ respond statusChamadoInstance, [status: OK] }
        }
    }

    @Transactional
    def excluir(StatusChamado statusChamadoInstance) {

        if (statusChamadoInstance == null) {
            notFound()
            return
        }

        try{
            statusChamadoInstance.delete flush:true
        }catch (org.springframework.dao.DataIntegrityViolationException e){
            StatusChamado.withSession { session ->
                session.clear()
            }
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'StatusChamado.label', default: 'StatusChamado'), statusChamadoInstance.id])
            redirect(action: "editar", id: params.id)
            return
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'StatusChamado.label', default: 'StatusChamado'), statusChamadoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'statusChamado.label', default: 'StatusChamado'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

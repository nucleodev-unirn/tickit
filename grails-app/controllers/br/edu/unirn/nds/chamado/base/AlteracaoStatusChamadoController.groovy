package br.edu.unirn.nds.chamado.base


import org.springframework.dao.DataIntegrityViolationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsClassUtils

@Transactional(readOnly = true)
class AlteracaoStatusChamadoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def criteriaResult = AlteracaoStatusChamado.createCriteria().list(params) {
            if (params.q) {
                or {
                    GrailsClassUtils?.getStaticPropertyValue(AlteracaoStatusChamado, "searchFields")?.each {
                        def property = GrailsClassUtils?.getPropertyType(AlteracaoStatusChamado, it)
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

        respond criteriaResult, model: [alteracaoStatusChamadoInstanceCount: criteriaResult.totalCount, query: params.q]
    }

    def show(AlteracaoStatusChamado alteracaoStatusChamadoInstance) {
        respond alteracaoStatusChamadoInstance
    }

    def create() {
        respond new AlteracaoStatusChamado(params)
    }

    @Transactional
    def save(AlteracaoStatusChamado alteracaoStatusChamadoInstance) {
        if (alteracaoStatusChamadoInstance == null) {
            notFound()
            return
        }

        if (alteracaoStatusChamadoInstance.hasErrors()) {
            respond alteracaoStatusChamadoInstance.errors, view: 'create'
            return
        }

        alteracaoStatusChamadoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'alteracaoStatusChamado.label', default: 'AlteracaoStatusChamado'), alteracaoStatusChamadoInstance.id])
                redirect(action: "edit", id: alteracaoStatusChamadoInstance?.id)
            }
            '*' { respond alteracaoStatusChamadoInstance, [status: CREATED] }
        }
    }

    def edit(AlteracaoStatusChamado alteracaoStatusChamadoInstance) {
        respond alteracaoStatusChamadoInstance
    }

    @Transactional
    def update(AlteracaoStatusChamado alteracaoStatusChamadoInstance) {
        if (alteracaoStatusChamadoInstance == null) {
            notFound()
            return
        }

        if (alteracaoStatusChamadoInstance.hasErrors()) {
            respond alteracaoStatusChamadoInstance.errors, view: 'edit'
            return
        }

        alteracaoStatusChamadoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AlteracaoStatusChamado.label', default: 'AlteracaoStatusChamado'), alteracaoStatusChamadoInstance.id])
                redirect(action: "edit", id: alteracaoStatusChamadoInstance?.id)
            }
            '*' { respond alteracaoStatusChamadoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AlteracaoStatusChamado alteracaoStatusChamadoInstance) {

        if (alteracaoStatusChamadoInstance == null) {
            notFound()
            return
        }

        try {
            alteracaoStatusChamadoInstance.delete flush: true
        } catch (org.springframework.dao.DataIntegrityViolationException e) {
            AlteracaoStatusChamado.withSession { session ->
                session.clear()
            }
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'AlteracaoStatusChamado.label', default: 'AlteracaoStatusChamado'), alteracaoStatusChamadoInstance.id])
            redirect(action: "edit", id: params.id)
            return
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AlteracaoStatusChamado.label', default: 'AlteracaoStatusChamado'), alteracaoStatusChamadoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'alteracaoStatusChamado.label', default: 'AlteracaoStatusChamado'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}

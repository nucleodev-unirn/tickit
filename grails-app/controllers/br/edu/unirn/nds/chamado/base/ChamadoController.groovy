package br.edu.unirn.nds.chamado.base


import org.springframework.dao.DataIntegrityViolationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsClassUtils

@Transactional(readOnly = true)
class ChamadoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def criteriaResult = Chamado.createCriteria().list(params) {
            if (params.q) {
                or {
                    GrailsClassUtils?.getStaticPropertyValue(Chamado, "searchFields")?.each {
                        def property = GrailsClassUtils?.getPropertyType(Chamado, it)
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

        respond criteriaResult, model: [chamadoInstanceCount: criteriaResult.totalCount, query: params.q]
    }

    def show(Chamado chamadoInstance) {
        respond chamadoInstance
    }

    def create() {
        respond new Chamado(params)
    }

    @Transactional
    def save(Chamado chamadoInstance) {
        if (chamadoInstance == null) {
            notFound()
            return
        }

        if (chamadoInstance.hasErrors()) {
            respond chamadoInstance.errors, view: 'create'
            return
        }

        chamadoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'chamado.label', default: 'Chamado'), chamadoInstance.id])
                redirect(action: "edit", id: chamadoInstance?.id)
            }
            '*' { respond chamadoInstance, [status: CREATED] }
        }
    }

    def edit(Chamado chamadoInstance) {
        respond chamadoInstance
    }

    @Transactional
    def update(Chamado chamadoInstance) {
        if (chamadoInstance == null) {
            notFound()
            return
        }

        if (chamadoInstance.hasErrors()) {
            respond chamadoInstance.errors, view: 'edit'
            return
        }

        chamadoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Chamado.label', default: 'Chamado'), chamadoInstance.id])
                redirect(action: "edit", id: chamadoInstance?.id)
            }
            '*' { respond chamadoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Chamado chamadoInstance) {

        if (chamadoInstance == null) {
            notFound()
            return
        }

        try {
            chamadoInstance.delete flush: true
        } catch (org.springframework.dao.DataIntegrityViolationException e) {
            Chamado.withSession { session ->
                session.clear()
            }
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'Chamado.label', default: 'Chamado'), chamadoInstance.id])
            redirect(action: "edit", id: params.id)
            return
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Chamado.label', default: 'Chamado'), chamadoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'chamado.label', default: 'Chamado'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}

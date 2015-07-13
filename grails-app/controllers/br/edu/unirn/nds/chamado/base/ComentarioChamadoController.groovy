package br.edu.unirn.nds.chamado.base


import org.springframework.dao.DataIntegrityViolationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsClassUtils

@Transactional(readOnly = true)
class ComentarioChamadoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def criteriaResult = ComentarioChamado.createCriteria().list(params) {
            if (params.q) {
                or {
                    GrailsClassUtils?.getStaticPropertyValue(ComentarioChamado, "searchFields")?.each {
                        def property = GrailsClassUtils?.getPropertyType(ComentarioChamado, it)
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

        respond criteriaResult, model: [comentarioChamadoInstanceCount: criteriaResult.totalCount, query: params.q]
    }

    def show(ComentarioChamado comentarioChamadoInstance) {
        respond comentarioChamadoInstance
    }

    def create() {
        respond new ComentarioChamado(params)
    }

    @Transactional
    def save(ComentarioChamado comentarioChamadoInstance) {
        if (comentarioChamadoInstance == null) {
            notFound()
            return
        }

        if (comentarioChamadoInstance.hasErrors()) {
            respond comentarioChamadoInstance.errors, view: 'create'
            return
        }

        comentarioChamadoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'comentarioChamado.label', default: 'ComentarioChamado'), comentarioChamadoInstance.id])
                redirect(action: "edit", id: comentarioChamadoInstance?.id)
            }
            '*' { respond comentarioChamadoInstance, [status: CREATED] }
        }
    }

    def edit(ComentarioChamado comentarioChamadoInstance) {
        respond comentarioChamadoInstance
    }

    @Transactional
    def update(ComentarioChamado comentarioChamadoInstance) {
        if (comentarioChamadoInstance == null) {
            notFound()
            return
        }

        if (comentarioChamadoInstance.hasErrors()) {
            respond comentarioChamadoInstance.errors, view: 'edit'
            return
        }

        comentarioChamadoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ComentarioChamado.label', default: 'ComentarioChamado'), comentarioChamadoInstance.id])
                redirect(action: "edit", id: comentarioChamadoInstance?.id)
            }
            '*' { respond comentarioChamadoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ComentarioChamado comentarioChamadoInstance) {

        if (comentarioChamadoInstance == null) {
            notFound()
            return
        }

        try {
            comentarioChamadoInstance.delete flush: true
        } catch (org.springframework.dao.DataIntegrityViolationException e) {
            ComentarioChamado.withSession { session ->
                session.clear()
            }
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'ComentarioChamado.label', default: 'ComentarioChamado'), comentarioChamadoInstance.id])
            redirect(action: "edit", id: params.id)
            return
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ComentarioChamado.label', default: 'ComentarioChamado'), comentarioChamadoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'comentarioChamado.label', default: 'ComentarioChamado'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}

package br.edu.unirn.nds.chamado.base


import org.springframework.dao.DataIntegrityViolationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsClassUtils

@Transactional(readOnly = true)
class ResponsavelChamadoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def criteriaResult = ResponsavelChamado.createCriteria().list(params) {
            if (params.q) {
                or {
                    GrailsClassUtils?.getStaticPropertyValue(ResponsavelChamado, "searchFields")?.each {
                        def property = GrailsClassUtils?.getPropertyType(ResponsavelChamado, it)
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

        respond criteriaResult, model: [responsavelChamadoInstanceCount: criteriaResult.totalCount, query: params.q]
    }

    def show(ResponsavelChamado responsavelChamadoInstance) {
        respond responsavelChamadoInstance
    }

    def create() {
        respond new ResponsavelChamado(params)
    }

    @Transactional
    def save(ResponsavelChamado responsavelChamadoInstance) {
        if (responsavelChamadoInstance == null) {
            notFound()
            return
        }

        if (responsavelChamadoInstance.hasErrors()) {
            respond responsavelChamadoInstance.errors, view: 'create'
            return
        }

        responsavelChamadoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'responsavelChamado.label', default: 'ResponsavelChamado'), responsavelChamadoInstance.id])
                redirect(action: "edit", id: responsavelChamadoInstance?.id)
            }
            '*' { respond responsavelChamadoInstance, [status: CREATED] }
        }
    }

    def edit(ResponsavelChamado responsavelChamadoInstance) {
        respond responsavelChamadoInstance
    }

    @Transactional
    def update(ResponsavelChamado responsavelChamadoInstance) {
        if (responsavelChamadoInstance == null) {
            notFound()
            return
        }

        if (responsavelChamadoInstance.hasErrors()) {
            respond responsavelChamadoInstance.errors, view: 'edit'
            return
        }

        responsavelChamadoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ResponsavelChamado.label', default: 'ResponsavelChamado'), responsavelChamadoInstance.id])
                redirect(action: "edit", id: responsavelChamadoInstance?.id)
            }
            '*' { respond responsavelChamadoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ResponsavelChamado responsavelChamadoInstance) {

        if (responsavelChamadoInstance == null) {
            notFound()
            return
        }

        try {
            responsavelChamadoInstance.delete flush: true
        } catch (org.springframework.dao.DataIntegrityViolationException e) {
            ResponsavelChamado.withSession { session ->
                session.clear()
            }
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'ResponsavelChamado.label', default: 'ResponsavelChamado'), responsavelChamadoInstance.id])
            redirect(action: "edit", id: params.id)
            return
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ResponsavelChamado.label', default: 'ResponsavelChamado'), responsavelChamadoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'responsavelChamado.label', default: 'ResponsavelChamado'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}

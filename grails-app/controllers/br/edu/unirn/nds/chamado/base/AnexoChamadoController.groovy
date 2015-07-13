package br.edu.unirn.nds.chamado.base


import org.springframework.dao.DataIntegrityViolationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsClassUtils

@Transactional(readOnly = true)
class AnexoChamadoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def criteriaResult = AnexoChamado.createCriteria().list(params) {
            if (params.q) {
                or {
                    GrailsClassUtils?.getStaticPropertyValue(AnexoChamado, "searchFields")?.each {
                        def property = GrailsClassUtils?.getPropertyType(AnexoChamado, it)
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

        respond criteriaResult, model: [anexoChamadoInstanceCount: criteriaResult.totalCount, query: params.q]
    }

    def show(AnexoChamado anexoChamadoInstance) {
        respond anexoChamadoInstance
    }

    def create() {
        respond new AnexoChamado(params)
    }

    @Transactional
    def save(AnexoChamado anexoChamadoInstance) {
        if (anexoChamadoInstance == null) {
            notFound()
            return
        }

        if (anexoChamadoInstance.hasErrors()) {
            respond anexoChamadoInstance.errors, view: 'create'
            return
        }

        anexoChamadoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'anexoChamado.label', default: 'AnexoChamado'), anexoChamadoInstance.id])
                redirect(action: "edit", id: anexoChamadoInstance?.id)
            }
            '*' { respond anexoChamadoInstance, [status: CREATED] }
        }
    }

    def edit(AnexoChamado anexoChamadoInstance) {
        respond anexoChamadoInstance
    }

    @Transactional
    def update(AnexoChamado anexoChamadoInstance) {
        if (anexoChamadoInstance == null) {
            notFound()
            return
        }

        if (anexoChamadoInstance.hasErrors()) {
            respond anexoChamadoInstance.errors, view: 'edit'
            return
        }

        anexoChamadoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AnexoChamado.label', default: 'AnexoChamado'), anexoChamadoInstance.id])
                redirect(action: "edit", id: anexoChamadoInstance?.id)
            }
            '*' { respond anexoChamadoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AnexoChamado anexoChamadoInstance) {

        if (anexoChamadoInstance == null) {
            notFound()
            return
        }

        try {
            anexoChamadoInstance.delete flush: true
        } catch (org.springframework.dao.DataIntegrityViolationException e) {
            AnexoChamado.withSession { session ->
                session.clear()
            }
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'AnexoChamado.label', default: 'AnexoChamado'), anexoChamadoInstance.id])
            redirect(action: "edit", id: params.id)
            return
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AnexoChamado.label', default: 'AnexoChamado'), anexoChamadoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'anexoChamado.label', default: 'AnexoChamado'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}

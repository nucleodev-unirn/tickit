package br.edu.unirn.nds.chamado.base


import org.springframework.dao.DataIntegrityViolationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsClassUtils

@Transactional(readOnly = true)
class SetorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def criteriaResult = Setor.createCriteria().list(params) {
            if (params.q) {
                or {
                    GrailsClassUtils?.getStaticPropertyValue(Setor, "searchFields")?.each {
                        def property = GrailsClassUtils?.getPropertyType(Setor, it)
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

        respond criteriaResult, model: [setorInstanceCount: criteriaResult.totalCount, query: params.q]
    }

    def show(Setor setorInstance) {
        respond setorInstance
    }

    def create() {
        respond new Setor(params)
    }

    @Transactional
    def save(Setor setorInstance) {
        if (setorInstance == null) {
            notFound()
            return
        }

        if (setorInstance.hasErrors()) {
            respond setorInstance.errors, view: 'create'
            return
        }

        setorInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'setor.label', default: 'Setor'), setorInstance.id])
                redirect(action: "edit", id: setorInstance?.id)
            }
            '*' { respond setorInstance, [status: CREATED] }
        }
    }

    def edit(Setor setorInstance) {
        respond setorInstance
    }

    @Transactional
    def update(Setor setorInstance) {
        if (setorInstance == null) {
            notFound()
            return
        }

        if (setorInstance.hasErrors()) {
            respond setorInstance.errors, view: 'edit'
            return
        }

        setorInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Setor.label', default: 'Setor'), setorInstance.id])
                redirect(action: "edit", id: setorInstance?.id)
            }
            '*' { respond setorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Setor setorInstance) {

        if (setorInstance == null) {
            notFound()
            return
        }

        try {
            setorInstance.delete flush: true
        } catch (org.springframework.dao.DataIntegrityViolationException e) {
            Setor.withSession { session ->
                session.clear()
            }
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'Setor.label', default: 'Setor'), setorInstance.id])
            redirect(action: "edit", id: params.id)
            return
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Setor.label', default: 'Setor'), setorInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'setor.label', default: 'Setor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}

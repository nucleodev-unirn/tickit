package br.edu.unirn.nds.chamado.equipamentos


import org.springframework.dao.DataIntegrityViolationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsClassUtils

@Transactional(readOnly = true)
class EquipamentoController {

    static scaffold = true

//    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

/*
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def criteriaResult = Equipamento.createCriteria().list(params) {
            if (params.q) {
                or {
                    GrailsClassUtils?.getStaticPropertyValue(Equipamento, "searchFields")?.each {
                        def property = GrailsClassUtils?.getPropertyType(Equipamento, it)
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

        respond criteriaResult, model: [equipamentoInstanceCount: criteriaResult.totalCount, query: params.q]
    }
*/

/*
    def show(Equipamento equipamentoInstance) {
        respond equipamentoInstance
    }
*/

/*
    def create() {
        respond new Equipamento(params)
    }
*/

/*
    @Transactional
    def save(Equipamento equipamentoInstance) {
        if (equipamentoInstance == null) {
            notFound()
            return
        }

        if (equipamentoInstance.hasErrors()) {
            respond equipamentoInstance.errors, view: 'create'
            return
        }

        equipamentoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'equipamento.label', default: 'Equipamento'), equipamentoInstance.id])
                redirect(action: "edit", id: equipamentoInstance?.id)
            }
            '*' { respond equipamentoInstance, [status: CREATED] }
        }
    }
*/

/*
    def edit(Equipamento equipamentoInstance) {
        respond equipamentoInstance
    }
*/

/*
    @Transactional
    def update(Equipamento equipamentoInstance) {
        if (equipamentoInstance == null) {
            notFound()
            return
        }

        if (equipamentoInstance.hasErrors()) {
            respond equipamentoInstance.errors, view: 'edit'
            return
        }

        equipamentoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Equipamento.label', default: 'Equipamento'), equipamentoInstance.id])
                redirect(action: "edit", id: equipamentoInstance?.id)
            }
            '*' { respond equipamentoInstance, [status: OK] }
        }
    }
*/

/*
    @Transactional
    def delete(Equipamento equipamentoInstance) {

        if (equipamentoInstance == null) {
            notFound()
            return
        }

        try {
            equipamentoInstance.delete flush: true
        } catch (org.springframework.dao.DataIntegrityViolationException e) {
            Equipamento.withSession { session ->
                session.clear()
            }
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'Equipamento.label', default: 'Equipamento'), equipamentoInstance.id])
            redirect(action: "edit", id: params.id)
            return
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Equipamento.label', default: 'Equipamento'), equipamentoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }
*/

/*
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipamento.label', default: 'Equipamento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
*/
}

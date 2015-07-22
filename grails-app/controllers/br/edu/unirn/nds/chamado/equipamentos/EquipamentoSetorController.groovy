package br.edu.unirn.nds.chamado.equipamentos


import org.springframework.dao.DataIntegrityViolationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsClassUtils

@Transactional(readOnly = true)
class EquipamentoSetorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def criteriaResult = EquipamentoSetor.createCriteria().list(params) {
            if (params.q) {
                or {
                    GrailsClassUtils?.getStaticPropertyValue(EquipamentoSetor, "searchFields")?.each {
                        def property = GrailsClassUtils?.getPropertyType(EquipamentoSetor, it)
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

        respond criteriaResult, model: [equipamentoSetorInstanceCount: criteriaResult.totalCount, query: params.q]
    }

    def show(EquipamentoSetor equipamentoSetorInstance) {
        respond equipamentoSetorInstance
    }

    def create() {
        respond new EquipamentoSetor(params)
    }

    @Transactional
    def save(EquipamentoSetor equipamentoSetorInstance) {
        if (equipamentoSetorInstance == null) {
            notFound()
            return
        }

        if (equipamentoSetorInstance.hasErrors()) {
            respond equipamentoSetorInstance.errors, view: 'create'
            return
        }

        equipamentoSetorInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'equipamentoSetor.label', default: 'EquipamentoSetor'), equipamentoSetorInstance.id])
                redirect(action: "edit", id: equipamentoSetorInstance?.id)
            }
            '*' { respond equipamentoSetorInstance, [status: CREATED] }
        }
    }

    def edit(EquipamentoSetor equipamentoSetorInstance) {
        respond equipamentoSetorInstance
    }

    @Transactional
    def update(EquipamentoSetor equipamentoSetorInstance) {
        if (equipamentoSetorInstance == null) {
            notFound()
            return
        }

        if (equipamentoSetorInstance.hasErrors()) {
            respond equipamentoSetorInstance.errors, view: 'edit'
            return
        }

        equipamentoSetorInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EquipamentoSetor.label', default: 'EquipamentoSetor'), equipamentoSetorInstance.id])
                redirect(action: "edit", id: equipamentoSetorInstance?.id)
            }
            '*' { respond equipamentoSetorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EquipamentoSetor equipamentoSetorInstance) {

        if (equipamentoSetorInstance == null) {
            notFound()
            return
        }

        try {
            equipamentoSetorInstance.delete flush: true
        } catch (org.springframework.dao.DataIntegrityViolationException e) {
            EquipamentoSetor.withSession { session ->
                session.clear()
            }
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'EquipamentoSetor.label', default: 'EquipamentoSetor'), equipamentoSetorInstance.id])
            redirect(action: "edit", id: params.id)
            return
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EquipamentoSetor.label', default: 'EquipamentoSetor'), equipamentoSetorInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipamentoSetor.label', default: 'EquipamentoSetor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}

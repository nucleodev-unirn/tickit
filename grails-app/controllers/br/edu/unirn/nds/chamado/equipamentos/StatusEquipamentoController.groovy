package br.edu.unirn.nds.chamado.equipamentos




import org.springframework.dao.DataIntegrityViolationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsClassUtils

@Transactional(readOnly = true)
class StatusEquipamentoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def criteriaResult = StatusEquipamento.createCriteria().list(params) {
            if (params.q) {
                or {
                    GrailsClassUtils?.getStaticPropertyValue(StatusEquipamento, "searchFields")?.each {
                        def property = GrailsClassUtils?.getPropertyType(StatusEquipamento, it)
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

        respond criteriaResult, model:[statusEquipamentoInstanceCount: criteriaResult.totalCount, query: params.q]
    }

    def show(StatusEquipamento statusEquipamentoInstance) {
        respond statusEquipamentoInstance
    }

    def create() {
        respond new StatusEquipamento(params)
    }

    @Transactional
    def save(StatusEquipamento statusEquipamentoInstance) {
        if (statusEquipamentoInstance == null) {
            notFound()
            return
        }

        if (statusEquipamentoInstance.hasErrors()) {
            respond statusEquipamentoInstance.errors, view:'create'
            return
        }

        statusEquipamentoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'statusEquipamento.label', default: 'StatusEquipamento'), statusEquipamentoInstance.id])
                redirect(action: "edit", id: statusEquipamentoInstance?.id)
            }
            '*' { respond statusEquipamentoInstance, [status: CREATED] }
        }
    }

    def edit(StatusEquipamento statusEquipamentoInstance) {
        respond statusEquipamentoInstance
    }

    @Transactional
    def update(StatusEquipamento statusEquipamentoInstance) {
        if (statusEquipamentoInstance == null) {
            notFound()
            return
        }

        if (statusEquipamentoInstance.hasErrors()) {
            respond statusEquipamentoInstance.errors, view:'edit'
            return
        }

        statusEquipamentoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'StatusEquipamento.label', default: 'StatusEquipamento'), statusEquipamentoInstance.id])
                redirect(action: "edit", id: statusEquipamentoInstance?.id)
            }
            '*'{ respond statusEquipamentoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(StatusEquipamento statusEquipamentoInstance) {

        if (statusEquipamentoInstance == null) {
            notFound()
            return
        }

        try{
            statusEquipamentoInstance.delete flush:true
        }catch (org.springframework.dao.DataIntegrityViolationException e){
            StatusEquipamento.withSession { session ->
                session.clear()
            }
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'StatusEquipamento.label', default: 'StatusEquipamento'), statusEquipamentoInstance.id])
            redirect(action: "edit", id: params.id)
            return
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'StatusEquipamento.label', default: 'StatusEquipamento'), statusEquipamentoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'statusEquipamento.label', default: 'StatusEquipamento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

package br.edu.unirn.nds.chamado.equipamentos




import org.springframework.dao.DataIntegrityViolationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsClassUtils

@Transactional(readOnly = true)
class TipoEquipamentoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def criteriaResult = TipoEquipamento.createCriteria().list(params) {
            if (params.q) {
                or {
                    GrailsClassUtils?.getStaticPropertyValue(TipoEquipamento, "searchFields")?.each {
                        def property = GrailsClassUtils?.getPropertyType(TipoEquipamento, it)
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

        respond criteriaResult, model:[tipoEquipamentoInstanceCount: criteriaResult.totalCount, query: params.q]
    }

    def show(TipoEquipamento tipoEquipamentoInstance) {
        respond tipoEquipamentoInstance
    }

    def create() {
        respond new TipoEquipamento(params)
    }

    @Transactional
    def save(TipoEquipamento tipoEquipamentoInstance) {
        if (tipoEquipamentoInstance == null) {
            notFound()
            return
        }

        if (tipoEquipamentoInstance.hasErrors()) {
            respond tipoEquipamentoInstance.errors, view:'create'
            return
        }

        tipoEquipamentoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoEquipamento.label', default: 'TipoEquipamento'), tipoEquipamentoInstance.id])
                redirect(action: "edit", id: tipoEquipamentoInstance?.id)
            }
            '*' { respond tipoEquipamentoInstance, [status: CREATED] }
        }
    }

    def edit(TipoEquipamento tipoEquipamentoInstance) {
        respond tipoEquipamentoInstance
    }

    @Transactional
    def update(TipoEquipamento tipoEquipamentoInstance) {
        if (tipoEquipamentoInstance == null) {
            notFound()
            return
        }

        if (tipoEquipamentoInstance.hasErrors()) {
            respond tipoEquipamentoInstance.errors, view:'edit'
            return
        }

        tipoEquipamentoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoEquipamento.label', default: 'TipoEquipamento'), tipoEquipamentoInstance.id])
                redirect(action: "edit", id: tipoEquipamentoInstance?.id)
            }
            '*'{ respond tipoEquipamentoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoEquipamento tipoEquipamentoInstance) {

        if (tipoEquipamentoInstance == null) {
            notFound()
            return
        }

        try{
            tipoEquipamentoInstance.delete flush:true
        }catch (org.springframework.dao.DataIntegrityViolationException e){
            TipoEquipamento.withSession { session ->
                session.clear()
            }
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'TipoEquipamento.label', default: 'TipoEquipamento'), tipoEquipamentoInstance.id])
            redirect(action: "edit", id: params.id)
            return
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoEquipamento.label', default: 'TipoEquipamento'), tipoEquipamentoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoEquipamento.label', default: 'TipoEquipamento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

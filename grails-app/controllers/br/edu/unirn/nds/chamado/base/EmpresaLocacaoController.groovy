package br.edu.unirn.nds.chamado.base


import org.springframework.dao.DataIntegrityViolationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsClassUtils

@Transactional(readOnly = true)
class EmpresaLocacaoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def criteriaResult = EmpresaLocacao.createCriteria().list(params) {
            if (params.q) {
                or {
                    GrailsClassUtils?.getStaticPropertyValue(EmpresaLocacao, "searchFields")?.each {
                        def property = GrailsClassUtils?.getPropertyType(EmpresaLocacao, it)
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

        respond criteriaResult, model: [empresaLocacaoInstanceCount: criteriaResult.totalCount, query: params.q]
    }

    def show(EmpresaLocacao empresaLocacaoInstance) {
        respond empresaLocacaoInstance
    }

    def create() {
        respond new EmpresaLocacao(params)
    }

    @Transactional
    def save(EmpresaLocacao empresaLocacaoInstance) {
        if (empresaLocacaoInstance == null) {
            notFound()
            return
        }

        if (empresaLocacaoInstance.hasErrors()) {
            respond empresaLocacaoInstance.errors, view: 'create'
            return
        }

        empresaLocacaoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'empresaLocacao.label', default: 'EmpresaLocacao'), empresaLocacaoInstance.id])
                redirect(action: "edit", id: empresaLocacaoInstance?.id)
            }
            '*' { respond empresaLocacaoInstance, [status: CREATED] }
        }
    }

    def edit(EmpresaLocacao empresaLocacaoInstance) {
        respond empresaLocacaoInstance
    }

    @Transactional
    def update(EmpresaLocacao empresaLocacaoInstance) {
        if (empresaLocacaoInstance == null) {
            notFound()
            return
        }

        if (empresaLocacaoInstance.hasErrors()) {
            respond empresaLocacaoInstance.errors, view: 'edit'
            return
        }

        empresaLocacaoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EmpresaLocacao.label', default: 'EmpresaLocacao'), empresaLocacaoInstance.id])
                redirect(action: "edit", id: empresaLocacaoInstance?.id)
            }
            '*' { respond empresaLocacaoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EmpresaLocacao empresaLocacaoInstance) {

        if (empresaLocacaoInstance == null) {
            notFound()
            return
        }

        try {
            empresaLocacaoInstance.delete flush: true
        } catch (org.springframework.dao.DataIntegrityViolationException e) {
            EmpresaLocacao.withSession { session ->
                session.clear()
            }
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'EmpresaLocacao.label', default: 'EmpresaLocacao'), empresaLocacaoInstance.id])
            redirect(action: "edit", id: params.id)
            return
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EmpresaLocacao.label', default: 'EmpresaLocacao'), empresaLocacaoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'empresaLocacao.label', default: 'EmpresaLocacao'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}

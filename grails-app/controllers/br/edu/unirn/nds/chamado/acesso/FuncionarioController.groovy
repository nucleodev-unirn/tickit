package br.edu.unirn.nds.chamado.acesso


import org.springframework.dao.DataIntegrityViolationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsClassUtils

@Transactional(readOnly = true)
class FuncionarioController {

    static scaffold = true

//    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

/*
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def criteriaResult = Funcionario.createCriteria().list(params) {
            if (params.q) {
                or {
                    GrailsClassUtils?.getStaticPropertyValue(Funcionario, "searchFields")?.each {
                        def property = GrailsClassUtils?.getPropertyType(Funcionario, it)
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

        respond criteriaResult, model: [funcionarioInstanceCount: criteriaResult.totalCount, query: params.q]
    }
*/

/*
    def show(Funcionario funcionarioInstance) {
        respond funcionarioInstance
    }
*/

/*
    def create() {
        respond new Funcionario(params)
    }
*/

/*
    @Transactional
    def save(Funcionario funcionarioInstance) {
        if (funcionarioInstance == null) {
            notFound()
            return
        }

        if (funcionarioInstance.hasErrors()) {
            respond funcionarioInstance.errors, view: 'create'
            return
        }

        funcionarioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'funcionario.label', default: 'Funcionario'), funcionarioInstance.id])
                redirect(action: "edit", id: funcionarioInstance?.id)
            }
            '*' { respond funcionarioInstance, [status: CREATED] }
        }
    }
*/

/*
    def edit(Funcionario funcionarioInstance) {
        respond funcionarioInstance
    }
*/

/*
    @Transactional
    def update(Funcionario funcionarioInstance) {
        if (funcionarioInstance == null) {
            notFound()
            return
        }

        if (funcionarioInstance.hasErrors()) {
            respond funcionarioInstance.errors, view: 'edit'
            return
        }

        funcionarioInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Funcionario.label', default: 'Funcionario'), funcionarioInstance.id])
                redirect(action: "edit", id: funcionarioInstance?.id)
            }
            '*' { respond funcionarioInstance, [status: OK] }
        }
    }
*/

/*
    @Transactional
    def delete(Funcionario funcionarioInstance) {

        if (funcionarioInstance == null) {
            notFound()
            return
        }

        try {
            funcionarioInstance.delete flush: true
        } catch (org.springframework.dao.DataIntegrityViolationException e) {
            Funcionario.withSession { session ->
                session.clear()
            }
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'Funcionario.label', default: 'Funcionario'), funcionarioInstance.id])
            redirect(action: "edit", id: params.id)
            return
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Funcionario.label', default: 'Funcionario'), funcionarioInstance.id])
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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'funcionario.label', default: 'Funcionario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
*/
}

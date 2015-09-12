package br.edu.unirn.nds.chamado.base


import org.springframework.dao.DataIntegrityViolationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsClassUtils

@Transactional(readOnly = true)
class PessoaController {

    static scaffold = true

//    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

/*
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def criteriaResult = Pessoa.createCriteria().list(params) {
            if (params.q) {
                or {
                    GrailsClassUtils?.getStaticPropertyValue(Pessoa, "searchFields")?.each {
                        def property = GrailsClassUtils?.getPropertyType(Pessoa, it)
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

        respond criteriaResult, model: [pessoaInstanceCount: criteriaResult.totalCount, query: params.q]
    }
*/

/*
    def show(Pessoa pessoaInstance) {
        respond pessoaInstance
    }
*/

/*
    def create() {
        respond new Pessoa(params)
    }
*/

/*
    @Transactional
    def save(Pessoa pessoaInstance) {
        if (pessoaInstance == null) {
            notFound()
            return
        }

        if (pessoaInstance.hasErrors()) {
            respond pessoaInstance.errors, view: 'create'
            return
        }

        pessoaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), pessoaInstance.id])
                redirect(action: "edit", id: pessoaInstance?.id)
            }
            '*' { respond pessoaInstance, [status: CREATED] }
        }
    }
*/

/*
    def edit(Pessoa pessoaInstance) {
        respond pessoaInstance
    }
*/

/*
    @Transactional
    def update(Pessoa pessoaInstance) {
        if (pessoaInstance == null) {
            notFound()
            return
        }

        if (pessoaInstance.hasErrors()) {
            respond pessoaInstance.errors, view: 'edit'
            return
        }

        pessoaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Pessoa.label', default: 'Pessoa'), pessoaInstance.id])
                redirect(action: "edit", id: pessoaInstance?.id)
            }
            '*' { respond pessoaInstance, [status: OK] }
        }
    }
*/

/*
    @Transactional
    def delete(Pessoa pessoaInstance) {

        if (pessoaInstance == null) {
            notFound()
            return
        }

        try {
            pessoaInstance.delete flush: true
        } catch (org.springframework.dao.DataIntegrityViolationException e) {
            Pessoa.withSession { session ->
                session.clear()
            }
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'Pessoa.label', default: 'Pessoa'), pessoaInstance.id])
            redirect(action: "edit", id: params.id)
            return
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Pessoa.label', default: 'Pessoa'), pessoaInstance.id])
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
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
*/
}

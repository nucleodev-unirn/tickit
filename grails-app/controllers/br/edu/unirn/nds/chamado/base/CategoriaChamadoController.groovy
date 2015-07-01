package br.edu.unirn.nds.chamado.base

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsClassUtils

@Transactional(readOnly = true)
class CategoriaChamadoController {

    static allowedMethods = [salvar: "POST", update: "PUT", Excluir: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def criteriaResult = CategoriaChamado.createCriteria().list(params) {
            if (params.q) {
                or {
                    GrailsClassUtils?.getStaticPropertyValue(CategoriaChamado, "searchFields")?.each {
                        def property = GrailsClassUtils?.getPropertyType(CategoriaChamado, it)
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

        respond criteriaResult, model: [categoriaChamadoInstanceCount: criteriaResult.totalCount, query: params.q]
    }

    def visualizar(CategoriaChamado categoriaChamadoInstance) {
        respond categoriaChamadoInstance
    }

    def cadastrar() {
        respond new CategoriaChamado(params)
    }

    @Transactional
    def salvar(CategoriaChamado categoriaChamadoInstance) {
        if (categoriaChamadoInstance == null) {
            notFound()
            return
        }

        if (categoriaChamadoInstance.hasErrors()) {
            respond categoriaChamadoInstance.errors, view: 'cadastrar'
            return
        }

        categoriaChamadoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'categoriaChamado.label', default: 'CategoriaChamado'), categoriaChamadoInstance.id])
                redirect(action: "editar", id: categoriaChamadoInstance?.id)
            }
            '*' { respond categoriaChamadoInstance, [status: CREATED] }
        }
    }

    def editar(CategoriaChamado categoriaChamadoInstance) {
        respond categoriaChamadoInstance
    }

    @Transactional
    def update(CategoriaChamado categoriaChamadoInstance) {
        if (categoriaChamadoInstance == null) {
            notFound()
            return
        }

        if (categoriaChamadoInstance.hasErrors()) {
            respond categoriaChamadoInstance.errors, view: 'editar'
            return
        }

        categoriaChamadoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CategoriaChamado.label', default: 'CategoriaChamado'), categoriaChamadoInstance.id])
                redirect(action: "editar", id: categoriaChamadoInstance?.id)
            }
            '*' { respond categoriaChamadoInstance, [status: OK] }
        }
    }

    @Transactional
    def Excluir(CategoriaChamado categoriaChamadoInstance) {

        if (categoriaChamadoInstance == null) {
            notFound()
            return
        }

        try {
            categoriaChamadoInstance.delete flush: true
        } catch (org.springframework.dao.DataIntegrityViolationException e) {
            CategoriaChamado.withSession { session ->
                session.clear()
            }
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'CategoriaChamado.label', default: 'CategoriaChamado'), categoriaChamadoInstance.id])
            redirect(action: "editar", id: params.id)
            return
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CategoriaChamado.label', default: 'CategoriaChamado'), categoriaChamadoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'categoriaChamado.label', default: 'CategoriaChamado'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}

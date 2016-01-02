package br.edu.unirn.nds.chamado.problema


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsClassUtils

@Transactional(readOnly = true)
class InformacaoAdicionalController {

    static scaffold = true

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def criteriaResult = InformacaoAdicional.createCriteria().list(params) {
            if (params.q) {
                or {
                    GrailsClassUtils?.getStaticPropertyValue(InformacaoAdicional, "searchFields")?.each {
                        def property = GrailsClassUtils?.getPropertyType(InformacaoAdicional, it)
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

        respond criteriaResult, model: [informacaoAdicionalInstanceCount: criteriaResult.totalCount, query: params.q]
    }

    @Transactional
    def save(InformacaoAdicional informacaoAdicionalInstance) {
        if (informacaoAdicionalInstance == null) {
            notFound()
            return
        }

        if (informacaoAdicionalInstance.hasErrors()) {
            respond informacaoAdicionalInstance.errors, view: 'create'
            return
        }

        informacaoAdicionalInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'informacaoAdicional.label', default: 'InformacaoAdicional'), informacaoAdicionalInstance.id])
                redirect(action: "edit", id: informacaoAdicionalInstance?.id)
            }
            '*' { respond informacaoAdicionalInstance, [status: CREATED] }
        }
    }

    @Transactional
    def update(InformacaoAdicional informacaoAdicionalInstance) {
        if (informacaoAdicionalInstance == null) {
            notFound()
            return
        }

        if (informacaoAdicionalInstance.hasErrors()) {
            respond informacaoAdicionalInstance.errors, view: 'edit'
            return
        }

        informacaoAdicionalInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'InformacaoAdicional.label', default: 'InformacaoAdicional'), informacaoAdicionalInstance.id])
                redirect(action: "edit", id: informacaoAdicionalInstance?.id)
            }
            '*' { respond informacaoAdicionalInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(InformacaoAdicional informacaoAdicionalInstance) {

        if (informacaoAdicionalInstance == null) {
            notFound()
            return
        }

        try {
            informacaoAdicionalInstance.delete flush: true
        } catch (org.springframework.dao.DataIntegrityViolationException e) {
            InformacaoAdicional.withSession { session ->
                session.clear()
            }
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'InformacaoAdicional.label', default: 'InformacaoAdicional'), informacaoAdicionalInstance.id])
            redirect(action: "edit", id: params.id)
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'InformacaoAdicional.label', default: 'InformacaoAdicional'), informacaoAdicionalInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

}

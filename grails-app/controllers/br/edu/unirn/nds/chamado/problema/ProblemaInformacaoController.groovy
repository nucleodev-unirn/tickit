package br.edu.unirn.nds.chamado.problema


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsClassUtils

@Transactional(readOnly = true)
class ProblemaInformacaoController {

    static scaffold = true

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def criteriaResult = ProblemaInformacao.createCriteria().list(params) {
            if (params.q) {
                or {
                    GrailsClassUtils?.getStaticPropertyValue(ProblemaInformacao, "searchFields")?.each {
                        def property = GrailsClassUtils?.getPropertyType(ProblemaInformacao, it)
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

        respond criteriaResult, model: [problemaInformacaoInstanceCount: criteriaResult.totalCount, query: params.q]
    }

    @Transactional
    def save(ProblemaInformacao problemaInformacaoInstance) {
        if (problemaInformacaoInstance == null) {
            notFound()
            return
        }

        if (problemaInformacaoInstance.hasErrors()) {
            respond problemaInformacaoInstance.errors, view: 'create'
            return
        }

        problemaInformacaoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'problemaInformacao.label', default: 'ProblemaInformacao'), problemaInformacaoInstance.id])
                redirect(action: "edit", id: problemaInformacaoInstance?.id)
            }
            '*' { respond problemaInformacaoInstance, [status: CREATED] }
        }
    }

    @Transactional
    def update(ProblemaInformacao problemaInformacaoInstance) {
        if (problemaInformacaoInstance == null) {
            notFound()
            return
        }

        if (problemaInformacaoInstance.hasErrors()) {
            respond problemaInformacaoInstance.errors, view: 'edit'
            return
        }

        problemaInformacaoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ProblemaInformacao.label', default: 'ProblemaInformacao'), problemaInformacaoInstance.id])
                redirect(action: "edit", id: problemaInformacaoInstance?.id)
            }
            '*' { respond problemaInformacaoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ProblemaInformacao problemaInformacaoInstance) {

        if (problemaInformacaoInstance == null) {
            notFound()
            return
        }

        try {
            problemaInformacaoInstance.delete flush: true
        } catch (org.springframework.dao.DataIntegrityViolationException e) {
            ProblemaInformacao.withSession { session ->
                session.clear()
            }
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'ProblemaInformacao.label', default: 'ProblemaInformacao'), problemaInformacaoInstance.id])
            redirect(action: "edit", id: params.id)
            return
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ProblemaInformacao.label', default: 'ProblemaInformacao'), problemaInformacaoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

}

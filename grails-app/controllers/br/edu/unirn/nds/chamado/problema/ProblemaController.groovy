package br.edu.unirn.nds.chamado.problema


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsClassUtils

@Transactional(readOnly = true)
class ProblemaController {

    static scaffold = true


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def criteriaResult = Problema.createCriteria().list(params) {
            if (params.q) {
                or {
                    GrailsClassUtils?.getStaticPropertyValue(Problema, "searchFields")?.each {
                        def property = GrailsClassUtils?.getPropertyType(Problema, it)
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

        respond criteriaResult, model:[problemaInstanceCount: criteriaResult.totalCount, query: params.q]
    }

    @Transactional
    def save(Problema problemaInstance) {
        if (problemaInstance == null) {
            notFound()
            return
        }

        problemaInstance.cadastradoPor = session?.usuario

        problemaInstance.save flush:true

        if (problemaInstance.hasErrors()) {
            respond problemaInstance.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'problema.label', default: 'Problema'), problemaInstance.id])
                redirect(action: "edit", id: problemaInstance?.id)
            }
            '*' { respond problemaInstance, [status: CREATED] }
        }
    }

    @Transactional
    def update(Problema problemaInstance) {
        if (problemaInstance == null) {
            notFound()
            return
        }

        if (problemaInstance.hasErrors()) {
            respond problemaInstance.errors, view:'edit'
            return
        }

        problemaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Problema.label', default: 'Problema'), problemaInstance.id])
                redirect(action: "edit", id: problemaInstance?.id)
            }
            '*'{ respond problemaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Problema problemaInstance) {

        if (problemaInstance == null) {
            notFound()
            return
        }

        try{
            problemaInstance.delete flush:true
        }catch (org.springframework.dao.DataIntegrityViolationException e){
            Problema.withSession { session ->
                session.clear()
            }
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'Problema.label', default: 'Problema'), problemaInstance.id])
            redirect(action: "edit", id: params.id)
            return
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Problema.label', default: 'Problema'), problemaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

}

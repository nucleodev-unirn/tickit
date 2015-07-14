package br.edu.unirn.nds.chamado.equipamentos


import org.springframework.dao.DataIntegrityViolationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsClassUtils

@Transactional(readOnly = true)
class EquipamentoChamadoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def criteriaResult = EquipamentoChamado.createCriteria().list(params) {
            if (params.q) {
                or {
                    GrailsClassUtils?.getStaticPropertyValue(EquipamentoChamado, "searchFields")?.each {
                        def property = GrailsClassUtils?.getPropertyType(EquipamentoChamado, it)
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

        respond criteriaResult, model: [equipamentoChamadoInstanceCount: criteriaResult.totalCount, query: params.q]
    }

    def show(EquipamentoChamado equipamentoChamadoInstance) {
        respond equipamentoChamadoInstance
    }

    def create() {
        respond new EquipamentoChamado(params)
    }

    @Transactional
    def save(EquipamentoChamado equipamentoChamadoInstance) {
        if (equipamentoChamadoInstance == null) {
            notFound()
            return
        }

        if (equipamentoChamadoInstance.hasErrors()) {
            respond equipamentoChamadoInstance.errors, view: 'create'
            return
        }

        equipamentoChamadoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'equipamentoChamado.label', default: 'EquipamentoChamado'), equipamentoChamadoInstance.id])
                redirect(action: "edit", id: equipamentoChamadoInstance?.id)
            }
            '*' { respond equipamentoChamadoInstance, [status: CREATED] }
        }
    }

    def edit(EquipamentoChamado equipamentoChamadoInstance) {
        respond equipamentoChamadoInstance
    }

    @Transactional
    def update(EquipamentoChamado equipamentoChamadoInstance) {
        if (equipamentoChamadoInstance == null) {
            notFound()
            return
        }

        if (equipamentoChamadoInstance.hasErrors()) {
            respond equipamentoChamadoInstance.errors, view: 'edit'
            return
        }

        equipamentoChamadoInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EquipamentoChamado.label', default: 'EquipamentoChamado'), equipamentoChamadoInstance.id])
                redirect(action: "edit", id: equipamentoChamadoInstance?.id)
            }
            '*' { respond equipamentoChamadoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EquipamentoChamado equipamentoChamadoInstance) {

        if (equipamentoChamadoInstance == null) {
            notFound()
            return
        }

        try {
            equipamentoChamadoInstance.delete flush: true
        } catch (org.springframework.dao.DataIntegrityViolationException e) {
            EquipamentoChamado.withSession { session ->
                session.clear()
            }
            flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'EquipamentoChamado.label', default: 'EquipamentoChamado'), equipamentoChamadoInstance.id])
            redirect(action: "edit", id: params.id)
            return
        }


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EquipamentoChamado.label', default: 'EquipamentoChamado'), equipamentoChamadoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'equipamentoChamado.label', default: 'EquipamentoChamado'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}

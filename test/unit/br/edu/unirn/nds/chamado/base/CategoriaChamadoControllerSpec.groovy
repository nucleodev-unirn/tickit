package br.edu.unirn.nds.chamado.base


import grails.test.mixin.*
import spock.lang.*

@TestFor(CategoriaChamadoController)
@Mock(CategoriaChamado)
class CategoriaChamadoControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.categoriaChamadoInstanceList
        model.categoriaChamadoInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.categoriaChamadoInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The salvar action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        def categoriaChamado = new CategoriaChamado()
        categoriaChamado.validate()
        controller.salvar(categoriaChamado)

        then: "The create view is rendered again with the correct model"
        model.categoriaChamadoInstance != null
        view == 'create'

        when: "The salvar action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        categoriaChamado = new CategoriaChamado(params)

        controller.salvar(categoriaChamado)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/categoriaChamado/show/1'
        controller.flash.message != null
        CategoriaChamado.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def categoriaChamado = new CategoriaChamado(params)
        controller.show(categoriaChamado)

        then: "A model is populated containing the domain instance"
        model.categoriaChamadoInstance == categoriaChamado
    }

    void "Test that the edit action returns the correct model"() {
        when: "The editar action is executed with a null domain"
        controller.editar(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the editar action"
        populateValidParams(params)
        def categoriaChamado = new CategoriaChamado(params)
        controller.editar(categoriaChamado)

        then: "A model is populated containing the domain instance"
        model.categoriaChamadoInstance == categoriaChamado
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'PUT'
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/categoriaChamado/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def categoriaChamado = new CategoriaChamado()
        categoriaChamado.validate()
        controller.update(categoriaChamado)

        then: "The editar view is rendered again with the invalid instance"
        view == 'editar'
        model.categoriaChamadoInstance == categoriaChamado

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        categoriaChamado = new CategoriaChamado(params).save(flush: true)
        controller.update(categoriaChamado)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/categoriaChamado/show/$categoriaChamado.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The Excluir action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        controller.Excluir(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/categoriaChamado/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def categoriaChamado = new CategoriaChamado(params).save(flush: true)

        then: "It exists"
        CategoriaChamado.count() == 1

        when: "The domain instance is passed to the Excluir action"
        controller.Excluir(categoriaChamado)

        then: "The instance is deleted"
        CategoriaChamado.count() == 0
        response.redirectedUrl == '/categoriaChamado/index'
        flash.message != null
    }
}

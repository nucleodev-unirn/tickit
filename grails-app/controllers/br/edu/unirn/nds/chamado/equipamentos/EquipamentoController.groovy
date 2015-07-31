package br.edu.unirn.nds.chamado.equipamentos

import br.edu.unirn.nds.chamado.acesso.Usuario
import br.edu.unirn.nds.chamado.base.EmpresaLocacao
import grails.converters.JSON
import grails.transaction.Transactional
import grails.validation.ValidationErrors
import org.codehaus.groovy.grails.commons.GrailsClassUtils

@Transactional(readOnly = true)
class EquipamentoController {

    static scaffold = true

    def index(Integer max) {
        if(params.q instanceof String){
            params.q = JSON.parse(params.q)
        }
        def hasQuery = false
        params.max = Math.min(max ?: 10, 100)
        def criteriaResult = Equipamento.createCriteria().list(params) {
            if (params.q?.pesquisaSimples) {
                or {
                    GrailsClassUtils?.getStaticPropertyValue(Equipamento, "searchFields")?.each {
                        def property = GrailsClassUtils?.getPropertyType(Equipamento, it)
                        if (property && Number.isAssignableFrom(property) || (property?.isPrimitive() && property != boolean)) {
                            if (property == Integer)
                                eq(it, params.q.pesquisaSimplesparams.toInterge())
                        } else if (property == String) {
                            ilike(it, params.q.pesquisaSimples + "%")
                        }
                    }
                }
            }else{
                and{
                    if(params.q?.nomeEquipamento){
                        hasQuery = true
                        ilike("nome", params.q.nomeEquipamento + "%")
                    }
                    if(params.q?.tombamento){
                        hasQuery = true
                        ilike("tombamento", params.q.tombamento + "%")
                    }
                    if(params.q?.mac){
                        hasQuery = true
                        ilike("mac", params.q.mac + "%")
                    }
                    if(params.q?.statusEquipamento){
                        hasQuery = true
                        eq("statusEquipamento", StatusEquipamento.get(params.q.statusEquipamento.toLong()))
                    }
                    if(params.q?.tipoEquipamento){
                        hasQuery = true
                        eq("tipoEquipamento", TipoEquipamento.get(params.q.tipoEquipamento.toLong()))
                    }
                    if(params.q?.empresaLocacao){
                        hasQuery = true
                        eq("empresaLocacao", EmpresaLocacao.get(params.q.empresaLocacao.toLong()))
                    }
                    if(params.q?.locado){
                        hasQuery = true
                        eq("locado", params.q.locado.toBoolean())
                    }
                }


            }
        }

        respond criteriaResult, model: [equipamentoInstanceCount: criteriaResult.totalCount, q: params.q, hasQuery: hasQuery]
    }

    def ultimoStatus(Equipamento equipamento){
        def ultimaAlteracao = AlteracaoStatusEquipamento.findAllByEquipamento(equipamento,[max: 1, sort:"dateCreated", order:"desc"])
        def result = [
                equipamento: [id: equipamento?.id, nome: equipamento?.nome],
                ultimoStatus: [id: ultimaAlteracao.statusEquipamento?.id, nome: ultimaAlteracao.statusEquipamento?.nome]
        ]
        render result as JSON
    }

    def ultimoSetor(Equipamento equipamento){
        def ultimoSetor = EquipamentoSetor.findAllByEquipamento(equipamento,[max: 1, sort:"dateCreated", order:"desc"])
        def result = [
                equipamento: [id: equipamento?.id, nome: equipamento?.nome],
                ultimoSetor: [id: ultimoSetor.setor?.id, nome: ultimoSetor.setor?.nome]
        ]
        render result as JSON
    }

    def informacoes(Equipamento equipamento){
        render equipamento as JSON
    }

    def alterarStatus(){
        AlteracaoStatusEquipamento statusEquipamento = new AlteracaoStatusEquipamento(params)
        statusEquipamento.cadastradoPor = Usuario.get(session.usuario?.id)
        if(!statusEquipamento.save(flush: true)){
            render status: 500, text: "Ocorreu um erro."
            return
        }

        render status: 200, text: "Salvo com sucesso!"
    }

    def alterarSetor(){
        EquipamentoSetor equipamentoSetor = new EquipamentoSetor(params)
        equipamentoSetor.cadastradoPor = Usuario.get(session.usuario?.id)
        if(!equipamentoSetor.save(flush: true)){
            equipamentoSetor.errors.each {println it}
            render status: 500, text: "Ocorreu um erro."
            return
        }

        render status: 200, text: "Salvo com sucesso!"
    }
}

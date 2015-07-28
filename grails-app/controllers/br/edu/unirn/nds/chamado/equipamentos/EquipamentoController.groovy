package br.edu.unirn.nds.chamado.equipamentos
import br.edu.unirn.nds.chamado.base.EmpresaLocacao
import grails.converters.JSON
import grails.transaction.Transactional
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
}

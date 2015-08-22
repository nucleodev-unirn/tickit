package br.edu.unirn.nds.chamado.base

import br.edu.unirn.nds.chamado.equipamentos.Equipamento
import br.edu.unirn.nds.chamado.equipamentos.TipoEquipamento
import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.commons.GrailsClassUtils

@Transactional(readOnly = true)
class ChamadoController {

    static scaffold = true

    def index(Integer max) {
        if (params.q instanceof String) {
            params.q = JSON.parse(params.q)
        }
        def hasQuery = false
        params.max = Math.min(max ?: 10, 100)
        def criteriaResult = Chamado.createCriteria().list(params)
                {
                    if (params.q?.pequisaSimples) {
                        or {
                            GrailsClassUtils?.getStaticPropertyValue(Chamado, "searchFilders")?.each {
                                if (property && Number.isAssignableFrom(property) || (property?.isPrimitive() && property != boolean)) {
                                    if (property == Integer)
                                        eq(it, params.q.pesquisaSimplesparams.toInterge())
                                } else if (property == String) {
                                    ilike(it, params.q.pesquisaSimples + "%")
                                }
                            }
                        }
                    }
                    else
                    {
                        createAlias("equipamento", "e")
                        and
                                {
                                    if (params.q?.setorSolicitante) {
                                        hasQuery = true
                                        eq("setor", Setor.get(params.q.setorSolicitante.toLong()))
                                    }
                                    if (params.q?.equipamento) {
                                        hasQuery = true
                                        eq("equipamento", Equipamento.get(params.q.equipamento.toLong()))
                                    }
                                    if (params.q?.tipoEquipamento) {
                                        hasQuery = true
                                        eq("e.tipoEquipamento", TipoEquipamento.get(params.q.tipoEquipamento.toLong()))
                                    }
                                    if (params.q?.locado) {
                                        hasQuery = true
                                        eq("e.locado", params.q.locado)
                                    }
                                    if (params.q?.categoriaChamado) {
                                        hasQuery = true
                                        eq("categoriaChamado", CategoriaChamado.get(params.q.categoriaChamado.toLong()))
                                    }
                                    if (params.q?.statusChamado) {
                                        hasQuery = true
                                        eq("statusChamado", Chamado.get(params.q.statusChamado.toLong()))
                                    }
                                    if (params.q?.nomeSolicitante) {
                                        hasQuery = true
                                        eq("nomeSolicitante", Chamado.get(params.q.nomeSolicitante.toLong()))
                                    }
                                    if (params.q?.dataInicial && params.q?.dataFinal) {
                                        hasQuery = true
                                        between("dateCreated", params.q.dataIncial, params.q.dataFinal)
                                    }
                                }
                    }
                }

        respond criteriaResult, model: [chamadoInstanceCount: criteriaResult.totalCount, q: params.q, hasQuery: hasQuery]
    }
}

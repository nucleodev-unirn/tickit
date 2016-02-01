package br.edu.unirn.nds.chamado.base

import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

import org.codehaus.groovy.grails.commons.GrailsClassUtils

import br.edu.unirn.nds.chamado.ChamadoService;

@Transactional(readOnly = true)
class ChamadoController {

	static scaffold = true
	
	ChamadoService chamadoService

	def index(Integer max) {
		println "\n\t\t ===== params:"
		params.each {println it}

		if (params.q instanceof String) {
			params.q = JSON.parse(params.q)
		}
		println "\n\tparams.q : \n${params.q}"

		def hasQuery = false
		params.max = Math.min(max ?: 10, 100)
		//        def criteriaResult = EquipamentoChamado.createCriteria().list(params)
		def criteriaResult = Chamado.createCriteria().list(params)
		{
			if (params?.q?.pequisaSimples) {
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
				//                        createAlias("chamado", "c")
				//                        createAlias("equipamento", "e")
				and
				{
					if (params?.q?.setorSolicitante) {
						hasQuery = true
						eq("setor", Setor.get(params.q.setorSolicitante?.toLong()))
					}
					/*if (params?.q?.equipamento) {
					 hasQuery = true
					 eq("equipamento", Equipamento.get(params.q.equipamento?.toLong()))
					 }
					 if (params?.q?.tipoEquipamento) {
					 hasQuery = true
					 eq("e.tipoEquipamento", TipoEquipamento.get(params.q.tipoEquipamento?.toLong()))
					 }
					 if (params?.q?.locado) {
					 hasQuery = true
					 eq("e.locado", params.q.locado)
					 }*/
					if (params?.q?.categoriaChamado) {
						hasQuery = true
						eq("categoriaChamado", CategoriaChamado.get(params.q.categoriaChamado?.toLong()))
					}
					if (params?.q?.statusChamado) {
						hasQuery = true
						eq("statusChamado", Chamado.get(params.q.statusChamado?.toLong()))
					}
					if (params?.q?.nomeSolicitante) {
						hasQuery = true
						eq("nomeSolicitante", Chamado.get(params.q.nomeSolicitante?.toLong()))
					}
					if (params?.q?.dataInicial && params.q?.dataFinal) {
						hasQuery = true
						between("dateCreated", params.q.dataIncial, params.q.dataFinal)
					}
				}
			}
		}

		println "\n\t\t ===== criteriaResult : \n${criteriaResult}"

		respond criteriaResult, model: [chamadoInstanceCount: criteriaResult.totalCount, q: params.q, hasQuery: hasQuery]
	}

	
	@Transactional
	def save(Chamado chamadoInstance) {
		withForm{
			if (chamadoInstance == null) {
				notFound()
				return
			}

			chamadoInstance = chamadoService.saveChamado(params,  session)
			chamadoInstance.save flush:true

			if (chamadoInstance.hasErrors()) {
				respond chamadoInstance.errors, view:'create'
				return
			}

			request.withFormat {
				form multipartForm {
					flash.message = message(code: 'default.created.message', args: [message(code: 'chamado.label', default: 'Chamado'), chamadoInstance])
					redirect(action: "show", id: chamadoInstance?.id)
				}
				'*' { respond chamadoInstance, [status: CREATED] }
			}
		}.invalidToken{
			flash.message = "Requisição inválida. Por favor, Tente reiniciar a operação."
			redirect action:"create"
		}
		
	}
	
	
	/*@Transactional
	def update(Chamado chamadoInstance) {
		if (chamadoInstance == null) {
			notFound()
			return
		}

		if (chamadoInstance.hasErrors()) {
			respond chamadoInstance.errors, view:'edit'
			return
		}

		chamadoInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [message(code: 'chamado.label', default: 'Chamado'), chamadoInstance])
				redirect(action: "show", id: chamadoInstance?.id)
			}
			'*'{ respond chamadoInstance, [status: OK] }
		}
	}*/

	/*@Transactional
	def delete(Chamado chamadoInstance) {

		if (chamadoInstance == null) {
			notFound()
			return
		}

		try{
			chamadoInstance.delete flush:true
		}catch (org.springframework.dao.DataIntegrityViolationException e){
			Chamado.withSession { session ->
				session.clear()
			}
			flash.error = message(code: 'default.not.deleted.message', args: [message(code: 'chamado.label', default: 'Chamado'), chamadoInstance.id])
			redirect(action: "index")
			return
		}


		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [message(code: 'chamado.label', default: 'Chamado'), chamadoInstance.id])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}*/


}

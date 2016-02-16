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

		params.max = Math.min(max ?: 10, 100)
		Chamado chamadoInstance = new Chamado()
		def criteriaResult = Chamado.createCriteria().list(params) {

			if(params?.pesquisaSimples){
				or {
					GrailsClassUtils?.getStaticPropertyValue(Chamado, "searchFilders")?.each {
						if (chamadoInstance && Number.isAssignableFrom(chamadoInstance) || (chamadoInstance?.isPrimitive() && chamadoInstance != boolean)) {
							if (chamadoInstance == Integer)
								eq(it, params.pesquisaSimples.toInterge())
						} else if (chamadoInstance == String) {
							ilike(it, params.pesquisaSimples + "%")
						}
					}
				}
			}else {
				and{
					if(params?.dataInicio && params?.dataFim)
						between("dateCreated",params?.dataInicio,params?.dataFim)

					if(params?.setorSolicitante){
						createAlias("setorSolicitante","setorSolicitante")
						eq("setorSolicitante.id",params?.setorSolicitante?.id?.toLong())
					}
					if(params?.cadastradoPor){
						createAlias("cadastradoPor","cadastradoPor")
						createAlias("cadastradoPor.funcionario","funcionario")
						createAlias("funcionario.pessoa","pessoa")
						ilike("pessoa.nome", "%"+params?.cadastradoPor+"%")
					}
					/*if(params?.equipamento){
						createAlias("equipamento","equipamento")
						eq("equipamento.id",params?.equipamento?.id?.toLong())
					}
					if(params?.tipoEquipamento)
					if(params?.equipamento){}*/
					if(params?.categoriaChamado){
						createAlias("categoriaChamado","categoriaChamado")
						eq("categoriaChamado.id",params?.categoriaChamado?.id?.toLong())
					}
					if(params?.ativo)
						eq("ativo",params?.ativo?.toBoolean())
				}
			}

		}

		respond criteriaResult, model:[chamadoInstanceCount: criteriaResult.totalCount, params:params]
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
			flash.message = "Requisi��o inv�lida. Por favor, Tente reiniciar a opera��o."
			redirect action:"create"
		}
		
	}

}

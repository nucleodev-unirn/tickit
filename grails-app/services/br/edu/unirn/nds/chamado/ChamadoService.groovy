package br.edu.unirn.nds.chamado

import grails.transaction.Transactional

import javax.servlet.http.HttpSession

import br.edu.unirn.nds.chamado.base.Chamado

@Transactional
class ChamadoService {
	
	def mailService

	Chamado saveChamado(Map params, HttpSession session){
		def chamadoInstance = new Chamado(params)
		chamadoInstance.with{
			problema = params?.problema
			titulo = params?.titulo
			nomeSolicitante = params?.nomeSolicitante
			emailSolicitante = params?.emailSolicitante
			descricao = params?.descricao
			tags = params?.tags
			cadastradoPor = session?.usuario
		}
		
		chamadoInstance.clearErrors()
		chamadoInstance.save flush:true
		
		if(!chamadoInstance.hasErrors()){
			mailService.sendMail {
				to chamadoInstance?.emailSolicitante
				subject "[UNIRN/TickIT] Confirma��o de Abertura de Chamado"
				body "Seu Chamado, ${chamadoInstance}, foi aberto com sucesso. \nPara detalhes, acesse www.nucleodev.unirn.edu.br/tickit"
			}
		}
		
		chamadoInstance
	}
	
}
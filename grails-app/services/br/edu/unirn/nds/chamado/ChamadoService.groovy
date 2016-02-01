package br.edu.unirn.nds.chamado

import grails.transaction.Transactional

import javax.servlet.http.HttpSession

import br.edu.unirn.nds.chamado.base.Chamado
import br.edu.unirn.nds.chamado.problema.Problema;

@Transactional
class ChamadoService {
	
	def mailService

	Chamado saveChamado(Map params, HttpSession session){
		def chamadoInstance = new Chamado(params)
		chamadoInstance.with{
			problema = Problema.get( params?.problema?.id )
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
				subject "[UNIRN/TickIT] Confirmação de Abertura de Chamado"
				body """Seu Chamado, ${chamadoInstance}, foi aberto com sucesso. \nPara detalhes, acesse www.nucleodev.unirn.edu.br/tickit

-------------
Esta é uma mensagem automática. Não é necessário respondê-la.
NDS-UNIRN
"""
			}
		}
		
		chamadoInstance
	}
	
}

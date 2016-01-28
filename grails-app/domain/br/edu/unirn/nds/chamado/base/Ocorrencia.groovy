package br.edu.unirn.nds.chamado.base

import br.edu.unirn.nds.chamado.acesso.Usuario

class Ocorrencia {
	
	String descricao
	Boolean ativo = Boolean.TRUE
	
	Date dateCreated
	Usuario cadastradoPor

    static constraints = {
		descricao()
		cadastradoPor()
		
		ativo()
		dateCreated()
    }
}

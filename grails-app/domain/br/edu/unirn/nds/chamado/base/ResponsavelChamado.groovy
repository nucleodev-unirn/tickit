package br.edu.unirn.nds.chamado.base

import br.edu.unirn.nds.chamado.acesso.Usuario

class ResponsavelChamado {

    Usuario responsavel
    Chamado chamado

    Boolean ativo = Boolean.TRUE

    Date dateCreated
    Date lastUpdated
    Date dataDesativacao

    Usuario cadastradoPor
    Usuario ultimaAtualizacaoPor
    Usuario desativadoPor

    static constraints = {
        responsavel()
        chamado()

        ativo()
        cadastradoPor ()
        dateCreated ()
        lastUpdated (nullable: true)
        ultimaAtualizacaoPor (nullable: true)
        dataDesativacao (nullable: true)
        desativadoPor (nullable: true)
    }
}

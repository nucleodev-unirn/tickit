package br.edu.unirn.nds.chamado.base

import br.edu.unirn.nds.chamado.acesso.Usuario

class AnexoChamado {

    String enderecoAnexo
    Chamado chamado

    Boolean ativo = Boolean.TRUE
    Usuario cadastradoPor
    Date dateCreated
    Usuario ultimaAtualizacaoPor
    Date lastUpdated
    Usuario desativadoPor
    Date dataDesativacao

    static constraints = {
        enderecoAnexo()
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

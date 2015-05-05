package br.edu.unirn.nds.chamado.base

import br.edu.unirn.nds.chamado.acesso.Usuario

/**
 * ABERTO, PENDENTE, EM ANDAMENTO, CANCELADO, RESOLVIDO
 */
class StatusChamado {

    String nome
    String descricao
    Boolean ativo = Boolean.TRUE

    Usuario cadastradoPor
    Date dateCreated
    Usuario ultimaAtualizacaoPor
    Date lastUpdated
    Usuario desativadoPor
    Date dataDesativacao

    static constraints = {
        nome()
        descricao()
        ativo()

        cadastradoPor ()
        dateCreated ()
        ultimaAtualizacaoPor ()
        lastUpdated ()
        desativadoPor ()
        dataDesativacao ()
    }
}

package br.edu.unirn.nds.chamado.base

import br.edu.unirn.nds.chamado.acesso.Usuario

/**
 * ABERTO, PENDENTE, EM ANDAMENTO, CANCELADO, RESOLVIDO
 */
class StatusChamado {

    String nome
    String descricao
    Boolean ativo = Boolean.TRUE

    Date dateCreated
    Date lastUpdated
    Date dataDesativacao

    Usuario cadastradoPor
    Usuario ultimaAtualizacaoPor
    Usuario desativadoPor

    static constraints = {
        nome()
        descricao nullable: true
        ativo()

        dateCreated ()
        lastUpdated ()
        cadastradoPor attributes: [showInList: false]
        ultimaAtualizacaoPor nullable: true, attributes: [ showInForm: false, showInList: false]
        desativadoPor nullable: true, attributes: [ showInForm: false, showInList: false]
        dataDesativacao nullable: true, attributes: [ showInForm: false, showInList: false]
    }

    static searchFields = ["nome","descricao"]
}

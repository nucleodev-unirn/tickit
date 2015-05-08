package br.edu.unirn.nds.chamado.equipamentos

import br.edu.unirn.nds.chamado.acesso.Usuario

/**
 * FUNCIONANDO, DEFEITUOSO, EM MANUTENCAO, DESCARTADO (neste estado, não aparece nas listagens)
 */
class StatusEquipamento {

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
        nome ()
        descricao nullable: true
        ativo ()

        dateCreated ()
        lastUpdated ()
        cadastradoPor attributes: [showInList: false]
        ultimaAtualizacaoPor nullable: true, attributes: [ showInForm: false, showInList: false]
        desativadoPor nullable: true, attributes: [ showInForm: false, showInList: false]
        dataDesativacao nullable: true, attributes: [ showInForm: false, showInList: false]
    }

    static searchFields = ["nome","descricao"]
}

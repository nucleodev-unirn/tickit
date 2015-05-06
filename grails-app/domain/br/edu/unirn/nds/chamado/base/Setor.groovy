package br.edu.unirn.nds.chamado.base

import br.edu.unirn.nds.chamado.acesso.Usuario

class Setor {

    String nome

    Boolean ativo = Boolean.TRUE

    Date dateCreated
    Date lastUpdated
    Date dataDesativacao

    Usuario cadastradoPor
    Usuario ultimaAtualizacaoPor
    Usuario desativadoPor

    static constraints = {
        nome ()
        ativo ()

        cadastradoPor attributes: [showInList: false]
        ultimaAtualizacaoPor nullable: true, attributes: [ showInForm: false, showInList: false]
        desativadoPor nullable: true, attributes: [ showInForm: false, showInList: false]
        dataDesativacao nullable: true, attributes: [ showInForm: false, showInList: false]
    }
}

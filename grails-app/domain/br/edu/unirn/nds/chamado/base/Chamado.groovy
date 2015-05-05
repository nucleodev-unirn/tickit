package br.edu.unirn.nds.chamado.base

import br.edu.unirn.nds.chamado.acesso.Usuario

class Chamado {

    Setor setorSolicitante
    String titulo
    String nomeSolicitante
    String emailSolicitante
    String descricao
    String avaliacao
    String tags

    Boolean ativo = Boolean.TRUE
    Usuario cadastradoPor
    Date dateCreated
    Usuario ultimaAtualizacaoPor
    Date lastUpdated
    Usuario desativadoPor
    Date dataDesativacao

    static constraints = {
        setorSolicitante()
        titulo()
        nomeSolicitante()
        emailSolicitante()
        descricao()
        avaliacao()
        tags()

        ativo()
        cadastradoPor ()
        dateCreated ()
        ultimaAtualizacaoPor ()
        lastUpdated ()
        desativadoPor ()
        dataDesativacao ()
    }
}

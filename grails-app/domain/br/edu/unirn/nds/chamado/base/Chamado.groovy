package br.edu.unirn.nds.chamado.base

import br.edu.unirn.nds.chamado.acesso.Usuario

class Chamado {

    CategoriaChamado categoriaChamado
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
        categoriaChamado()
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

    static searchFields = ["titulo", "nomeSolicitante", "emailSolicitante", "descricao" , "avaliacao" , "tags" ]

    @Override
    String toString() {
        "${titulo} - ${nomeSolicitante}"
    }
}

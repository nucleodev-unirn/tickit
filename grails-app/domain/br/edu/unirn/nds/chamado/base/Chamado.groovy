package br.edu.unirn.nds.chamado.base

import br.edu.unirn.nds.chamado.acesso.Usuario
import br.edu.unirn.nds.chamado.problema.Problema

class Chamado {

    CategoriaChamado categoriaChamado
    Problema problema
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
        problema()
        setorSolicitante()
        titulo()
        nomeSolicitante()
        emailSolicitante()
        descricao()
        avaliacao(nullable: true)
        tags()

        ativo()
        cadastradoPor ()
        dateCreated ()
        lastUpdated (nullable: true)
        ultimaAtualizacaoPor (nullable: true)
        dataDesativacao (nullable: true)
        desativadoPor (nullable: true)
    }

    static searchFields = ["titulo", "nomeSolicitante", "emailSolicitante", "descricao" , "avaliacao" , "tags" ]

    @Override
    String toString() {
        "${titulo} - ${nomeSolicitante}"
    }
}

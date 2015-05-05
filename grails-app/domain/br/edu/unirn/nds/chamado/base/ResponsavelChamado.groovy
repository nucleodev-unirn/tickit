package br.edu.unirn.nds.chamado.base

import br.edu.unirn.nds.chamado.acesso.Usuario

class ResponsavelChamado {

    Usuario responsavel
    Chamado chamado

    boolean ativo
    Usuario cadastradoPor
    Date dateCreated
    Usuario ultimaAtualizacaoPor
    Date lastUpdated
    Usuario desativadoPor
    Date dataDesativacao

    static constraints = {
        responsavel()
        chamado()

        ativo()
        cadastradoPor ()
        dateCreated ()
        ultimaAtualizacaoPor ()
        lastUpdated ()
        desativadoPor ()
        dataDesativacao ()
    }
}

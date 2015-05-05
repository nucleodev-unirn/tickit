package br.edu.unirn.nds.chamado.equipamentos

import br.edu.unirn.nds.chamado.acesso.Usuario

class TipoEquipamento {

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
        nome ()
        descricao ()
        ativo ()
        cadastradoPor ()
        dateCreated ()
        ultimaAtualizacaoPor ()
        lastUpdated ()
        desativadoPor ()
        dataDesativacao ()
    }
}

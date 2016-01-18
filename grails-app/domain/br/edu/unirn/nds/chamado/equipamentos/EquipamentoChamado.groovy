package br.edu.unirn.nds.chamado.equipamentos

import br.edu.unirn.nds.chamado.acesso.Usuario
import br.edu.unirn.nds.chamado.base.Chamado

class EquipamentoChamado {

    Equipamento equipamento
    Chamado chamado

    Boolean ativo = Boolean.TRUE
    Usuario cadastradoPor
    Date dateCreated
    Usuario ultimaAtualizacaoPor
    Date lastUpdated
    Usuario desativadoPor
    Date dataDesativacao

    static constraints = {
        equipamento()
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

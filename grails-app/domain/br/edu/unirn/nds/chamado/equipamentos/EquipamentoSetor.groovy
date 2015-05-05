package br.edu.unirn.nds.chamado.equipamentos

import br.edu.unirn.nds.chamado.acesso.Usuario
import br.edu.unirn.nds.chamado.base.Setor

class EquipamentoSetor {

    Setor setor
    Equipamento equipamento

    boolean ativo
    Usuario cadastradoPor
    Date dateCreated
    Usuario ultimaAtualizacaoPor
    Date lastUpdated
    Usuario desativadoPor
    Date dataDesativacao

    static constraints = {
        setor()
        equipamento()

        ativo()
        cadastradoPor ()
        dateCreated ()
        ultimaAtualizacaoPor ()
        lastUpdated ()
        desativadoPor ()
        dataDesativacao ()
    }
}

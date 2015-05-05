package br.edu.unirn.nds.chamado.equipamentos

import br.edu.unirn.nds.chamado.acesso.Usuario

class AlteracaoStatusEquipamento {

    String observacao
    StatusEquipamento statusEquipamento
    Equipamento equipamento

    boolean ativo
    Usuario cadastradoPor
    Date dateCreated
    Usuario ultimaAtualizacaoPor
    Date lastUpdated
    Usuario desativadoPor
    Date dataDesativacao

    static constraints = {
        observacao()
        statusEquipamento()
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

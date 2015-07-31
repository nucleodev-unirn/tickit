package br.edu.unirn.nds.chamado.equipamentos

import br.edu.unirn.nds.chamado.acesso.Usuario

class AlteracaoStatusEquipamento {

    String observacao
    StatusEquipamento statusEquipamento
    Equipamento equipamento

    Date dateCreated

    Boolean ativo = Boolean.TRUE
    Usuario cadastradoPor

    static constraints = {
        observacao()
        statusEquipamento()
        equipamento()

        ativo()
        cadastradoPor ()
        dateCreated ()
    }
}

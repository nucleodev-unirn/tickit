package br.edu.unirn.nds.chamado.equipamentos

import br.edu.unirn.nds.chamado.acesso.Usuario
import br.edu.unirn.nds.chamado.base.Setor

class EquipamentoSetor {

    Setor setor
    Equipamento equipamento

    Boolean ativo = Boolean.TRUE
    Usuario cadastradoPor
    Date dateCreated

    static constraints = {
        setor()
        equipamento()

        ativo()
        cadastradoPor ()
        dateCreated ()
    }
}

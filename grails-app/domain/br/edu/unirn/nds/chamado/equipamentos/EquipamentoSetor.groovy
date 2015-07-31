package br.edu.unirn.nds.chamado.equipamentos

import br.edu.unirn.nds.chamado.acesso.Usuario
import br.edu.unirn.nds.chamado.base.Setor

class EquipamentoSetor {

    Setor setor
    Equipamento equipamento

    Usuario cadastradoPor
    Date dateCreated

    static constraints = {
        setor()
        equipamento()

        cadastradoPor ()
        dateCreated ()
    }

    static marshalling = {
        shouldOutputVersion false
        shouldOutputClass false
        serializer {
            dateCreated { value, json ->
                json.value(value.dateCreated?.format("dd/MM/yyyy HH:mm"))
            }
            cadastradoPor { value, json ->
                json.value(value.cadastradoPor?.login)

            }
        }
        virtual{
            nomeSetor{ value, json ->
                json.value(value.setor?.nome)
            }
        }
    }
}

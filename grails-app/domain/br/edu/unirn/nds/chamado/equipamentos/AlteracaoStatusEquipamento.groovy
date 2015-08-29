package br.edu.unirn.nds.chamado.equipamentos

import br.edu.unirn.nds.chamado.acesso.Usuario

class AlteracaoStatusEquipamento {

    String observacao
    StatusEquipamento statusEquipamento
    Equipamento equipamento

    Date dateCreated

    Usuario cadastradoPor

    static constraints = {
        observacao()
        statusEquipamento()
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
                json.value(value.cadastradoPor?.matricula)

            }
        }
        virtual{
            status{ value, json ->
                json.value(value.statusEquipamento?.nome)
            }
        }
    }
}

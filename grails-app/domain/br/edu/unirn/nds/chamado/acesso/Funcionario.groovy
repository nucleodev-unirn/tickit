package br.edu.unirn.nds.chamado.acesso

import br.edu.unirn.nds.chamado.base.Pessoa
import br.edu.unirn.nds.chamado.base.Setor

class Funcionario {

    String matricula
    Pessoa pessoa
    String ramal
    Setor setor

    static constraints = {
        matricula()
        pessoa()
        ramal(nullable: true)
        setor(nullable: true)
    }

    @Override
    String toString() {
        "${pessoa} - ${matricula}"
    }
}

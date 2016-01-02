package br.edu.unirn.nds.chamado.problema

import br.edu.unirn.nds.chamado.acesso.Usuario
import br.edu.unirn.nds.chamado.base.Setor

class Problema {

    String titulo
    String orientacao
    Setor setor

    Date dateCreated
    Usuario cadastradoPor

    static constraints = {
        titulo()
        orientacao nullable: true
        setor nullable: true
        cadastradoPor()
        dateCreated()
    }

    @Override
    String toString() {
        "${titulo} - ${setor?:'SEM SETOR'}"
    }
}

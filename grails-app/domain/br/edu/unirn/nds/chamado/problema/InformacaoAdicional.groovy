package br.edu.unirn.nds.chamado.problema

import br.edu.unirn.nds.chamado.acesso.Usuario

class InformacaoAdicional {

    String nome
    String descricao

    Date dateCreated
    Usuario cadastradoPor

    static constraints = {
        nome()
        descricao(nullable: true)
        cadastradoPor()
        dateCreated()
    }

    @Override
    String toString() {
        nome
    }
}
